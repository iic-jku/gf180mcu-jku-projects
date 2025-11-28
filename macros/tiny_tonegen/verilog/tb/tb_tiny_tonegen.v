`timescale 1ms/1ms
`include "./tiny_tonegen.v"

module tb_tiny_tonegen;
    
    reg [7:0] ui_in;
    wire [7:0] uo_out;
    reg [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    reg       ena;      
    reg       clk;      
    reg       rst_n;

    tiny_tonegen dut (
        .clk(clk),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .rst_n(rst_n)
    );

    always #1 clk = ~clk;

    initial begin
        #10 clk = 0;
        #10 rst_n = 0;
        #10 ena = 0;
        #10 ui_in = 8'h00;
        #10 uio_in = 8'h00;

        $dumpfile("tiny_tonegen.vcd");
        $dumpvars(0, tiny_tonegen);

        #5 rst_n = 1;
        #10 ena = 1;
        $display("Starting stimulus loop...");

        #50 ui_in = 8'b1;

        #200 $finish;
    end


endmodule