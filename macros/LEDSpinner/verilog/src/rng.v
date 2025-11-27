// Copyright 2025 Tim Tremetsberger
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE−2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`ifndef __RNG__
`define __RNG__
`default_nettype none

module rng (
    input  wire       clk_i,
    input  wire       rst_i,
    input  wire       en_i,
    output reg [3:0]  lfsr_o // 1..15
);
    // polynom x^4 + x + 1, linear feedback shift register
    wire feedback = lfsr_o[3] ^ lfsr_o[0];
    // random value will be between 1 and 15

    always @(posedge clk_i) begin
        if (rst_i) begin
            lfsr_o <= 4'b1011; // random starting value
        end else if (en_i) begin
            lfsr_o <= {lfsr_o[2:0], feedback}; // shift register to left by 1 and append new bit
            if ({lfsr_o[2:0], feedback} == 4'b0000)
                lfsr_o <= 4'b1001; // avoid all-zeros
        end
    end

endmodule
`endif
`default_nettype wire
