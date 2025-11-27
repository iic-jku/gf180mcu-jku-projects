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

module df_opt_2comp
	(
		input wire [7:0] data,
		input wire en,
		output wire [8:0] out
	);
	
	genvar i;
	
	wire nen;
	wire [8:0] sum;
	wire [7:0] carry;
	
	assign nen = ~en;
	
	assign sum[0] = data[0] ^ nen;
	assign carry[0] = data[0] | nen;
	generate
	for (i = 1; i <= 7; i = i + 1) begin : gen2c
		assign sum[i] = data[i] ^ carry[i-1];
		assign carry[i] = data[i] | carry[i-1];
	end
	endgenerate
	assign sum[8] = carry[7];
	
	assign out = sum[8:0] ^ {9{nen}};
endmodule
