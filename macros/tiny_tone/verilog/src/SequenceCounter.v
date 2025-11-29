// ============================================================
// SequenceCounter.v
// Steps through a sequence of notes on each strobe pulse
// Last edited: 14.10.2025
// Author: Jakob Schaumberger
// ============================================================

`default_nettype none
`ifndef __SEQ_COUNTER__
`define __SEQ_COUNTER__

module SequenceCounter 
# (
    parameter BW      = 8,              // Bitwitdh of note index
    parameter SEQ_LEN = 8               // number of notes in sequence
) (
    // Inputs
    input wire clk_i,                   // input clock
    input wire rst_i,                   // input reset
    input wire strb_i,                  // input strobe signal

    // Outputs
    output wire[BW-1:0] noteIndex_o     // current note index output
);


localparam STATE_IDLE = 1'b0;
localparam STATE_PLAY = 1'b1;

reg current_state; 
reg next_state;

reg [BW-1:0] counterVal;
reg [BW-1:0] next_counterVal;

// register process
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i == 1'b1) begin
        counterVal    <= {BW{1'b0}};
        current_state <= STATE_IDLE;
    end else begin
        current_state <= next_state;
        counterVal    <= next_counterVal;
    end
end 

// combinatorial process
always @(*) begin
    // default assignments
    next_state      = current_state;
    next_counterVal = counterVal;

    case (current_state)
        STATE_IDLE: begin
            // on reset initialize sequence
            next_counterVal = {BW{1'b0}};
            next_state = STATE_PLAY;
        end

        STATE_PLAY: begin
            // on strobe, advance sequence counter
            if (strb_i) begin 
                if (counterVal == SEQ_LEN-1) begin
                    next_counterVal = 0;
                end 
                else begin
                    next_counterVal = counterVal + 1'b1;
                end
            end
        end

        default: begin 
            next_state      = STATE_IDLE;
            next_counterVal = {BW{1'b0}};
        end
    endcase
end

assign noteIndex_o = counterVal;

endmodule   // SequenceCounter

`endif
`default_nettype wire
