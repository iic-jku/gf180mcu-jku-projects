// SPDX-FileCopyrightText: © 2025 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`include "../macros/tiny_tone/verilog/src/tiny_tone.v"

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
	// ToDo
	// ======================================================
	
	// Octowave - Max Golser
	// ToDo
	// ======================================================
	
	// TinyWhisper RISC-V - Jonathan Hager (JMU)
	// ToDo
	// ======================================================
	
	// Tetris - Dominik Brandstetter & HTL Leonding
	// ToDo
	// ======================================================
	
	// ======================================================
	// STUDENT PROJECTS
	// ======================================================
	// TinyBF - Rene Hahn
	// ToDo
	// ======================================================
	
	// SAR ADC Controller - Ilir Shala
	// ToDo
	// ======================================================
	
	// Led Spinner - Tim Tremetsberger
	// ToDo
	// ======================================================
	
	// TinyToneGen - Felix Feierabend
	// ToDo
	// ======================================================
	
	// Digital Filter - Gregor Flachs
	// ToDo
	// ======================================================
	
	// Traffic Light Controller - Maximilian Kernmaier
	// ToDo
	// ======================================================
	
	// VGA Clock - Timo Laimer
	// ToDo
	// ======================================================
	
    // ======================================================
	// OUTPUT ASSIGNMENT
	// ======================================================
	assign bidir_out[40:1] = 40'd0;
    assign bidir_out[0] = sound_out;
	// ======================================================
endmodule

`default_nettype wire
