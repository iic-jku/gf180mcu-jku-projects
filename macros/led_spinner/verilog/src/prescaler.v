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

`ifndef __PRESCALER__
`define __PRESCALER__
`default_nettype none

module prescaler (
    input  wire       clk_i,
    input  wire       rst_i,
    input  wire [3:0] speed_i,
    output wire       tick_o
);

    
    reg [31:0] cnt;
    reg [31:0] limit;

    always @(*) begin
        case (speed_i)
            4'b0000: limit = 32'd50000000; // 1 Hz
            4'b0001: limit = 32'd25000000; // 2 Hz
            4'b0011: limit = 32'd12500000; // 4 Hz
            4'b0111: limit = 32'd6250000; // 8 Hz
            4'b1111: limit = 32'd3125000; //16 Hz
            default: limit = 32'd50000; // 1kHz for testing
        endcase
    end

    always @(posedge clk_i) begin
        if (rst_i) begin
            cnt <= 0;
        end else begin
            if (cnt == (limit - 1))
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end

    assign tick_o = (cnt == (limit - 1)); // only 1 when count reaches limit-1

endmodule
`endif
`default_nettype wire
