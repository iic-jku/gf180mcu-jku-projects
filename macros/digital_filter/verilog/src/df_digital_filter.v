// Copyright 2025 Gregor Flachs
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

`include "df_multiplier_c1.v"
`include "df_multiplier_c2.v"
`include "df_multiplier_c3.v"
`include "df_multiplier_c4.v"
`include "df_opt_2comp.v"
`include "df_adder_subtractor.v"
`include "df_adder_noovfl.v"

module df_digital_filter
	(
		input wire CLK, nRST,
		input wire enconfig,
		input wire [2:0] configin,
		input wire [7:0] datain,
		output wire [7:0] dataout
	);
	
	reg sync_enconfig [0:1];
	reg [2:0] sync_configin [0:1];
	reg [7:0] sync_datain [0:1];
	
	reg [7:0] val1;
	reg [7:0] val2;
	reg [7:0] val3;
	reg [7:0] val4;
	reg hp;
	reg [1:0] wg;
	reg [7:0] res;
	
	wire innerwg;
	wire outerwg;
	wire [1:0] coef1;
	wire [2:0] coef2;
	wire [4:0] coef4;
	wire [7:0] rmul1;
	wire [7:0] rmul2;
	wire [7:0] rmul3;
	wire [7:0] rmul4;
	wire en2comp;
	wire [8:0] r2comp;
	wire sub1;
	wire [8:0] radd1;
	wire sub2;
	wire [8:0] radd2;
	wire [7:0] radd3;
	
	df_multiplier_c1 mul1(coef1, val1, rmul1);
	df_multiplier_c2 mul2(coef2, val2, rmul2);
	df_multiplier_c3 mul3(val3, rmul3);
	df_multiplier_c4 mul4(coef4, val4, rmul4);
	
	df_opt_2comp opt2comp(rmul3, en2comp, r2comp);
	
	df_adder_subtractor add1({1'b0, rmul1}, {1'b0, rmul2}, sub1, radd1);
	df_adder_subtractor add2(r2comp, {1'b0, rmul4}, sub2, radd2);
	
	df_adder_noovfl add3(radd1, radd2, radd3);
	
	always @(posedge CLK or negedge nRST) begin
		if (nRST == 1'b0) begin
			sync_enconfig[0] <= 1'b0;
			sync_enconfig[1] <= 1'b0;
			sync_configin[0] <= 3'b0;
			sync_configin[1] <= 3'b0;
			sync_datain[0] <= 8'b0;
			sync_datain[1] <= 8'b0;
		end else begin
			sync_enconfig[0] <= enconfig;
			sync_enconfig[1] <= sync_enconfig[0];
			sync_configin[0] <= configin;
			sync_configin[1] <= sync_configin[0];
			sync_datain[0] <= datain;
			sync_datain[1] <= sync_datain[0];
		end
	end
	
	always @(posedge CLK or negedge nRST) begin
		if (nRST == 1'b0) begin
			val1 <= 8'b0;
			val2 <= 8'b0;
			val3 <= 8'b0;
			val4 <= 8'b0;
			hp <= 1'b0;
			wg <= 2'b0;
			res <= 8'b0;
		end else begin
			val4 <= val3;
			val3 <= val2;
			val2 <= val1;
			val1 <= sync_datain[1];
			if (sync_enconfig[1] == 1'b1) begin
				hp <= sync_configin[1][2];
				wg <= sync_configin[1][1:0];
			end
			res <= radd3;
		end
	end
	
	assign innerwg = wg[1] ^ wg[0];
	assign outerwg = ~innerwg;
	
	assign coef1 = wg ^ {2{hp}};
	assign coef2[2] = innerwg;
	assign coef2[1] = outerwg;
	assign coef2[0] = outerwg;
	assign coef4[4] = outerwg;
	assign coef4[3] = innerwg;
	assign coef4[2] = outerwg;
	assign coef4[1] = outerwg;
	assign coef4[0] = innerwg;
	
	assign sub1 = hp;
	assign en2comp = wg[1] ^ hp;
	assign sub2 = innerwg ^ hp;
	
	assign dataout = res;
endmodule
