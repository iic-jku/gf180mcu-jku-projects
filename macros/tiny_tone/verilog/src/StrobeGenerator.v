// ============================================================
// StrobeGenerator.v
// Simple strobe generator 
// Last edited: 14.10.2025
// Author: Jakob Schaumberger
// ============================================================

`default_nettype none
`ifndef __STRB_GENERATOR__
`define __STRB_GENERATOR__

module StrbGenerator
# (
    parameter BW = 8
) (
    // inputs
    input wire clk_i,                       // input clock
    input wire rst_i,                       // reset
    input wire [BW-1:0] counter_maxVal,     // maximum counter value

    // outputs
    output wire strb_o
);

reg [BW-1:0] counterVal;
reg [BW-1:0] next_counterVal;

// register process
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i == 1'b1) begin
        counterVal <= {BW{1'b0}};
    end else begin
        counterVal <= next_counterVal;
    end
end

// combinatorial process
always @(*) begin
    next_counterVal = counterVal;

    if (counterVal >= counter_maxVal) begin
        next_counterVal = {BW{1'b0}};
    end else begin
        next_counterVal = counterVal + 1'b1;
    end    
end

assign strb_o = (counterVal == counter_maxVal) && (counterVal != 0);

endmodule // StrbGenerator

`endif
`default_nettype wire

