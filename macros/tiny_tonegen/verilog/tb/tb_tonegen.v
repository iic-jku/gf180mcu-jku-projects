`timescale 1us/1ns
`include "../src/tonegen.v"

module tb_tonegen;

    reg clk = 1'b0;
    reg enable = 1;
    reg rst = 1'b0;
    wire wave;

    tonegen uut(
        .clk(clk), 
        .period(12'd20), 
        .wave(wave),
        .enable(enable),
        .rst(rst)
    );

    always #1 clk = ~clk;   // 1 MHz sim clock
    initial begin
        $dumpfile("tonegen.vcd");
        $dumpvars(0, tb_tonegen);
        #1 rst = 1'b1;
        #2 rst = 1'b0;
        #5000 $finish;
    end
    
endmodule