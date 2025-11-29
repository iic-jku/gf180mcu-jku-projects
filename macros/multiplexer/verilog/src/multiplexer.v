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

`default_nettype none

module multiplexer (
	input  wire        clk,      		// clock
	
	// Multiplexer - Interface to Pad-Ring
	input  wire [2:0]  design_sel_in, 	// design select (3 bits)
	// Note that only the outputs of the projects are muxed.
	// The inputs of the projects are connected in parallel.
	// Meaning that all projects are running simultaneously, but only the outputs of one project are observed.
	// After a project switch with "design_sel_in" a reset is recommended.
	// input  wire [11:0] mux_in,			// 12 inputs for all projects
	output  wire [10:0] mux_out,			// 11 outputs for all projects
	
	// TinyBF
	// output wire [3:0] uo_out,			// TinyBF: input  wire [3:0] ui_in
	input  wire [3:0] uio_in,				// TinyBF: output wire [3:0] uio_out
    input  wire [6:0] ui_in,				// TinyBF: output wire [6:0] uo_out
	
	// SAR ADC Controller
	// output wire start_out,				// SAR ADC Controller: input wire start
	// output wire comp_out,				// SAR ADC Controller: input wire comp_in
	input  wire [7:0] dac_bits_in,			// SAR ADC Controller: output wire [7:0] dac_bits
	input  wire spi_miso_in,				// SAR ADC Controller: output wire spi_miso
	input  wire spi_sclk_in,				// SAR ADC Controller: output wire spi_sclk
	input  wire done_in,					// SAR ADC Controller: output wire done
	
	// Led Spinner
	// output wire [3:0] speed_bits_out,	// Led Spinner: input  wire [3:0] speed_bits_in
	// output wire       stop_wheel_out,	// Led Spinner: input  wire       stop_wheel_in
	// output wire [5:0] guess_bits_out,	// Led Spinner: input  wire [5:0] guess_bits_in
	input  wire [6:0] seg_bits_in,			// Led Spinner: output wire [6:0] seg_bits_out
	input  wire		  dp_on_in,				// Led Spinner: output wire		  dp_on_out
	
	// TinyToneGen
	// output wire       ena_out,			// TinyToneGen: input  wire       ena
	// output wire [2:0] address_out,		// TinyToneGen: input  wire [2:0] address_in  
	// output wire 	  write_strobe_out,		// TinyToneGen: input  wire 	  write_strobe_in  
	// output wire [4:0] data_out,			// TinyToneGen: input  wire [4:0] data_in
	input  wire 	  signal_bit_in,		// TinyToneGen: output wire 	  signal_bit_out
	
	// Digital Filter
	// output wire 	  enconfig_out, 		// Digital Filter: input wire enconfig
	// output wire [2:0] config_out, 		// Digital Filter: input wire [2:0] configin
	// output wire [7:0] data_out, 			// Digital Filter: input wire [7:0] datain
	input  wire [7:0] data_in,				// Digital Filter: output wire [7:0] dataout
	
	// Traffic Light Controller
	// output wire switch_traffic_light_on_out, // Traffic Light Controller: input  wire switch_traffic_light_on_in
    // output wire ped_request_left_out, 		// Traffic Light Controller: input  wire ped_request_left_in
    // output wire ped_request_right_out, 		// Traffic Light Controller: input  wire ped_request_right_in
    input  wire car_red_light_in, 				// Traffic Light Controller: output wire car_red_light_out
	input  wire car_yellow_light_in, 			// Traffic Light Controller: output wire car_yellow_light_out
	input  wire car_green_light_in, 			// Traffic Light Controller: output wire car_green_light_out
	input  wire ped_red_light_in, 				// Traffic Light Controller: output wire ped_red_light_out
	input  wire ped_green_light_in, 			// Traffic Light Controller: output wire ped_green_light_out
	input  wire DIN_in, 						// Traffic Light Controller: output wire DIN_out
	input  wire CS_in, 							// Traffic Light Controller: output wire CS_out
	input  wire SCLK_in, 						// Traffic Light Controller: output wire SCLK_out
	input  wire pushed_left_in, 				// Traffic Light Controller: output wire pushed_left_out
	input  wire pushed_right_in, 				// Traffic Light Controller: output wire pushed_right_out
	
	// TinyTone
	input  wire sound_in, 						// TinyTone: output wire sound_out
	
	// Classic VGA Clock
    // output wire hour_out, 					// Classic VGA Clock: input wire hour_in
    // output wire min_out, 					// Classic VGA Clock: input wire min_in
    // output wire sec_out, 					// Classic VGA Clock: input wire sec_in
    // output wire al_out, 						// Classic VGA Clock: input wire al_in
    // output wire al_on_off_toggle_out, 		// Classic VGA Clock: input wire al_on_off_toggle_in
    input  wire buzzer_in, 						// Classic VGA Clock: output wire buzzer_out
    input  wire vga_horizSync_in, 				// Classic VGA Clock: output wire vga_horizSync_out
    input  wire vga_vertSync_in, 				// Classic VGA Clock: output wire vga_vertSync_out
    input  wire black_white_in 					// Classic VGA Clock: output wire black_white_out
);
	
	// Register for Outputs
	reg [10:0] mux_out_reg;
	
	// MUX
	always @(*) begin
		case(design_sel_in)
			default: begin
				mux_out_reg[10:0] = 11'b00000000000;
			end
			// TinyBF
			3'b000: begin
				mux_out_reg[10:7] = uio_in;
				mux_out_reg[6:0]  = ui_in;
			end
			// SAR ADC Controller
			3'b001: begin
				mux_out_reg[10]  = spi_miso_in;
				mux_out_reg[9] 	 = spi_sclk_in;
				mux_out_reg[8] 	 = done_in;
				mux_out_reg[7:0] = dac_bits_in;
			end
			// Led Spinner
			3'b010: begin
				mux_out_reg[10:8] = 3'b000;
				mux_out_reg[7] 	  = dp_on_in;
				mux_out_reg[6:0]  = seg_bits_in;
			end
			// TinyToneGen
			3'b011: begin
				mux_out_reg[10:1] = 10'b0000000000;
				mux_out_reg[0] 	  = signal_bit_in;
			end
			// Digital Filter
			3'b100: begin
				mux_out_reg[10:8] = 3'b000;
				mux_out_reg[7:0]  = data_in;
			end
			// Traffic Light Controller
			3'b101: begin
				mux_out_reg[10] = 1'b0;
				mux_out_reg[9]  = car_red_light_in;
				mux_out_reg[8]  = car_yellow_light_in;
				mux_out_reg[7]  = car_green_light_in;
				mux_out_reg[6]  = ped_red_light_in;
				mux_out_reg[5]  = ped_green_light_in;
				mux_out_reg[4]  = DIN_in;
				mux_out_reg[3]  = CS_in;
				mux_out_reg[2]  = SCLK_in;
				mux_out_reg[1]  = pushed_left_in;
				mux_out_reg[0]  = pushed_right_in;
			end
			// TinyTone
			3'b110: begin
				mux_out_reg[10:1] = 10'b0000000000;
				mux_out_reg[0] 	  = sound_in;
			end
			// Classic VGA Clock
			3'b111: begin
				mux_out_reg[10:4] = 7'b0000000;
				mux_out_reg[3] 	  = buzzer_in;
				mux_out_reg[2] 	  = vga_horizSync_in;
				mux_out_reg[1] 	  = vga_vertSync_in;
				mux_out_reg[0] 	  = black_white_in;
			end
		endcase
	end
	
	// Assign Registers to Outputs
	assign mux_out = mux_out_reg;
endmodule
