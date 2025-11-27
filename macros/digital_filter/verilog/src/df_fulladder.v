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

`ifndef __DF_FULLADDER__
`define __DF_FULLADDER__

module df_fulladder
	(
		input wire a,
		input wire b,
		input wire ci,
		output wire s,
		output wire co
	);
	
	wire s1, c1, c2;
	
	assign c1 = a & b;
	assign s1 = a ^ b;
	
	assign c2 = s1 & ci;
	
	assign co = c1 | c2;
	assign s = s1 ^ ci;
endmodule

`endif
