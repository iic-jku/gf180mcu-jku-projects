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

`default_nettype none

module spi_master (
    input wire clk,            // System clock (1 MHz)
    input wire rst_n,
    input wire start,          // Start transfer
    input wire [15:0] data_in, // 16 Bit to send
    output reg DIN,
    output reg SCLK,
    output reg busy
);

    reg [15:0] shift_reg;
    reg [3:0] bit_index;
    reg [1:0] clk_div;
    reg finished;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            shift_reg <= 16'b0;
            bit_index <= 4'd15; //start with MSB
            SCLK <= 0;
            DIN <= 0;
            busy <= 0;
            clk_div <= 0;
            finished <= 0;
        end else begin
            if (finished) begin
                finished <= 0;
                SCLK <= 0;
                busy <= 0;
            end else if (busy) begin
                clk_div <= clk_div + 1;
                if (clk_div == 2'd1) begin
                    clk_div <= 0;
                    SCLK <= ~SCLK;

                    if (!SCLK) begin
                        if (bit_index == 0) begin
                            finished <= 1;
                        end else begin
                            bit_index <= bit_index - 1;
                        end
                    end else begin
                        DIN <= shift_reg[bit_index];
                    end
                end
            end else if (start) begin
                busy <= 1;
                shift_reg <= data_in;
                bit_index <= 4'd15;
                DIN <= data_in[15];
                SCLK <= 0;
            end
        end
    end
endmodule
