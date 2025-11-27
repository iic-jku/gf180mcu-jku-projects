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

`include "df_fulladder.v"

module df_adder_subtractor
	(
		input wire [8:0] a,
		input wire [8:0] b,
		input wire sub,
		output wire [8:0] out
	);
	
	genvar i;
	
	wire [8:0] modb;
	wire [8:0] carry;
	
	assign modb = b ^ {9{sub}};
	
	df_fulladder adder0(a[0], modb[0], sub, out[0], carry[0]);
	generate
	for (i = 1; i <= 8; i = i + 1) begin : genadders
		df_fulladder adder(a[i], modb[i], carry[i-1], out[i], carry[i]);
	end
	endgenerate
	
	wire _unused = &{carry[8]};
endmodule
