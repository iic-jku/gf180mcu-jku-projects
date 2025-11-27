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

`include "cordic_sin_cos.v"

module clockRenderer (
    input clk,
    input slow_clk,
    input reset,
    input [3:0] hour,     // 0–12
    input [5:0] minute,   
    input [5:0] second, 
    input [3:0] al_hour,
    input [5:0] al_minute,
    input  wire [9:0]  horizCounter,      
    input  wire [9:0]  vertCounter,     
    input  wire [9:0]  x_offset,     
    input  wire [9:0]  y_offset,    
    output reg         pixel_bw     
);
/* verilator lint_off BLKSEQ */

//framebuffer/memory
reg [31:0] framebuffer [0:31];

reg  cordic_start;
reg  cordic_busy;
wire cordic_done;
reg [5:0] i;
reg refresh_run;
reg done;
reg restart_inhibit;

reg [8:0] currAngle;
wire [8:0] sinW;
wire [8:0] cosW;

cordic_sin_cos cordicModule (
    .clk(clk), 
    .reset(reset), 
    .start(cordic_start), 
    .i_angle(currAngle), 
    .sine_out(sinW), 
    .cosine_out(cosW), 
    .done(cordic_done)
);

/* verilator lint_off WIDTH */
//clockhand angles
wire [8:0] second_angle = (second * 6);   
wire [8:0] minute_angle = (minute * 6);   
wire [8:0] hour_angle = ((hour * 60) + minute) / 2; //assuming hour cannot reach 12
wire [8:0] alarm_angle = (al_hour * 30) + ((al_minute / 10) * 6);   //given incrementation by 10min
/* verilator lint_on WIDTH */

reg [1:0] state;
localparam  DRAW_HRS = 2'b00, 
            DRAW_MINS = 2'b01, 
            DRAW_SECS = 2'b10, 
            DRAW_ALARM = 2'b11;

//lengths of clockhands
parameter MINUTE_LEN = 15;
parameter HOUR_LEN = 9;
parameter SEC_LEN = 13;
parameter ALARM_LEN = 6;

reg signed [12:0] j;
reg [4:0] scalingIterator;

localparam CENTER = 16;

reg signed [8:0] scaledCos;
reg signed [8:0] scaledSin;

task map_clockhand;
    input signed [8:0] sinT, cosT;
    input [4:0] scaleFactor;

    begin 
        /* verilator lint_off WIDTH */
        j = scaleFactor;
        if (sinT >= 0) begin
            scaledSin = ((sinT * j) >>> 8);
        end else begin
            scaledSin = ((sinT * j) / 256);
        end
        if (cosT >= 0) begin
            scaledCos = ((cosT * j) >>> 8);
        end else begin
            scaledCos = ((cosT * j) / 256);
        end

        framebuffer[32 - (CENTER + scaledCos)][32 - (CENTER + scaledSin)] = 1'b1;
        /* verilator lint_on WIDTH */
        cordic_busy = 1'b0;
    end
endtask

parameter SCALE = 14;
localparam DISP_WIDTH  = 32 * SCALE;
localparam DISP_HEIGHT = 32 * SCALE;

/* verilator lint_off WIDTH */
wire [9:0] h_adj = horizCounter - x_offset;
wire [9:0] v_adj = vertCounter - y_offset;

wire [4:0] fb_x = h_adj / SCALE;
wire [4:0] fb_y = v_adj / SCALE;
/* verilator lint_on WIDTH */

wire in_display_area = (h_adj < DISP_WIDTH) && (v_adj < DISP_HEIGHT);

reg        clr_run;
reg [4:0]  clr_idx; // 0..31

wire slow_edge = slow_clk & ~restart_inhibit;

always @(posedge clk or posedge reset) begin
    
    if (reset) begin
        
        // Clear framebuffer
        for (i = 0; i <= 6'd31; i = i + 1) begin
            /* verilator lint_off WIDTH */
            framebuffer[i] <= 32'b0;
            /* verilator lint_on WIDTH */
        end

        refresh_run     <= 1'b0;
        done            <= 1'b1;
        restart_inhibit <= 1'b0;

        state          <= DRAW_HRS;
        cordic_start   <= 1'b0;
        cordic_busy    <= 1'b0;
        scalingIterator <= 5'd1;

        // Clear process start
        clr_run        <= 1'b1;
        clr_idx        <= 5'd0;

    end else begin
        if (clr_run) begin
                framebuffer[clr_idx] <= 32'b0;
                if (clr_idx == 5'd31) begin
                    clr_run <= 1'b0;
                end else begin
                    clr_idx <= clr_idx + 5'd1;
                end
        end
        if (slow_edge && done) begin
            restart_inhibit <= 1'b1;
            refresh_run     <= 1'b1;
            done            <= 1'b0;

            clr_run         <= 1'b1;
            clr_idx         <= 5'd0;

            // Reset draw sequencing
            state           <= DRAW_HRS;
            scalingIterator <= 5'd1;
            cordic_busy     <= 1'b0;
            cordic_start    <= 1'b0;
        end
        else if (!slow_clk) begin
            restart_inhibit <= 1'b0;
        end
                
        if (refresh_run && !clr_run) begin
            case(state) 
                DRAW_HRS: begin
                    if (!cordic_busy) begin
                        /* verilator lint_off WIDTH */
                        currAngle <= hour_angle;
                        /* verilator lint_on WIDTH */
                        cordic_start <= 1'b1;
                        cordic_busy <= 1'b1;
                    end else begin
                        cordic_start <= 1'b0;
                        if (cordic_done) begin
                            map_clockhand(sinW, cosW, scalingIterator);
                            scalingIterator <= scalingIterator + 1;
                            if (scalingIterator == HOUR_LEN) begin
                                state <= DRAW_MINS;
                                scalingIterator <= 5'd1;
                            end
                        end
                    end
                end
                DRAW_MINS: begin
                    if (!cordic_busy) begin
                        /* verilator lint_off WIDTH */
                        currAngle <= minute_angle;
                        /* verilator lint_on WIDTH */
                        cordic_start <= 1'b1;
                        cordic_busy <= 1'b1;
                    end else begin
                        cordic_start <= 1'b0;
                        if (cordic_done) begin
                            map_clockhand(sinW, cosW, scalingIterator);
                            scalingIterator <= scalingIterator + 1;
                            if (scalingIterator == MINUTE_LEN) begin
                                state <= DRAW_SECS;
                                scalingIterator <= 5'd1;
                            end
                        end
                    end
                end
                DRAW_SECS: begin
                    if (!cordic_busy) begin
                        /* verilator lint_off WIDTH */
                        currAngle = second_angle;
                        /* verilator lint_on WIDTH */
                        cordic_start <= 1'b1;
                        cordic_busy <= 1'b1;
                    end else begin
                        cordic_start <= 1'b0;
                        if (cordic_done) begin
                            map_clockhand(sinW, cosW, scalingIterator);
                            scalingIterator <= scalingIterator + 1;
                            if (scalingIterator == SEC_LEN) begin
                                state <= DRAW_ALARM;
                                scalingIterator <= 5'd1;
                            end
                        end
                    end
                end
                DRAW_ALARM: begin
                    if (!cordic_busy) begin
                        /* verilator lint_off WIDTH */
                        currAngle = alarm_angle;
                        /* verilator lint_on WIDTH */
                        cordic_start <= 1'b1;
                        cordic_busy <= 1'b1;
                    end else begin
                        cordic_start <= 1'b0;
                        if (cordic_done) begin
                            map_clockhand(sinW, cosW, scalingIterator);
                            scalingIterator <= scalingIterator + 1;
                            if (scalingIterator == ALARM_LEN) begin
                                state = DRAW_HRS;
                                scalingIterator <= 5'd1;
                                refresh_run <= 1'b0;
                                done <= 1'b1;
                            end                            
                        end
                    end
                end
                default: begin
                    state <= DRAW_HRS;
                end
            endcase
        end
        if (in_display_area && done && !clr_run) begin
            pixel_bw <= framebuffer[fb_y][32 - fb_x];
        end
        else begin
            pixel_bw <= 1'b0; 
        end
    end
end
/* verilator lint_on BLKSEQ */
endmodule
