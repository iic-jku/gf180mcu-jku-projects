`timescale 1us/1ns
`include "../src/pwm8.v"

module tb_pwm8;
    reg clk = 1'b0;
    reg [7:0] duty_cycle = 10'd127;
    wire pwm;

    pwm uut(
        .clk(clk),
        .duty_cycle(duty_cycle),
        .pwm_o(pwm)
    );

    always #1 clk = ~clk;

    initial begin
        $dumpfile("pwm.vcd");
        $dumpvars(0, tb_pwm);
        #500 duty_cycle <= 10'd170;
        #500 $finish;
    end

endmodule