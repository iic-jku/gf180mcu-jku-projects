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

module df_multiplier_c3
	(
		input wire [7:0] data,
		output wire [7:0] out
	);
	
	genvar i;
	
	wire [11:0] stage1 [0:3];
	wire [11:0] stage2 [0:2];
	wire [11:0] stage3 [0:1];
	wire [12:0] result;
	wire [12:2] carrys;
	
	assign stage1[0][7:0] = data[7:0];
	assign stage1[1][8:1] = data[7:0];
	assign stage1[2][10:3] = data[7:0];
	assign stage1[3][11:4] = data[7:0];
	
	assign stage2[0][3:0] = stage1[0][3:0];
	assign stage2[1][3:1] = stage1[1][3:1];
	assign stage2[2][3] = stage1[2][3];
	df_halfadder s2v4(stage1[0][4], stage1[1][4], stage2[0][4], stage2[2][5]);
	generate
	for (i = 5; i <= 7; i = i + 1) begin : gens2
		df_fulladder s2f(stage1[0][i],stage1[1][i],stage1[2][i],stage2[0][i],stage2[2][i+1]);
	end
	endgenerate
	df_halfadder s2v8(stage1[1][8], stage1[2][8], stage2[0][8], stage2[2][9]);
	assign stage2[0][11:9] = {stage1[3][11], stage1[2][10:9]};
	assign stage2[1][10:4] = {stage1[3][10:5], stage1[2][4]};
	assign stage2[2][4] = stage1[3][4];
	
	assign stage3[0][2:0] = stage2[0][2:0];
	assign stage3[1][2:1] = stage2[1][2:1];
	df_halfadder s3v3(stage2[0][3], stage2[1][3], stage3[0][3], stage3[1][4]);
	generate
	for (i = 4; i <= 9; i = i + 1) begin : gens3
		df_fulladder s3f(stage2[0][i],stage2[1][i],stage2[2][i],stage3[0][i],stage3[1][i+1]);
	end
	endgenerate
	df_halfadder s3v10(stage2[0][10], stage2[1][10], stage3[0][10], stage3[1][11]);
	assign stage3[0][11] = stage2[0][11];
	assign stage3[1][3] = stage2[2][3];
	
	assign result[0] = stage3[0][0];
	df_halfadder resv1(stage3[0][1], stage3[1][1], result[1], carrys[2]);
	generate
	for (i = 2; i <= 11; i = i + 1) begin : genres
		df_fulladder resf(stage3[0][i], stage3[1][i], carrys[i], result[i], carrys[i+1]);
	end
	endgenerate
	assign result[12] = carrys[12];
	
	assign out = {3'b0, result[12:8]};
	
	wire _unused = &{result[7:0]};
endmodule
