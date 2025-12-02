// SPDX-FileCopyrightText: © 2025 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module chip_core #(
    parameter NUM_INPUT_PADS,
    parameter NUM_BIDIR_PADS
    )(
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif
    
    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)
    
    input  wire [NUM_INPUT_PADS-1:0] input_in,   // Input value
    output wire [NUM_INPUT_PADS-1:0] input_pu,   // Pull-up
    output wire [NUM_INPUT_PADS-1:0] input_pd,   // Pull-down

    input  wire [NUM_BIDIR_PADS-1:0] bidir_in,   // Input value
    output wire [NUM_BIDIR_PADS-1:0] bidir_out,  // Output value
    output wire [NUM_BIDIR_PADS-1:0] bidir_oe,   // Output enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_cs,   // Input type (0=CMOS Buffer, 1=Schmitt Trigger)
    output wire [NUM_BIDIR_PADS-1:0] bidir_sl,   // Slew rate (0=fast, 1=slow)
    output wire [NUM_BIDIR_PADS-1:0] bidir_ie,   // Input enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_pu,   // Pull-up
    output wire [NUM_BIDIR_PADS-1:0] bidir_pd    // Pull-down
);
    // ======================================================
	// IO SETTINGS
	// ======================================================
	// See here for usage: https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/IO/gf180mcu_fd_io/digital.html
    // Disable pull-up and pull-down for input
    assign input_pu = '0;
    assign input_pd = '0;
	// ======================================================
	
    // Set the bidir as output
    assign bidir_oe[NUM_BIDIR_PADS-1:18] = '1;
	assign bidir_oe[16:0] = '1;
    assign bidir_cs = '0;
    assign bidir_sl = '0;
    assign bidir_ie = ~bidir_oe;
    assign bidir_pu = '0;
    assign bidir_pd = '0;
    
    logic _unused;
    assign _unused = &{bidir_in[NUM_BIDIR_PADS-1:18], bidir_in[16:0]};
	// ======================================================
	
	// ======================================================
	// MAIN PROJECTS
	// ======================================================
	// TinyTone (Sanity Bring-Up Test) - Jakob Schaumberger
	logic sound_out;
	
	tiny_tone tiny_tone (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_n(rst_n),
		.sound_out(sound_out)
	);
	// ======================================================
	
	// Decimation Filter - Michael Köfinger
	logic dec_data_o;
	logic frame_sync_o;
	
	decimator_ser_top decimator_ser_top (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_b(rst_n),
		.data_i(input_in[5]),
		.data_o(dec_data_o),
		.frame_sync(frame_sync_o)
	);
	// ======================================================
	
	// Octowave - Max Golser
	logic uart_tx_o;
	logic [7:0] channel_o;
	
	octowave octowave (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clock_i(clk),
		.reset_n_i(rst_n),
		.uart_rx(input_in[6]),
		.uart_tx(uart_tx_o),
		.channel_o(channel_o)
	);
	// ======================================================
	
	// TinyWhisper RISC-V - Jonathan Hager (JMU)
	logic si;
	logic sclk;
	logic sram_ce;
	logic sda_o;
	logic sda_oe;
	logic scl;
	logic tx;
	logic [3:0] gpio_out;
	logic cos_ds;
    logic cos_ds_n;
    logic sin_ds;
    logic sin_ds_n;
    logic lo_i;
    logic lo_q;
    logic lo_ix;
    logic lo_qx;
	
	tinywhisper_riscv tinywhisper_riscv (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.reset(rst_n),
		.spi_slow_mode(input_in[0]),
		.so(input_in[2]),
		.si(si),
		.sclk(sclk),
		.sram_ce(sram_ce),
		.sda_i(bidir_in[17]),
		.sda_o(sda_o),
		.sda_oe(sda_oe),
		.scl(scl),
		.rx(input_in[1]),
		.tx(tx),
		.gpio_in(input_in[6:3]),
		.gpio_out(gpio_out),
		.cos_ds(cos_ds),
		.cos_ds_n(cos_ds_n),
		.sin_ds(sin_ds),
		.sin_ds_n(sin_ds_n),
		.lo_i(lo_i),
		.lo_q(lo_q),
		.lo_ix(lo_ix),
		.lo_qx(lo_qx)
	);
	// ======================================================
	
	// Tetris - Dominik Brandstetter & HTL Leonding
	logic [5:0] tetris_data_o;
	logic tetris_hsync_o;
	logic tetris_vsync_o;
	logic tetris_video_active_o;
	logic tetris_pix_clk_o;
	
	tetris tetris (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.CLK_i(clk),
		.reset_i(rst_n),
		.up_r_i(input_in[11]),
		.down_r_i(input_in[10]),
		.left_r_i(input_in[9]),
		.right_r_i(input_in[8]),
		.game_speed_i(input_in[7]),
		.Data_o(tetris_data_o),
		.hsync_o(tetris_hsync_o),
		.vsync_o(tetris_vsync_o),
		.video_active_o(tetris_video_active_o),
		.pix_clk_o(tetris_pix_clk_o)
	);
	// ======================================================
	
	// ======================================================
	// STUDENT PROJECTS
	// ======================================================
	// Multiplexer
	logic [10:0] mux_out;
	
	multiplexer multiplexer (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.design_sel_in(input_in[14:12]),
		.mux_out(mux_out),
		.uio_in(uio_out),
		.ui_in(uo_out),
		.dac_bits_in(dac_bits),
		.spi_miso_in(spi_miso),
		.spi_sclk_in(spi_sclk),
		.done_in(done),
		.seg_bits_in(seg_bits_out),
		.dp_on_in(dp_on_out),
		.signal_bit_in(signal_bit_out),
		.data_in(dataout),
		.car_red_light_in(car_red_light_out),
		.car_yellow_light_in(car_yellow_light_out),
		.car_green_light_in(car_green_light_out),
		.ped_red_light_in(ped_red_light_out),
		.ped_green_light_in(ped_green_light_out),
		.DIN_in(DIN_out),
		.CS_in(CS_out),
		.SCLK_in(SCLK_out),
		.pushed_left_in(pushed_left_out),
		.pushed_right_in(pushed_right_out),
		.Data_i(tetris_data_o),
		.hsync_i(tetris_hsync_o),
		.vsync_i(tetris_vsync_o),
		.video_active_i(tetris_video_active_o),
		.pix_clk_i(tetris_pix_clk_o),
		.buzzer_in(buzzer_out),
		.vga_horizSync_in(vga_horizSync_out),
		.vga_vertSync_in(vga_vertSync_out),
		.black_white_in(black_white_out)
	);
	// ======================================================
	
	// TinyBF - Rene Hahn
	logic [3:0] uio_out;
    logic [6:0] uo_out;
	
	rh_bf_top rh_bf_top (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_n(rst_n),
		.ui_in(input_in[10:7]),
		.uio_out(uio_out),
		.uo_out(uo_out)
	);
	// ======================================================
	
	// SAR ADC Controller - Ilir Shala
	logic [7:0] dac_bits;
	logic spi_miso;
	logic spi_sclk;
	logic done;
	
	sar_adc_spi_oversampling sar_adc_spi_oversampling (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.reset_n(rst_n),
		.start(input_in[8]),
		.comp_in(input_in[7]),
		.dac_bits(dac_bits),
		.spi_miso(spi_miso),
		.spi_sclk(spi_sclk),
		.done(done)
	);
	// ======================================================
	
	// Led Spinner - Tim Tremetsberger
	logic [6:0] seg_bits_out;
	logic dp_on_out;
	
	led_spinner led_spinner (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_n(rst_n),
		.speed_bits_in(input_in[11:8]),
		.stop_wheel_in(input_in[7]),
		.guess_bits_in(input_in[6:1]),
		.seg_bits_out(seg_bits_out),
		.dp_on_out(dp_on_out)
	);
	// ======================================================
	
	// TinyToneGen - Felix Feierabend
	logic signal_bit_out;
	
	tiny_tonegen tiny_tonegen (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_n(rst_n),
		.ena(input_in[11]),
		.address_in(input_in[10:8]),
		.write_strobe_in(input_in[7]),
		.data_in(input_in[6:2]),
		.signal_bit_out(signal_bit_out)
	);
	// ======================================================
	
	// Digital Filter - Gregor Flachs
	logic [7:0] dataout;
	
	df_digital_filter df_digital_filter (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.CLK(clk),
		.nRST(rst_n),
		.enconfig(input_in[11]),
		.configin(input_in[10:8]),
		.datain(input_in[7:0]),
		.dataout(dataout)
	);
	// ======================================================
	
	// Traffic Light Controller - Maximilian Kernmaier
	logic car_red_light_out;
	logic car_yellow_light_out;
	logic car_green_light_out;
	logic ped_red_light_out;
	logic ped_green_light_out;
	logic DIN_out;
	logic CS_out;
	logic SCLK_out;
	logic pushed_left_out;
	logic pushed_right_out;
	
	traffic_light traffic_light (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.rst_n(rst_n),
		.switch_traffic_light_on_in(input_in[11]),
		.ped_request_left_in(input_in[10]),
		.ped_request_right_in(input_in[9]),
		.car_red_light_out(car_red_light_out),
		.car_yellow_light_out(car_yellow_light_out),
		.car_green_light_out(car_green_light_out),
		.ped_red_light_out(ped_red_light_out),
		.ped_green_light_out(ped_green_light_out),
		.DIN_out(DIN_out),
		.CS_out(CS_out),
		.SCLK_out(SCLK_out),
		.pushed_left_out(pushed_left_out),
		.pushed_right_out(pushed_right_out)
	);
	// ======================================================
	
	// VGA Clock - Timo Laimer
	logic buzzer_out;
    logic vga_horizSync_out;
    logic vga_vertSync_out;
    logic black_white_out;
	
	classic_vga_clock classic_vga_clock (
		`ifdef USE_POWER_PINS
        .VDD(VDD),
		.VSS(VSS),
		`endif
		.clk(clk),
		.reset_n(rst_n),
		.hour_in(input_in[11]),
		.min_in(input_in[10]),
		.sec_in(input_in[9]),
		.al_in(input_in[8]),
		.al_on_off_toggle_in(input_in[7]),
		.buzzer_out(buzzer_out),
		.vga_horizSync_out(vga_horizSync_out),
		.vga_vertSync_out(vga_vertSync_out),
		.black_white_out(black_white_out)
	);
	// ======================================================
	
    // ======================================================
	// OUTPUT ASSIGNMENT
	// ======================================================
	// multiplexer
	assign bidir_out[40] = mux_out[3];
	assign bidir_out[39] = mux_out[2];
	assign bidir_out[38] = mux_out[1];
	assign bidir_out[37] = mux_out[0];
	
	// octowave
	assign bidir_out[36] = channel_o[7];
	assign bidir_out[35] = channel_o[6];
	assign bidir_out[34] = channel_o[5];
	assign bidir_out[33] = channel_o[4];
	assign bidir_out[32] = channel_o[3];
	assign bidir_out[31] = channel_o[2];
	assign bidir_out[30] = channel_o[1];
	assign bidir_out[29] = channel_o[0];
	assign bidir_out[28] = uart_tx_o;
	
	// decimator
	assign bidir_out[27] = dec_data_o;
	assign bidir_out[26] = frame_sync_o;
	
	// tinywhisper_riscv
	assign bidir_out[25] = gpio_out[3];
	assign bidir_out[24] = gpio_out[2];
	assign bidir_out[23] = gpio_out[1];
	assign bidir_out[22] = gpio_out[0];
	assign bidir_out[21] = si;
	assign bidir_out[20] = sclk;
	assign bidir_out[19] = sram_ce;
	assign bidir_out[18] = tx;
	assign bidir_out[17] = sda_o;
	assign bidir_oe[17]  = sda_oe;
	assign bidir_out[16] = scl;
	assign bidir_out[15] = lo_qx;
	assign bidir_out[14] = lo_ix;
	assign bidir_out[13] = lo_q;
	assign bidir_out[12] = lo_i;
	assign bidir_out[11] = sin_ds_n;
	assign bidir_out[10] = sin_ds;
	assign bidir_out[9] = cos_ds_n;
	assign bidir_out[8] = cos_ds;
	
	// tiny_tone
    assign bidir_out[7] = sound_out;
	
	// multiplexer
	assign bidir_out[6] = mux_out[10];
	assign bidir_out[5] = mux_out[9];
	assign bidir_out[4] = mux_out[8];
	assign bidir_out[3] = mux_out[7];
	assign bidir_out[2] = mux_out[6];
	assign bidir_out[1] = mux_out[5];
	assign bidir_out[0] = mux_out[4];
	// ======================================================
endmodule

`default_nettype wire
