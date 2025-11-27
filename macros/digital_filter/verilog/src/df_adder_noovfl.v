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

module df_adder_noovfl
	(
		input wire [8:0] a,
		input wire [8:0] b,
		output wire [7:0] out
	);
	
	genvar i;
	
	wire [8:0] result;
	wire [9:1] carry;
	wire ovfl;
	wire unfl;
	
	df_halfadder adder0(a[0], b[0], result[0], carry[1]);
	generate
	for (i = 1; i <= 8; i = i + 1) begin : genadder
		df_fulladder adder(a[i], b[i], carry[i], result[i], carry[i+1]);
	end
	endgenerate
	
	assign ovfl = carry[8] ^ carry[9];
	assign unfl = ~result[8] | ovfl;
	
	assign out = (result[7:0] | {8{ovfl}}) & {8{unfl}};
endmodule
