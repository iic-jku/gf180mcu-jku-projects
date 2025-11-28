`timescale 1us/1ns
`include "../src/lfsr.v"

module tb_lfsr;
    reg clk_i = 1'b0;
    reg en_step_i = 1'b1;
    reg rst_i = 1'b0;
    wire noise;

    lfsr uut (
        .clk(clk_i), 
        .en_step(en_step_i), 
        .rst(rst_i), 
        .noise_out(noise)
    );

    always #1 clk_i = ~clk_i;

    initial begin
        $dumpfile("lfsr.vcd");
        $dumpvars(0, tb_lfsr);
        #200 $finish;
    end
endmodule