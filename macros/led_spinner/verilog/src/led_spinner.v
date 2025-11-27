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

`include "prescaler.v"
`include "rng.v"
`include "wheel.v"
`include "seg_driver.v"
`include "guess_eval.v"

module led_spinner (
    input  wire       clk,      		// clock
    input  wire       rst_n,    		// reset_n - low to reset
	input  wire [3:0] speed_bits_in,
	input  wire       stop_wheel_in,
	input  wire [5:0] guess_bits_in,
	
	output wire [6:0] seg_bits_out,
	output wire		  dp_on_out
);

    wire [3:0] speed_bits = speed_bits_in[3:0];
    wire       stop_wheel = stop_wheel_in;
    wire [5:0] guess_bits = guess_bits_in[5:0];

    // prescaler for wheel ticks
    wire wheel_tick;
    prescaler prescaler_inst (
        .clk_i(clk),
        .rst_i(~rst_n),
        .speed_i(speed_bits),
        .tick_o(wheel_tick)
    );

    // rng number generator with lfsr 
    wire [3:0] rng_val;
    rng rng_inst (
        .clk_i(clk),
        .rst_i(~rst_n),
        .en_i(wheel_tick),
        .lfsr_o(rng_val)
    );

    // wheel control
    wire [2:0] wheel_pos; // only values 0..5
    wire       wheel_running;
    wheel wheel_inst (
        .clk_i(clk),
        .rst_i(~rst_n),
        .tick_i(wheel_tick),
        .stop_i(stop_wheel),
        .rand_i(rng_val),   // 4-bit random number
        .pos_o(wheel_pos),
        .running_o(wheel_running)
    );

    // check if user guess is correct
    wire dp_on;
    guess_eval guess_inst (
        .pos_i(wheel_pos),
        .running_i(wheel_running),
        .guess_i(guess_bits),
        .dp_o(dp_on)
    );

    // display spinning led on 7 seg-display
    wire [6:0] seg_bits; // seg_top .. seg_middle
    seg_driver segdriver_inst (
        .pos_i(wheel_pos),
        .seg_o(seg_bits)
    );

    assign seg_bits_out[6:0] = seg_bits[6:0];
    assign dp_on_out = dp_on;
endmodule
