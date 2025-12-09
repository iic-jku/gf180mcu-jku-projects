`timescale 1ns / 1ns // `timescale <time_unit> / <time_precision>

`include "../src/tiny_tonegen.v"
`include "../src/lfsr.v"
`include "../src/mixer.v"
`include "../src/clock_scaler.v"
`include "../src/pwm8.v"
`include "../src/adsr.v"
`include "../src/signal_gen.v"
`include "../src/mult4x4.v"

module tb_tiny_tonegen;
    reg clk = 1'b0;
    reg write_strb = 0;
    reg [2:0] address = 2'b0;
    reg [4:0] data = 4'b0;
    reg rst_n = 0;
    reg ena = 1;
    wire signal;

    tiny_tonegen dut (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .address_in(address),
        .write_strobe_in(write_strb),
        .data_in(data),
        .signal_bit_out(signal_bit_out)
    );

    always #20 clk = ~clk;

    initial begin
		$dumpfile("tb_tiny_tonegen.vcd");
		$dumpvars;	
		/* verilator lint_off STMTDLY */
		#40 rst_n = 1'b1; // deassert reset
        #50 address = 3'b000; data = 5'b00110;
        #51 write_strb = 1;
        #5051 write_strb = 0;
        #12000 address = 3'b010; data = 5'b01011;
        #12001 write_strb = 1;
        #17001 write_strb = 0;
		#100000000 $finish; // finish
		/* verilator lint_on STMTDLY */
	end
endmodule