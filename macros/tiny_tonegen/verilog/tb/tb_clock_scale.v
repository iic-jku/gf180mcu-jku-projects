`timescale 1us/1ns
`include "../src/clock_scaler.v"

module tb_clk_scale;
    reg clk = 1'b0;
    reg [31:0] scale_factor = 32'd10;
    reg rst = 1'b0;
    wire clk_o;

    clock_scale uut(
        .clk(clk),
        .scale_factor(scale_factor),
        .clk_out(clk_o),
        .rst(rst)
    );

    always #1 clk = ~clk;

    initial begin
        $dumpfile("tb_clk_scale.vcd");
        $dumpvars(0, tb_clk_scale);
        #1 rst = 1;
        #2 rst = ~rst;
        #200 $finish;
    end 

endmodule;