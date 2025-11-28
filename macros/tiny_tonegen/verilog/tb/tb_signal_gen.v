`timescale 10ns/10ns
`include "./signal_gen.v"

module tb_signal_gen;

    reg clk = 0;
    reg write_strobe = 0;
    reg [2:0] address = 0;
    reg [4:0] data = 0;
    reg rst = 0;

    wire signal;
    wire[6:0] debug;


    signal_generator uut (
        .clk(clk),
        .write_strobe(write_strobe),
        .address(address),
        .data(data),
        .rst(rst),
        .signal_out(signal),
        .debug(debug)
    );

    always #1 clk = ~clk;

    initial begin
        $dumpfile("tb_signal_gen.vcd");
        $dumpvars(0, tb_signal_gen);

        #1 rst = 1;
        #3 rst = 0;

        #4 address = 3'b000;
        #4 data = 5'b11100;
        #5 write_strobe = 1;
        #7 write_strobe = 0;

        #100000 $finish;
    end
    
endmodule