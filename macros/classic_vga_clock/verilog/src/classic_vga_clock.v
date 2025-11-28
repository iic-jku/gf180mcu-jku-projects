// Copyright 2025 Timo Laimer
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

`include "button_debounce.v"
`include "clockRenderer.v"
`include "display_vga.v"

module classic_vga_clock (
    input wire clk,                 //31.25MHz
    input wire reset_n,             //Inverted reset line
    input wire hour_in,             //Hour increment button
    input wire min_in,              //Minute increment button 
    input wire sec_in,              //Second increment button
    input wire al_in,               //Alarmtime increment button
    input wire al_on_off_toggle_in, //Alarm On/Off toggle button

    output wire buzzer_out,         //Alarm buzzer output (!!! External Buffer + Driver required !!!)
    output wire vga_horizSync_out,  //Horizontal sync
    output wire vga_vertSync_out,   //Vertical sync
    output wire black_white_out     //black/white image line
);

/* verilator lint_off BLKSEQ */

wire reset = !reset_n;

reg sec_clock;
reg slow_clk;
reg buzzer_clk;

reg [5:0] seconds;
reg [5:0] minutes;
reg [3:0] hours;
reg [5:0] al_minutes;
reg [3:0] al_hours;
reg [24:0] sec_counter;
reg [18:0] slow_clk_counter;
reg [13:0] buzzer_clk_counter;
reg [7:0] bell_symb [0:7];

wire [9:0] x_pix;          // X position for actual pixel.
wire [9:0] y_pix;          // Y position for actual pixel.

reg [9:0] x_offs;
reg [9:0] y_offs;

wire video_visible_range;  //within drawing range
wire drawClockhandPx;

clockRenderer clockfaceRendering (.clk(clk), .slow_clk(slow_clk), .reset(reset), .hour(hours), .minute(minutes), .second(seconds), .al_hour(al_hours), .al_minute(al_minutes), .horizCounter(x_pix), .vertCounter(y_pix), .x_offset(x_offs), .y_offset(y_offs), .pixel_bw(drawClockhandPx));

display_vga vga_0 (.clk(clk), .sys_rst(reset), .hsync(vga_horizSync_out), .vsync(vga_vertSync_out), .horizPos(x_pix), .vertPos(y_pix), .active(video_visible_range));

reg [9:0] x_offset_bell;
reg [9:0] y_offset_bell;
parameter SCALE = 10;
localparam DISP_WIDTH  = 8 * SCALE;
localparam DISP_HEIGHT = 8 * SCALE;
/* verilator lint_off WIDTH */
wire [9:0] h_adj = x_pix - x_offset_bell;
wire [9:0] v_adj = y_pix - y_offset_bell;

wire [2:0] fb_bell_x = h_adj / SCALE;
wire [2:0] fb_bell_y = v_adj / SCALE;
/* verilator lint_on WIDTH */
wire in_display_area = (h_adj < DISP_WIDTH) && (v_adj < DISP_HEIGHT);

wire sec_adj_input, min_adj_input, hrs_adj_input, al_adj_input, al_on_off_toggle_line;
reg al_on, alarm;
assign buzzer_out = (alarm && sec_clock) ? buzzer_clk : 1'b0;

wire bell_px = bell_symb[fb_bell_y][8 - fb_bell_x];

// Composite draw signal
wire draw_bell = in_display_area && al_on && bell_px;
wire draw = drawClockhandPx | draw_bell;

assign black_white_out = video_visible_range && draw ? 1'b1 : 1'b0;

button_debounce hrsAdj  (.regular_clk(clk), .slow_clk(slow_clk), .button_signal(hour_in), .output_pulse(hrs_adj_input), .reset(reset));
button_debounce minAdj  (.regular_clk(clk), .slow_clk(slow_clk), .button_signal(min_in), .output_pulse(min_adj_input), .reset(reset));
button_debounce secAdj  (.regular_clk(clk), .slow_clk(slow_clk), .button_signal(sec_in), .output_pulse(sec_adj_input), .reset(reset));
button_debounce alAdj   (.regular_clk(clk), .slow_clk(slow_clk), .button_signal(al_in), .output_pulse(al_adj_input), .reset(reset));
button_debounce alOnOff (.regular_clk(clk), .slow_clk(slow_clk), .button_signal(al_on_off_toggle_in), .output_pulse(al_on_off_toggle_line), .reset(reset));

always @(posedge clk or posedge reset) begin
    if (reset) begin
        x_offs <= 25;
        y_offs <= 15;
        x_offset_bell <= 510;
        y_offset_bell <= 200;
        seconds <= 0;
        minutes <= 0;
        hours <= 0;
        al_minutes <= 0;
        al_hours <= 0;
        sec_counter <= 0;
        slow_clk_counter <= 0;
        buzzer_clk_counter <= 0;
        sec_clock <= 0;
        buzzer_clk <= 0;
        slow_clk <= 0;

        al_on <= 0;
        alarm <= 0;

        //init Bell
        bell_symb[0] = 8'b00011000;
        bell_symb[1] = 8'b00100100;
        bell_symb[2] = 8'b01000010;
        bell_symb[3] = 8'b01000010;
        bell_symb[4] = 8'b01000010;
        bell_symb[5] = 8'b01000010;
        bell_symb[6] = 8'b10000001;
        bell_symb[7] = 8'b11111111;

    end else begin
        if(seconds >= 60) begin
            seconds <= 0;
            minutes <= minutes + 1;
        end
        if(minutes >= 60) begin
            minutes <= 0;
            hours <= hours + 1;
        end
        if(hours >= 12) begin
            hours <= 0;
        end

        if(al_minutes >= 60) begin
            al_minutes <= 0;
            al_hours <= al_hours + 1;
        end
        if(al_hours >= 12) begin
            al_hours <= 0;
        end

        // second counter
        sec_counter <= sec_counter + 1;
        if(sec_counter == 15_750_000) begin
            sec_clock = ~sec_clock;
        end
        if(sec_counter == 31_500_000) begin
            seconds <= seconds + 1;
            sec_clock = ~sec_clock;
            sec_counter <= 0;
        end
        slow_clk_counter <= slow_clk_counter + 1;
        if (slow_clk_counter == 157_500) begin
            slow_clk = ~slow_clk;
        end
        if (slow_clk_counter == 315_000) begin
            slow_clk = ~slow_clk;
            slow_clk_counter <= 0;
        end
        buzzer_clk_counter <= buzzer_clk_counter + 1;
        if (buzzer_clk_counter == 5000) begin
            buzzer_clk = ~buzzer_clk;
        end
        if (buzzer_clk_counter == 10_000) begin
            buzzer_clk = ~buzzer_clk;
            buzzer_clk_counter <= 0;
        end

        // adjustment buttons
        if (sec_adj_input) begin
            seconds <= seconds + 1;
        end
        if (min_adj_input) begin
            minutes <= minutes + 1;
        end
        if (hrs_adj_input) begin
            hours <= hours + 1;
        end
        if (al_adj_input) begin
            al_minutes <= al_minutes + 10;
        end

        if (al_on_off_toggle_line) begin
            if (al_on) begin
                al_on <= 1'b0;
                alarm <= 1'b0;
            end else begin
                al_on <= 1'b1;
            end
        end

        if (al_on && hours == al_hours && minutes == al_minutes) begin
            alarm <= 1'b1;
        end       
    end
end
/* verilator lint_on BLKSEQ */
endmodule