// Author: Felix Feierabend

`include "./signal_gen.v"
`include "./clock_scaler.v"

module tiny_tonegen (
	// VDD / VSS
	`ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif
	
	// Inputs
    input  wire       clk,      	// clock
    input  wire       rst_n,    	// reset_n - low to reset
	input  wire       ena,      	// will go high when the design is enabled
	input  wire [2:0] address_in,   
	input  wire 	  write_strobe_in,    
	input  wire [4:0] data_in,
	
	// Outputs
	output wire 	  signal_bit_out
);

	wire clk_scaled;
	wire signal_bit;

	clock_scale clk_scaler (
		.en(ena),
		.clk(clk),
		.rst(rst_n),
		.scale_factor(8'd25),
		.clk_out(clk_scaled)
	);

	signal_generator signal_gen (
		.clk(clk_scaled),
		.write_strobe(write_strobe_in),
		.address(address_in),
		.data(data_in),
		.signal_out(signal_bit),
		.rst(rst_n)
	);

	assign signal_bit_out = signal_bit;

endmodule