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


`timescale 1s / 1ns

module traffic_light_tb;
  // --- Signals ---
  reg clk    = 0;
  reg rst_n  = 0;

  reg switch_traffic_light_on_in = 0;
  reg ped_request_left_in = 0;
  reg ped_request_right_in = 0;
     
  wire car_red_light_out;
  wire car_yellow_light_out;
  wire car_green_light_out;
  wire ped_red_light_out;
  wire ped_green_light_out;

  wire DIN_out;
  wire CS_out;
  wire SCLK_out;

  wire pushed_left_out;
  wire pushed_right_out;


  // --- DUT (Device Under Test) ---
  traffic_light dut (
      .clk    (clk),      // clock
      .rst_n  (rst_n),     // not reset 

      .switch_traffic_light_on_in(switch_traffic_light_on_in),

      .ped_request_left_in(ped_request_left_in),
      .ped_request_right_in(ped_request_right_in),

      .car_red_light_out(car_red_light_out),
      .car_yellow_light_out(car_yellow_light_out),
      .car_green_light_out(car_green_light_out),
      .ped_red_light_out(ped_red_light_out),
      .ped_green_light_out(ped_green_light_out),

      .DIN_out(DIN_out),
      .CS_out(CS_out),
      .SCLK_out(SCLK_out),

      .pushed_left_out(pushed_left_out),
      .pushed_right_out(pushed_right_out)


  );

  // --- Clock Generator ---
  `ifdef SIM
    always #0.0005 clk = ~clk;        // 1kHz source
  `else
    always #0.0000005 clk = ~clk;     // 1MHz source
  `endif

  // --- Stimulus / Reset ---
  initial begin
    $dumpfile("traffic_light_tb.vcd");
    $dumpvars(0, traffic_light_tb);

    // Hold reset active
    rst_n = 0; 
    #3;
    rst_n = 1;

    // Test traffic light ON/OFF
    switch_traffic_light_on_in = 0;
    #10
    switch_traffic_light_on_in = 1;
    #10

    // Press pedestrian button
    ped_request_left_in = 1;
    #1
    ped_request_left_in = 0;
    #15
    ped_request_left_in = 1;
    #1
    ped_request_left_in = 0;
    #32
    ped_request_right_in = 1;
    #1
    ped_request_right_in = 0;
    #1
    ped_request_left_in = 1;
    #1
    ped_request_left_in = 0;

    // Turn traffic light OFF after some time
    #150
    switch_traffic_light_on_in = 0;
    #20

    // Simulation laufen lassen
    $finish;
  end

endmodule
