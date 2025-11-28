// Copyright 2025 TL
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

module display_vga (
    input wire clk,             //25 MHz
    input wire sys_rst,         //reset
    output reg hsync,           //horizontal sync
    output reg vsync,           //vertical sync
    output reg [9:0] horizPos,  //x pos
    output reg [9:0] vertPos,   //y pos
    output wire active          //in visible range
);


//Data from http://www.tinyvga.com/vga-timing 

//Line (Horizontal)
parameter L_VISIBLE     = 640;
parameter L_F_PORCH     = 16;
parameter L_B_PORCH     = 48;
parameter L_SYNC        = 96;
//Frame (Vertical)
parameter F_VISIBLE     = 480;
parameter F_F_PORCH     = 33;
parameter F_B_PORCH     = 10;
parameter F_SYNC        = 2;

//Sum
parameter L_SYNC_BEGIN    = L_VISIBLE + L_F_PORCH;                      //656
parameter L_SYNC_END    = L_VISIBLE + L_F_PORCH + L_SYNC;               //752
parameter L_OVERALL    = L_VISIBLE + L_F_PORCH + L_B_PORCH + L_SYNC;    //800
parameter F_SYNC_BEGIN    = F_VISIBLE + F_B_PORCH;                      //490
parameter F_SYNC_END    = F_VISIBLE + F_B_PORCH + F_SYNC;               //492
parameter F_OVERALL    = F_VISIBLE + F_F_PORCH + F_B_PORCH + F_SYNC;    //525

always @(posedge clk or posedge sys_rst) begin
    if (sys_rst) begin
        vertPos <= 0;
        horizPos <= 0;

        vsync <= 1;
        hsync <= 1;
    end
    else begin
        //hsync <= 1;
        

        // Horiz sync 
        if (horizPos >= L_SYNC_BEGIN && horizPos < L_SYNC_END) begin
            //hsync <= 1'b1;
            hsync <= 0;
        end
        else begin
            hsync <= 1;
        end
        horizPos <= horizPos + 1;
        
        // End of row
        if (horizPos >= L_OVERALL) begin
            horizPos <= 0;
            vertPos <= vertPos + 1;

            // Vertical sync region
            if (vertPos >= F_SYNC_BEGIN && vertPos < F_SYNC_END) begin
                vsync <= 1'b0;
            end
            else begin
                vsync <= 1'b1;
            end
            
            // End of frame
            if (vertPos >= F_OVERALL) begin
                vertPos <= 0;
            end
        end
    end
end
assign active = (horizPos < L_VISIBLE) && (vertPos < F_VISIBLE);
endmodule
