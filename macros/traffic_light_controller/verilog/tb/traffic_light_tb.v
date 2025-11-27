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

module tt_um_Max00Ker_tb;
  // --- Signals ---
  reg clk    = 0;
  reg rst_n  = 0;
  reg ena    = 1;
  reg traffic_light_on = 0;
  reg ped_push_button_left = 0;
  reg ped_push_button_right = 0;
     
  reg  [7:0] ui_in = 8'b0;
  wire [7:0] uo_out;
  wire [7:0] uio_in;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;


  // --- DUT (Device Under Test) ---
  tt_um_Max00Ker_Traffic_Light dut (
      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n) // not reset        // ungenutzte bidirektionale Pins
  );

  // --- Clock Generator ---
  `ifdef SIM
    always #0.0005 clk = ~clk;        // 1kHz source
  `else
    always #0.0000005 clk = ~clk;     // 1MHz source
  `endif

  // --- Update inputs ---
  always @(*) begin
    ui_in[0] = traffic_light_on;    // Pin 0 = on/off switch
    ui_in[1] = ped_push_button_left; //Pin 1 = push button left
    ui_in[2] = ped_push_button_right; //Pin 1 = push button left
  end


  // --- Stimulus / Reset ---
  initial begin
    $dumpfile("traffic_light_tb.vcd");
    $dumpvars(0, tt_um_Max00Ker_tb);

    // Hold reset active
    rst_n = 0; 
    #3;
    rst_n = 1;

    // Test traffic light ON/OFF
    traffic_light_on = 0;
    #10
    traffic_light_on = 1;
    #10

    // Press pedestrian button
    ped_push_button_left = 1;
    #1
    ped_push_button_left = 0;
    #15
    ped_push_button_left = 1;
    #1
    ped_push_button_left = 0;
    #32
    ped_push_button_right = 1;
    #1
    ped_push_button_right = 0;

    // Turn traffic light OFF after some time
    #150
    traffic_light_on = 0;
    #20

    // Simulation laufen lassen
    $finish;
  end

endmodule
