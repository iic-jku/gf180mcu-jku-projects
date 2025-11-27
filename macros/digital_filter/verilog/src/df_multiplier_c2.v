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

module df_multiplier_c2
	(
		input wire [2:0] coef,
		input wire [7:0] data,
		output wire [7:0] out
	);
	
	genvar i;
	
	wire [13:1] stage1 [0:4];
	wire [13:1] stage2 [0:3];
	wire [13:1] stage3 [0:2];
	wire [13:1] stage4 [0:1];
	wire [14:1] result;
	wire [14:3] carrys;
	
	assign stage1[0][8:1] = data[7:0];
	assign stage1[1][9:2] = data[7:0] & {8{coef[0]}};
	assign stage1[2][10:3] = data[7:0];
	assign stage1[3][11:4] = data[7:0] & {8{coef[1]}};
	assign stage1[4][13:6] = data[7:0] & {8{coef[2]}};
	
	assign stage2[0][5:1] = stage1[0][5:1];
	assign stage2[1][5:2] = stage1[1][5:2];
	assign stage2[2][5:3] = stage1[2][5:3];
	assign stage2[3][5:4] = stage1[3][5:4];
	df_halfadder s2v6(stage1[0][6], stage1[1][6], stage2[0][6], stage2[3][7]);
	df_fulladder s2f7(stage1[0][7], stage1[1][7], stage1[2][7], stage2[0][7], stage2[3][8]);
	df_fulladder s2f8(stage1[0][8], stage1[1][8], stage1[2][8], stage2[0][8], stage2[3][9]);
	df_halfadder s2v9(stage1[1][9], stage1[2][9], stage2[0][9], stage2[3][10]);
	assign stage2[0][13:10] = {stage1[4][13:12], stage1[3][11], stage1[2][10]};
	assign stage2[1][11:6] = {stage1[4][11], stage1[3][10:7], stage1[2][6]};
	assign stage2[2][10:6] = {stage1[4][10:7], stage1[3][6]};
	assign stage2[3][6] = stage1[4][6];
	
	assign stage3[0][3:1] = stage2[0][3:1];
	assign stage3[1][3:2] = stage2[1][3:2];
	assign stage3[2][3] = stage2[2][3];
	df_halfadder s3v4(stage2[0][4], stage2[1][4], stage3[0][4], stage3[2][5]);
	generate
	for (i = 5; i <= 10; i = i + 1) begin : gens3
		df_fulladder s3f(stage2[0][i],stage2[1][i],stage2[2][i],stage3[0][i],stage3[2][i+1]);
	end
	endgenerate
	assign stage3[0][13:11] = stage2[0][13:11];
	assign stage3[1][11:4] = {stage2[1][11], stage2[3][10:5], stage2[2][4]};
	assign stage3[2][4] = stage2[3][4];
	
	assign stage4[0][2:1] = stage3[0][2:1];
	assign stage4[1][2] = stage3[1][2];
	df_halfadder s4v3(stage3[0][3], stage3[1][3], stage4[0][3], stage4[1][4]);
	generate
	for (i = 4; i <= 11; i = i + 1) begin : gens4
		df_fulladder s4f(stage3[0][i],stage3[1][i],stage3[2][i],stage4[0][i],stage4[1][i+1]);
	end
	endgenerate
	assign stage4[0][13:12] = stage3[0][13:12];
	assign stage4[1][3] = stage3[2][3];
	
	assign result[1] = stage4[0][1];
	df_halfadder resv2(stage4[0][2], stage4[1][2], result[2], carrys[3]);
	generate
	for (i = 3; i <= 12; i = i + 1) begin : genres
		df_fulladder resf(stage4[0][i], stage4[1][i], carrys[i], result[i], carrys[i+1]);
	end
	endgenerate
	df_halfadder resv13(stage4[0][13], carrys[13], result[13], carrys[14]);
	assign result[14] = carrys[14];
	
	assign out = {1'b0, result[14:8]};
	
	wire _unused = &{result[7:1]};
endmodule
