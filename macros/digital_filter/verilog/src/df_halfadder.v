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

`ifndef __DF_HALFADDER__
`define __DF_HALFADDER__

module df_halfadder
	(
		input wire a,
		input wire b,
		output wire s,
		output wire c
	);
	
	assign s = a ^ b;
	assign c = a & b;
endmodule

`endif
