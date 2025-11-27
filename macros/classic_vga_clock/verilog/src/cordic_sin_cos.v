// Copyright 2025 A Person
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//loosely based on cordic implementations for similar applications as found on github
//for example: https://github.com/ShanDash/Cordic-Algorithm/tree/main

module cordic_sin_cos (
    input clk,
    input start,
    input wire reset,
    input [8:0] i_angle,              // input angle in degrees
    output reg signed [8:0] sine_out, 
    output reg signed [8:0] cosine_out, 
    output reg done
);
/* verilator lint_off BLKSEQ */

    parameter I_MAX = 8; 
    reg [8:0] angle_table [0:7];
    reg signed [9:0] x, y, z;
    reg signed [9:0] x_temp, y_temp, z_temp;

    reg [3:0] iterCount;
    reg signed [9:0] input_angle;
    reg signed [8:0] angle;
    reg signed [8:0] j;

    localparam START = 2'b00,
            ITERATING = 2'b01,
            DONE = 2'b10;

    reg [1:0] quadrant;
    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= START;
            
            angle_table[0] = 9'd360;  // atan(1)
            angle_table[1] = 9'd213;  // atan(0.5)
            angle_table[2] = 9'd112;  // atan(0.25)
            angle_table[3] = 9'd57;  // atan(0.125)
            angle_table[4] = 9'd29;   // atan(0.0625)
            angle_table[5] = 9'd14;   // atan(0.03125)
            angle_table[6] = 9'd7;   // atan(0.015625)
            angle_table[7] = 9'd4;   // atan(0.0078125)
        end else begin
            case(state)
                START: begin
                    if (start) begin
                        /* verilator lint_off WIDTH */
                        input_angle = i_angle;
                        
                        if (input_angle == 360) input_angle = 0;
                        if (input_angle >= 180) input_angle = input_angle - 360;

                        j = input_angle;

                        if (j >= -180 && j <= -91) begin
                            angle = (180 + j);
                            quadrant = 2'b10;
                        end else if (j >= -90 && j <= -1) begin
                            angle = (-j);
                            quadrant = 2'b11;
                        end else if (j >= 0 && j <= 89) begin
                            angle = (j);
                            quadrant = 2'b00;
                        end else if (j >= 90 && j <= 179) begin
                            angle = (180 - j);
                            quadrant = 2'b01;
                        end
                        x = 9'd155; // CORDIC gain
                        y = 9'd0;
                        z = angle <<< 3;
                        iterCount = 0;
                        done = 0;
                        state <= ITERATING;
                        /* verilator lint_on WIDTH */
                    end
                end

                ITERATING: begin
                    /* verilator lint_off WIDTH */
                    if (z[9]) begin
                        x_temp = x + (y >>> iterCount);
                        y_temp = y - (x >>> iterCount);
                        z_temp = z + angle_table[iterCount];
                    end else begin
                        x_temp = x - (y >>> iterCount);
                        y_temp = y + (x >>> iterCount);
                        z_temp = z - angle_table[iterCount];
                    end
                    iterCount = iterCount + 1;
                    state <= DONE;
                    /* verilator lint_on WIDTH */
                end

                DONE: begin
                    /* verilator lint_off WIDTH */
                    x <= x_temp;
                    y <= y_temp;
                    z <= z_temp;
                    if (iterCount == I_MAX) begin
                        if (quadrant == 2'b00) begin
                            sine_out = y_temp;
                            cosine_out = x_temp;
                        end else if (quadrant == 2'b01) begin
                            sine_out = y_temp;
                            cosine_out = -x_temp;
                        end else if (quadrant == 2'b10) begin
                            sine_out = -y_temp;
                            cosine_out = -x_temp;
                        end else begin
                            sine_out = -y_temp;
                            cosine_out = x_temp;
                        end
                        done = 1;
                        state <= START;
                        /* verilator lint_on WIDTH */
                    end else begin
                        state <= ITERATING;
                    end
                end
                default: begin
                    state <= START; 
                end
            endcase
        end
    end
endmodule
