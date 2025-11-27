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

`ifndef __GUESS_EVAL__
`define __GUESS_EVAL__
`default_nettype none

module guess_eval (
    input  wire [2:0] pos_i,
    input  wire       running_i, // 1=spinning, 0=stopped
    input  wire [5:0] guess_i,
    output reg        dp_o
);
    always @(*) begin
        if (running_i) begin
            dp_o = 1'b0;
        end else begin
            // when stopped -> check if guess is correct
            case (pos_i)
                3'd0: dp_o = guess_i[0];
                3'd1: dp_o = guess_i[1];
                3'd2: dp_o = guess_i[2];
                3'd3: dp_o = guess_i[3];
                3'd4: dp_o = guess_i[4];
                3'd5: dp_o = guess_i[5];
                default: dp_o = 1'b0;
            endcase
        end
    end

endmodule
`endif
`default_nettype wire
