// Author: Felix Feierabend

`include "./signal_gen.v"
`include "./clock_scaler.v"

module tiny_tonegen (
    input  wire       clk,      	// clock
    input  wire       rst_n,    	// reset_n - low to reset
	input  wire       ena,      	// will go high when the design is enabled
	input  wire [2:0] address_in,   
	input  wire 	  write_strobe_in,    
	input  wire [4:0] data_in,
	
	output wire 	  signal_bit_out
);

wire clk_scaled;
wire signal_bit;
wire [6:0] debug_bits;

clock_scale clk_scaler (
    .en(ena),
    .clk(clk),
    .rst(rst_n),
    .scale_factor(11'd50),
    .clk_out(clk_scaled)
);

signal_generator signal_gen (
    .clk(clk_scaled),
    .write_strobe(write_strobe_in),
    .address(address_in),
    .data(data_in),
    .signal_out(signal_bit),
    .debug(debug_bits),
    .rst(~rst_n)
);

assign signal_bit_out = signal_bit;

endmodule