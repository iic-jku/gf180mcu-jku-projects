// Copyright 2025 Maximilian Kernmaier
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


`ifndef TRAFFIC_LIGHT_V
`define TRAFFIC_LIGHT_V
`default_nettype none

`include "clk_enable.v"
`include "max7219_driver.v"
`include "spi_master.v"

module traffic_light (
	input  wire clk,      // 1MHz
    input  wire rst_n,    // active-low reset
	input  wire switch_traffic_light_on_in,
    input  wire ped_request_left_in,
    input  wire ped_request_right_in,
	
    output wire car_red_light_out,
	output wire car_yellow_light_out,
	output wire car_green_light_out,
	output wire ped_red_light_out,
	output wire ped_green_light_out,
	output wire DIN_out,
	output wire CS_out,
	output wire SCLK_out,
	output wire pushed_left_out,
	output wire pushed_right_out
);

    // -----------------------
    // Clock Divider / Enable
    // -----------------------
    wire ena_1kHz, ena_10Hz;

    `ifdef SIM
        clk_enable #(1000, 10)      div10 (.clk(clk), .rst_n(rst_n), .ena_pulse(ena_10Hz));
        clk_enable #(1000, 1000)    div1k (.clk(clk), .rst_n(rst_n), .ena_pulse(ena_1kHz));
    `else
        clk_enable #(1000000, 10)   div10 (.clk(clk), .rst_n(rst_n), .ena_pulse(ena_10Hz));
        clk_enable #(1000000, 1000) div1k (.clk(clk), .rst_n(rst_n), .ena_pulse(ena_1kHz));
    `endif

    // -----------------------
    // States & Parameters
    // -----------------------
    localparam C_IDLE        = 3'd0;
    localparam C_RED         = 3'd1;
    localparam C_RED_YELLOW  = 3'd2;
    localparam C_GREEN       = 3'd3;
    localparam C_GREEN_BLINK = 3'd4;
    localparam C_YELLOW      = 3'd5;

    localparam P_IDLE        = 2'd0;
    localparam P_RED         = 2'd1;
    localparam P_GREEN       = 2'd2;
    localparam P_GREEN_BLINK = 2'd3;

    localparam T_RED         = 8'd150;
    localparam T_RED_YELLOW  = 8'd10;
    localparam T_GREEN       = 8'd150;
    localparam T_GREEN_BLINK = 8'd40;
    localparam T_YELLOW      = 8'd30;
    localparam T_COUNTDOWN   = 8'd90;
    localparam BLINK_VAL     = 8'd5;
    localparam DEBOUNCE_TIME = 9'd50;

    // -----------------------
    // Registers
    // -----------------------
    reg [2:0] car_state;
    reg [7:0] car_counter;
    reg [7:0] blink_counter;
    reg       blink;

    reg [1:0] ped_state;


    reg [3:0] countdown;
    reg [3:0] countdown_counter;
    reg       countdown_active;
    reg       enable_smiley;

    reg [8:0] global_counter;
    reg [8:0] debounce_counter;
    reg       early_ped_green;
    reg       pushed_left;
    reg       pushed_right;

    // -----------------------
    // Input wires
    // -----------------------
    wire switch_traffic_light_on = switch_traffic_light_on_in;
    wire ped_request_left = ped_request_left_in;
    wire ped_request_right = ped_request_right_in;

    // -----------------------
    // Lights
    // -----------------------
    wire car_red_light    = (car_state == C_RED || car_state == C_RED_YELLOW);
    wire car_yellow_light = (car_state == C_YELLOW || car_state == C_RED_YELLOW || (car_state == C_IDLE && blink));
    wire car_green_light  = (car_state == C_GREEN || (car_state == C_GREEN_BLINK && blink));

    wire ped_red_light   = ped_state == P_RED && ped_state != P_IDLE;
    wire ped_green_light = (ped_state == P_GREEN || (ped_state == P_GREEN_BLINK && blink)) && ped_state != P_IDLE;

    // -----------------------
    // MAX7219 Display
    // -----------------------
    wire DIN;
    wire CS;
    wire SCLK;
    
    // -----------------------
    // Output pins
    // -----------------------
    // Car light
    assign car_red_light_out = car_red_light;
    assign car_yellow_light_out = car_yellow_light;
    assign car_green_light_out = car_green_light;
    // Pedestrian light
    assign ped_red_light_out = ped_red_light;
    assign ped_green_light_out = ped_green_light;

    // -----------------------
    // Bidirectional pins
    // -----------------------
    assign DIN_out = DIN;
    assign CS_out = CS;
    assign SCLK_out = SCLK;
    assign pushed_left_out = pushed_left;
    assign pushed_right_out = pushed_right;

    // -----------------------
    // Car FSM & Pedestrian FSM
    // -----------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            car_state <= C_IDLE;
            car_counter <= 0;
            ped_state <= P_IDLE;
            countdown <= 9;
            countdown_active <= 0;
            global_counter <= 0;

            blink_counter <= 0;
            blink <= 0;
            debounce_counter <= 0;
            early_ped_green <= 0;
            pushed_left <=0;
            pushed_right <=0;

            enable_smiley <=0;
        end else if (ena_10Hz) begin
            if (!switch_traffic_light_on) begin
                car_state <= C_IDLE;
                car_counter <= 0;
                ped_state <= P_IDLE;
                countdown_active <= 0;
                global_counter <= 0;
            end else begin
                // -----------------------
                // Car FSM
                // -----------------------
                global_counter <= global_counter + 1;
                case(car_state)
                    C_IDLE: begin
                    if(switch_traffic_light_on) begin
                        car_state <= C_RED;
                        car_counter <= 0;
                    end
                    end
                    C_RED: begin
                        if(car_counter >= T_RED) begin
                            car_state <= C_RED_YELLOW;
                            car_counter <= 0;
                        end else car_counter <= car_counter + 1;
                    end
                    C_RED_YELLOW: begin
                        if(car_counter >= T_RED_YELLOW) begin
                            car_state <= C_GREEN;
                            car_counter <= 0;
                            global_counter <= 0;
                        end else car_counter <= car_counter + 1;
                    end
                    C_GREEN: begin
                        if((early_ped_green && countdown==7) || car_counter >= T_GREEN) begin
                            car_state <= C_GREEN_BLINK;
                            car_counter <= 0;
                        end else car_counter <= car_counter + 1;
                    end
                    C_GREEN_BLINK: begin
                        if(car_counter >= T_GREEN_BLINK) begin
                            car_state <= C_YELLOW;
                            car_counter <= 0;
                        end else car_counter <= car_counter + 1;
                    end
                    C_YELLOW: begin
                        if(car_counter >= T_YELLOW) begin
                            car_state <= C_RED;
                            car_counter <= 0;
                        end else car_counter <= car_counter + 1;
                    end
                    default: car_state <= C_IDLE;
                endcase

                // -----------------------
                // Pedestrian FSM
                // -----------------------
                case(ped_state)
                    P_IDLE: begin
                        if(switch_traffic_light_on) begin
                            ped_state <= P_RED;
                        end
                    end

                    P_RED: begin
                        if(car_state == C_RED) begin 
                            ped_state <= P_GREEN; 
                        end
                        if (!countdown_active && !early_ped_green) begin
                            countdown <= 12; //sad smiley
                            enable_smiley <= 1;
                        end else begin
                            enable_smiley <= 0;
                        end
                    end
                
                    P_GREEN: begin
                        if(car_state == C_RED && car_counter >= T_RED-T_GREEN_BLINK) begin 
                            ped_state <= P_GREEN_BLINK; 
                        end
                        if (!countdown_active && !early_ped_green) begin
                            countdown <= 10; //happy smiley
                            enable_smiley <= 1;
                        end else begin
                            enable_smiley <= 0;
                        end
                    end

                    P_GREEN_BLINK: begin
                        if(car_state == C_RED_YELLOW) begin 
                            ped_state <= P_RED; 
                        end
                        if (!countdown_active && !early_ped_green) begin
                            countdown <= 11; //neutral smiley
                            enable_smiley <= 1;
                        end else begin
                            enable_smiley <= 0;
                        end
                    end
                endcase

                // -----------------------
                // Countdown
                // -----------------------
                if ((early_ped_green||(global_counter >= T_GREEN + T_GREEN_BLINK + T_YELLOW - T_COUNTDOWN-7) && car_state == C_GREEN && ped_state == P_RED) && !countdown_active) begin
                    countdown_active <= 1;
                    countdown_counter <= 0;
                    countdown <= 9;
                end

                if(countdown_active) begin
                    countdown_counter <= countdown_counter + 1;
                    if(countdown_counter >= 9) begin
                        countdown_counter <= 0;
                        if(countdown == 0) begin
                            countdown_active <= 0;
                            countdown <= 9;
                        end else begin
                            countdown <= countdown-1;
                        end
                    end
                end
            end

            // -----------------------
            // Blink generator
            // -----------------------
            if (car_state == C_GREEN_BLINK || car_state == C_IDLE || ped_state == P_GREEN_BLINK) begin
                if (blink_counter == BLINK_VAL-1) begin
                    blink_counter <= 0;
                    blink <= ~blink;
                end else begin
                    blink_counter <= blink_counter + 1;
                end
            end else begin
                blink_counter <= 0;
                blink <= 0;
            end
        end else 
            // -----------------------
            // Debounce pedestrian buttons
            // -----------------------
            if (ena_1kHz) begin
                if ((ped_request_left || ped_request_right) && car_state==C_GREEN && !early_ped_green) begin
                    if(debounce_counter >= DEBOUNCE_TIME) begin
                        early_ped_green <= 1;
                    end
                    else begin
                        debounce_counter <= debounce_counter + 1;
                    end
                end else if(early_ped_green && ped_request_left)begin
                    pushed_left<=1;
                end else if(early_ped_green && ped_request_right)begin
                    pushed_right <=1;
                end else begin
                    debounce_counter <= 0;
                end
                if(early_ped_green && countdown == 0) begin
                    early_ped_green <= 0;
                    pushed_left <= 0;
                    pushed_right <= 0;
                end
            end
    end

    // -----------------------
    // Display Instance
    // -----------------------
    max7219_driver matrix_driver (
      .clk(clk),
      .rst_n(rst_n),
      .digit(countdown),
      .enable_display((countdown_active || enable_smiley) && switch_traffic_light_on),
      .DIN(DIN),
      .CS(CS),
      .SCLK(SCLK)
    );

endmodule
`endif
