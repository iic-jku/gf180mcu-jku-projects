// Copyright 2025 Maximilian Kernmaier
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

module clk_enable #(
    parameter integer INPUT_FREQ  = 1000000,
    parameter integer TARGET_FREQ = 10
)(
    input  wire clk,
    input  wire rst_n,
    output reg  ena_pulse 
);
    localparam DIV = INPUT_FREQ / TARGET_FREQ;

    reg [31:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter   <= 0;
            ena_pulse <= 0;
        end else begin
            if (counter >= DIV-1) begin
                counter   <= 0;
                ena_pulse <= 1'b1;  
            end else begin
                counter   <= counter + 1;
                ena_pulse <= 1'b0;
            end
        end
    end
endmodule
