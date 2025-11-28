module pwm8 (
    input clk,              // clock input
    input[7:0] duty_cycle,  // Duty cycle input
    input rst,
    output reg pwm_o = 0   // pwm output
);
    reg[7:0] clk_cnt = 0;   // counter of positive clk edges

    always @(posedge(clk) or posedge rst) begin
        if (rst) begin
            clk_cnt <= 8'b0;
            pwm_o <= 0;
        end else begin
            clk_cnt <= clk_cnt + 1;
            pwm_o <= (clk_cnt < duty_cycle) ? 1'b1 : 1'b0;     // pwm is 1 if clk_cnt is less than duty cycle, 0 otherwise
        end
    end
    
endmodule