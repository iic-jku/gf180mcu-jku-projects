//-----------------------------------------------------------------------------
//  Testbench:  sar_adc_8bit_tb
//  Description:
//     Testbench for the SAR ADC with SPI output, oversampling, and 
//     comparator synchronizer (entity: sar_adc_spi_oversampling).
//
//	 Purpose:
//     This simulation verifies the functionality of the digital SAR controller
//     and its oversampling behavior by emulating the analog comparator logic.
//
//  Simulation Features:
//     - 25 MHz system clock
//     - Active-low reset
//     - Single conversion trigger ("start" pulse)
//     - Analog input simulated as an integer (vin_level)
//     - Simple noise model (vin_level drifts slightly over time)
//     - Digital comparator emulation (comp_in)
//
//  Expected Behavior:
//     - DAC bits (dac_bits[7:0]) show the SAR search pattern.
//     - comp_in changes according to the simulated analog level.
//     - After several conversions (based on OSR), the averaged value
//       is shifted out via SPI (spi_miso/spi_sclk).
//     - The signal 'done' pulses high at the end of the sequence.
//
//  Author: Ilir Shala
//  Date  : 2025-11-26
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module sar_adc_8bit_tb;

    // ----------------------------------------------------------------
    // Signal Declarations
    // ----------------------------------------------------------------
    reg         clk      = 1'b0;
    reg         reset_n  = 1'b0;
    reg         start    = 1'b0;
    reg         comp_in  = 1'b0;
    wire [7:0]  dac_bits;
    wire        spi_miso;
    wire        spi_sclk;
    wire        done;

    // Clock period: 25 MHz -> 40 ns
    localparam integer Tclk = 40;

    // Simulated analog input level (represents analog voltage)
    integer vin_level = 140;

    // ----------------------------------------------------------------
    // VCD dump for GTKWave
    // ----------------------------------------------------------------
    initial begin
        $dumpfile("sar_adc_8bit_tb.vcd");
        $dumpvars(0, sar_adc_8bit_tb);
    end

    // ----------------------------------------------------------------
    // Device Under Test (DUT)
    // ----------------------------------------------------------------
	sar_adc_spi_oversampling uut (
		.clk      (clk),
		.reset_n  (reset_n),
		.start    (start),
		.comp_in  (comp_in),
		.dac_bits (dac_bits),
		.spi_miso (spi_miso),
		.spi_sclk (spi_sclk),
		.done     (done)
	);

    // ----------------------------------------------------------------
    // Clock Generation (25 MHz)
    // ----------------------------------------------------------------
    always #(Tclk/2) clk = ~clk;

    // ----------------------------------------------------------------
    // Stimulus Process
    // Generates reset, start pulses, and multiple conversions
    // ----------------------------------------------------------------
    initial begin
        // Assert reset
        reset_n = 1'b0;
        #(200);
        reset_n = 1'b1;
        #(500);

        // Start first conversion
        start = 1'b1;
        #(Tclk);
        start = 1'b0;

        // Trigger another conversion later
        #(100_000);       // 100 µs
        start = 1'b1;
        #(Tclk);
        start = 1'b0;

        // End of simulation
        #(50_000);
        $finish;
    end

    // ----------------------------------------------------------------
    // Comparator Model (Emulates Analog Behavior)
    // Adds small "noise" drift to vin_level and generates comp_in
    // ----------------------------------------------------------------
    integer dac_val;
    integer tick_cnt = 0;

    always @(posedge clk) begin
        // Simple "noise" generator: every 100 cycles adjust vin_level slightly
        tick_cnt = tick_cnt + 1;
        if (tick_cnt == 100) begin
            tick_cnt  = 0;
            vin_level = 140 + ((vin_level + 1) % 20);  // cycles 140..159
        end

        dac_val = dac_bits;   // interpret dac_bits as unsigned integer

        if (vin_level > dac_val)
            comp_in <= 1'b1;
        else
            comp_in <= 1'b0;
    end

endmodule
