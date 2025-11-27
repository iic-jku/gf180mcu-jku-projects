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

`include "df_halfadder.v"
`include "df_fulladder.v"

module df_multiplier_c1
	(
		input wire [1:0] coef,
		input wire [7:0] data,
		output wire [7:0] out
	);
	
	genvar i;
	
	wire [14:5] stage1 [0:2];
	wire [14:5] stage2 [0:1];
	wire [15:5] result;
	wire [15:7] carrys;
	
	assign stage1[0][12:5] = data[7:0];
	assign stage1[1][13:6] = data[7:0] & {8{coef[0]}};
	assign stage1[2][14:7] = data[7:0] & {8{coef[1]}};
	
	assign stage2[0][6:5] = stage1[0][6:5];
	assign stage2[1][6] = stage1[1][6];
	assign stage2[1][7] = stage1[2][7];
	df_halfadder s2v7(stage1[0][7], stage1[1][7], stage2[0][7], stage2[1][8]);
	generate
	for (i = 8; i <= 12; i = i + 1) begin : gens2
		df_fulladder s2f(stage1[0][i],stage1[1][i],stage1[2][i],stage2[0][i],stage2[1][i+1]);
	end
	endgenerate
	df_halfadder s2v13(stage1[1][13], stage1[2][13], stage2[0][13], stage2[1][14]);
	assign stage2[0][14] = stage1[2][14];
	
	assign result[5] = stage2[0][5];
	df_halfadder resv6(stage2[0][6], stage2[1][6], result[6], carrys[7]);
	generate
	for (i = 7; i <= 14; i = i + 1) begin : genres
		df_fulladder resf(stage2[0][i], stage2[1][i], carrys[i], result[i], carrys[i+1]);
	end
	endgenerate
	assign result[15] = carrys[15];
	
	assign out = result[15:8];
	
	wire _unused = &{result[7:5]};
endmodule
