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
    assign bidir_oe = '1;
    assign bidir_cs = '0;
    assign bidir_sl = '0;
    assign bidir_ie = ~bidir_oe;
    assign bidir_pu = '0;
    assign bidir_pd = '0;
    
    logic _unused;
    assign _unused = &bidir_in;
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
		.data_i(input_in[7]),
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
		.uart_rx(input_in[11]),
		.uart_tx(uart_tx_o),
		.channel_o(channel_o)
	);
	// ======================================================
	
	// TinyWhisper RISC-V - Jonathan Hager (JMU)
	// ToDo
	// tinywhisper_riscv tinywhisper_riscv (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .reset(rst_n),
		// .so(ToDo),
		// .si(ToDo),
		// .sclk(ToDo),
		// .sram_ce(ToDo),
		// .sda_i(ToDo),
		// .sda_o(ToDo),
		// .sda_oe(ToDo),
		// .scl(ToDo),
		// .rx(ToDo),
		// .tx(ToDo),
		// .gpio_in(ToDo),
		// .gpio_out(ToDo),
		// .cos_ds(ToDo),
		// .cos_ds_n(ToDo),
		// .sin_ds(ToDo),
		// .sin_ds_n(ToDo),
		// .lo_i(ToDo),
		// .lo_q(ToDo),
		// .lo_ix(ToDo),
		// .lo_qx(ToDo)
	// );
	// ======================================================
	
	// Tetris - Dominik Brandstetter & HTL Leonding
	// ToDo
	// tetris tetris (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .CLK_i(clk),
		// .reset_i(rst_n),
		// .up_r_i(ToDo),
		// .down_r_i(ToDo),
		// .left_r_i(ToDo),
		// .right_r_i(ToDo),
		// .game_speed_i(ToDo),
		// .Data_o(ToDo),
		// .hsync_o(ToDo),
		// .vsync_o(ToDo),
		// .video_active_o(ToDo),
		// .pix_clk_o(ToDo)
	// );
	// ======================================================
	
	// ======================================================
	// STUDENT PROJECTS
	// ======================================================
	// Multiplexer
	// ToDo
	// multiplexer multiplexer (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .design_sel_in(ToDo),
		// .mux_out(ToDo),
		// .uio_in(ToDo),
		// .ui_in(ToDo),
		// .dac_bits_in(ToDo),
		// .spi_miso_in(ToDo),
		// .spi_sclk_in(ToDo),
		// .done_in(ToDo),
		// .seg_bits_in(ToDo),
		// .dp_on_in(ToDo),
		// .signal_bit_in(ToDo),
		// .data_in(ToDo),
		// .car_red_light_in(ToDo),
		// .car_yellow_light_in(ToDo),
		// .car_green_light_in(ToDo),
		// .ped_red_light_in(ToDo),
		// .ped_green_light_in(ToDo),
		// .DIN_in(ToDo),
		// .CS_in(ToDo),
		// .SCLK_in(ToDo),
		// .pushed_left_in(ToDo),
		// .pushed_right_in(ToDo),
		// .Data_i(ToDo),
		// .hsync_i(ToDo),
		// .vsync_i(ToDo),
		// .video_active_i(ToDo),
		// .pix_clk_i(ToDo),
		// .buzzer_in(ToDo),
		// .vga_horizSync_in(ToDo),
		// .vga_vertSync_in(ToDo),
		// .black_white_in(ToDo)
	// );
	// ======================================================
	
	// TinyBF - Rene Hahn
	// ToDo
	// decimator_ser_top decimator_ser_top (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .rst_n(rst_n),
		// .ui_in(ToDo),
		// .uio_out(ToDo),
		// .uo_out(ToDo)
	// );
	// ======================================================
	
	// SAR ADC Controller - Ilir Shala
	// ToDo
	// sar_adc_spi_oversampling sar_adc_spi_oversampling (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .reset_n(rst_n),
		// .start(ToDo),
		// .comp_in(ToDo),
		// .dac_bits(ToDo),
		// .spi_miso(ToDo),
		// .spi_sclk(ToDo),
		// .done(ToDo)
	// );
	// ======================================================
	
	// Led Spinner - Tim Tremetsberger
	// ToDo
	// led_spinner led_spinner (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .rst_n(rst_n),
		// .speed_bits_in(ToDo),
		// .stop_wheel_in(ToDo),
		// .guess_bits_in(ToDo),
		// .seg_bits_out(ToDo),
		// .dp_on_out(ToDo)
	// );
	// ======================================================
	
	// TinyToneGen - Felix Feierabend
	// ToDo
	// tiny_tonegen tiny_tonegen (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .rst_n(rst_n),
		// .ena(ToDo),
		// .address_in(ToDo),
		// .write_strobe_in(ToDo),
		// .data_in(ToDo),
		// .signal_bit_out(ToDo)
	// );
	// ======================================================
	
	// Digital Filter - Gregor Flachs
	// ToDo
	// df_digital_filter df_digital_filter (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .rst_n(rst_n),
		// .ena(ToDo),
		// .address_in(ToDo),
		// .write_strobe_in(ToDo),
		// .data_in(ToDo),
		// .signal_bit_out(ToDo)
	// );
	// ======================================================
	
	// Traffic Light Controller - Maximilian Kernmaier
	// ToDo
	// traffic_light traffic_light (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .rst_n(rst_n),
		// .switch_traffic_light_on_in(ToDo),
		// .ped_request_left_in(ToDo),
		// .ped_request_right_in(ToDo),
		// .car_red_light_out(ToDo),
		// .car_yellow_light_out(ToDo),
		// .car_green_light_out(ToDo),
		// .ped_red_light_out(ToDo),
		// .ped_green_light_out(ToDo),
		// .DIN_out(ToDo),
		// .CS_out(ToDo),
		// .SCLK_out(ToDo),
		// .pushed_left_out(ToDo),
		// .pushed_right_out(ToDo)
	// );
	// ======================================================
	
	// VGA Clock - Timo Laimer
	// ToDo
	// classic_vga_clock classic_vga_clock (
		// `ifdef USE_POWER_PINS
        // .VDD(VDD),
		// .VSS(VSS),
		// `endif
		// .clk(clk),
		// .reset_n(rst_n),
		// .hour_in(ToDo),
		// .min_in(ToDo),
		// .sec_in(ToDo),
		// .al_in(ToDo),
		// .al_on_off_toggle_in(ToDo),
		// .buzzer_out(ToDo),
		// .vga_horizSync_out(ToDo),
		// .vga_vertSync_out(ToDo),
		// .black_white_out(ToDo)
	// );
	// ======================================================
	
    // ======================================================
	// OUTPUT ASSIGNMENT
	// ======================================================
	assign bidir_out[40:37] = 4'd0;
	assign bidir_out[36] = channel_o[7];
	assign bidir_out[35] = channel_o[6];
	assign bidir_out[34] = channel_o[5];
	assign bidir_out[33] = channel_o[4];
	assign bidir_out[32] = channel_o[3];
	assign bidir_out[31] = channel_o[2];
	assign bidir_out[30] = channel_o[1];
	assign bidir_out[29] = channel_o[0];
	assign bidir_out[28] = uart_tx_o;
	assign bidir_out[27] = dec_data_o;
	assign bidir_out[26] = frame_sync_o;
	assign bidir_out[25:8] = 18'd0;
    assign bidir_out[7] = sound_out;
	assign bidir_out[6:0] = 7'd0;
	// ======================================================
endmodule

`default_nettype wire
