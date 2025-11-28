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

`timescale 1ns/1ns

module led_spinner_tb;

  // inputs
  reg        clk            = 1'b0;         // 50 MHz
  reg        rst_n          = 1'b0;         // active-low
  reg  [3:0] speed_bits_in  = 4'b0000;
  reg        stop_wheel_in  = 1'b0;
  reg  [5:0] guess_bits_in  = 6'b000000;

  // outputs
  wire [6:0] seg_bits_out;
  wire       dp_on_out;

  // dut
  led_spinner dut (
    .clk(clk),
    .rst_n(rst_n),
    .speed_bits_in(speed_bits_in),
    .stop_wheel_in(stop_wheel_in),
    .guess_bits_in(guess_bits_in),
    .seg_bits_out(seg_bits_out),
    .dp_on_out(dp_on_out)
  );

  // 50 MHz Clock
  /* verilator lint_off STMTDLY */
  always #10 clk = ~clk;
  /* verilator lint_on STMTDLY */

  initial begin
    $dumpfile("led_spinner_tb.vcd");
    $dumpvars(0, led_spinner_tb);
    $dumpvars(0, led_spinner_tb.dut);


    // reset deactivated
    #200 rst_n = 1'b1;

    // set speed to invalid pattern to trigger default speed (1khz)
    speed_bits_in = 4'b0101;

    // no guesses at first
    guess_bits_in = 6'b000000;
    #4_000_000;

    // user wants to stop wheel
    stop_wheel_in = 1'b1;
    #5_000_000;

    // start wheel again
    stop_wheel_in = 1'b0;
    // activate all guesses simultainously
    guess_bits_in = 6'b111111;
    #5_000_000;

    // stop wheel
    stop_wheel_in = 1'b1;
    #10_000_000;

    $finish;
    /* verilator lint_on STMTDLY */
  end
endmodule
