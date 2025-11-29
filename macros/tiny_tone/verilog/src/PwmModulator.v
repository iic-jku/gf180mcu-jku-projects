// ============================================================
// PwmModulator.v
// Simple parameterized PWM generator
// Last edited: 14.10.2025
// Author: Jakob Schaumberger
// ============================================================


`default_nettype none
`ifndef __PWM_Gen__
`define __PWM_Gen__

module PwmModulator
# (
    parameter BW = 8
) (
    // inputs
    input wire clk_i,                    // clock
    input wire rst_i,                    // reset
    input wire [BW-1:0] period_i,        // Counter Period
    input wire [BW-1:0] dutyCycle_i,     // PWM output Duty-Cycle

    // outputs
    output wire pwm_o                    // PWM output Signal
);

// internal Signals
reg [BW-1:0] counterVal, next_counterVal;

// register process
always @(posedge clk_i or posedge rst_i) begin 
    if (rst_i == 1'b1) begin
        counterVal <= {BW{1'b0}};     // reset the PWM-Counter value
    end else begin
        counterVal <= next_counterVal;
    end
end 

// combinatorial process
always @(*) begin
    // default assignment
    next_counterVal = counterVal;

    if (counterVal >= period_i) begin
        next_counterVal = {BW{1'b0}};
    end else begin
        next_counterVal = counterVal + {{(BW-1){1'b0}}, 1'b1};
    end
end

// assign PWM-Counter value to PWM-Output
assign pwm_o = (counterVal < dutyCycle_i);

endmodule // PwmModulator

`endif
`default_nettype wire
