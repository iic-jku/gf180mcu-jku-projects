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

`default_nettype none
`ifndef __SEG_DRIVER__
`define __SEG_DRIVER__

module seg_driver (
    input  wire [2:0] pos_i,  // wheel pos
    output reg  [6:0] seg_o   // register with all segments (exept dp)
);
  always @(*) begin
    seg_o = 0; // default off
    case (pos_i)
	3'd0: seg_o[0] = 1; // A
	3'd1: seg_o[1] = 1; // B
	3'd2: seg_o[2] = 1; // C
	3'd3: seg_o[3] = 1; // D
	3'd4: seg_o[4] = 1; // E
	3'd5: seg_o[5] = 1; // F
	default: seg_o = 7'b0000000;
    endcase
    // G is always off
    seg_o[6] = 0;
  end
endmodule
`endif
`default_nettype wire
