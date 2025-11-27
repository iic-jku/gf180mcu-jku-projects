
// Copyright 2025 A Person
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//loosely based on debouncing implementations for similar applications as found on github
//for example: https://github.com/Rawster/digital_clock_verilog

module button_debounce (
    input wire regular_clk,     // 31.5 MHz Clock
    input wire reset,
    input wire slow_clk,    
    input wire button_signal,   
    output reg output_pulse   
);
/* verilator lint_off BLKSEQ */

    reg [3:0] stateMemory;
    reg deb_sig;
    reg prevState;

    always @(posedge regular_clk or posedge reset) begin
        if (reset) begin
            stateMemory <= 4'b0000;
            prevState <= 0;
            deb_sig <= 0;
        end else begin
            if (slow_clk) begin
                stateMemory <= {stateMemory[2:0], button_signal};   //if stable over 5ms
            end
            if (stateMemory == 4'b1111) begin 
                deb_sig <= 1; 
            end else if (stateMemory == 4'b0000) begin
                deb_sig <= 0; 
            end
            prevState <= deb_sig;
        end
    end
	  
    always @(*) begin //both edges
        if (deb_sig == 1 && prevState == 0) begin
            output_pulse = 1;  
        end else begin
            output_pulse = 0;  
        end  
    end
    /* verilator lint_on BLKSEQ */ 

endmodule

