// Copyright 2025 Simon Dorrer
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

module multiplexer_tb;

  // inputs
  reg clk       = 1'b0; // 25 MHz
  wire uio_in	= 1'b1;

  // outputs
  // ToDo

  // dut
  multiplexer dut (
    .clk(clk),
    .design_sel_in(design_sel_in),
	.mux_out(mux_out),
	.uio_in(uio_in),
	.ui_in(ui_in),
	.dac_bits_in(dac_bits_in),
	.spi_miso_in(spi_miso_in),
	.spi_sclk_in(spi_sclk_in),
	.done_in(done_in),
	.seg_bits_in(seg_bits_in),
	.dp_on_in(dp_on_in),
	.signal_bit_in(signal_bit_in),
	.data_in(data_in),
	.car_red_light_in(car_red_light_in),
	.car_yellow_light_in(car_yellow_light_in),
	.car_green_light_in(car_green_light_in),
	.ped_red_light_in(ped_red_light_in),
	.ped_green_light_in(ped_green_light_in),
	.DIN_in(DIN_in),
	.CS_in(CS_in),
	.SCLK_in(SCLK_in),
	.pushed_left_in(pushed_left_in),
	.pushed_right_in(pushed_right_in),
	.sound_in(sound_in),
	.buzzer_in(buzzer_in),
	.vga_horizSync_in(vga_horizSync_in),
	.vga_vertSync_in(vga_vertSync_in),
	.black_white_in(black_white_in)
  );

  // 25 MHz Clock
  /* verilator lint_off STMTDLY */
  always #20 clk = ~clk;
  /* verilator lint_on STMTDLY */

  initial begin
    $dumpfile("multiplexer_tb.vcd");
    $dumpvars(0, multiplexer_tb);
    $dumpvars(0, multiplexer_tb.dut);


    // reset deactivated
    #200 rst_n = 1'b1;

    // ToDo

    $finish;
    /* verilator lint_on STMTDLY */
  end
endmodule
