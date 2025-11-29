//=============================================================================
// uart_rx.v - TinyBF UART Receiver (8N1 Serial Input)
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-26
// Version:     2.0
//
// Description:
//   Standard 8N1 UART receiver (1 start, 8 data LSB-first, 1 stop)
//   Two-stage FSM with 3-stage input synchronizer for metastability protection
//   16x oversampling for mid-bit sampling at tick 7 (center of each bit period)
//   Improved start bit detection with edge detection for faster response
//   Framing error detection and reporting
//   Simple 1-cycle pulse protocol for rx_valid (no handshaking required)
//
// Parameters:
//   None
//
// Interfaces:
//   clk_i:           System clock
//   rst_i:           Active-low reset
//   baud_tick_16x_i: Baud rate tick (16x, from baud_gen)
//   rx_serial_i:     Serial input line
//   rx_data_o:       Received data byte (valid when rx_valid_o high)
//   rx_valid_o:      Data valid flag (1-cycle pulse)
//   rx_frame_err_o:  Framing error flag (1 cycle pulse when stop bit invalid)
//   rx_busy_o:       Busy flag (high during reception)
//=============================================================================

`timescale 1ns/1ps
module uart_rx (
    input  wire        clk_i,          // System clock
    input  wire        rst_i,          // Active-low reset
    input  wire        baud_tick_16x_i,// 16x oversampled baud tick
    input  wire        rx_serial_i,    // Serial input line
    output reg  [7:0]  rx_data_o,      // Received data byte
    output reg         rx_valid_o,     // Data valid (1-cycle pulse)
    output reg         rx_frame_err_o, // Framing error pulse (1 cycle)
    output reg         rx_busy_o       // Busy flag
);
    // State encoding
    localparam [1:0] IDLE      = 2'b00;
    localparam [1:0] START_BIT = 2'b01;
    localparam [1:0] DATA_BITS = 2'b10;
    localparam [1:0] STOP_BIT  = 2'b11;

    // 3-stage synchronizer
    reg [2:0] rx_sync;
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            rx_sync <= 3'b111;
        end else begin
            rx_sync <= {rx_sync[1:0], rx_serial_i};
        end
    end
    wire rx = rx_sync[2];
    
    // Edge detection for start bit
    reg rx_prev;
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i)
            rx_prev <= 1'b1;
        else
            rx_prev <= rx;
    end
    wire rx_falling_edge = rx_prev & ~rx;

    // State registers
    reg [1:0] state;
    reg [3:0] tick_cnt;     // 0-15 for 16x oversampling
    reg [2:0] bit_cnt;      // 0-7 for data bits
    reg [7:0] shift_reg;    // Shift register for data
    
    // Next state logic
    reg [1:0] state_next;
    reg [3:0] tick_cnt_next;
    reg [2:0] bit_cnt_next;
    reg [7:0] shift_reg_next;
    reg [7:0] rx_data_next;
    reg       rx_valid_next;
    reg       rx_frame_err_next;
    reg       rx_busy_next;

    //=========================================================================
    // Combinational Logic - Next State and Outputs
    //=========================================================================
    always @(*) begin
        // Default: hold current values
        state_next = state;
        tick_cnt_next = tick_cnt;
        bit_cnt_next = bit_cnt;
        shift_reg_next = shift_reg;
        rx_data_next = rx_data_o;
        rx_valid_next = 1'b0;        // Pulse, default low
        rx_frame_err_next = 1'b0;    // Pulse, default low
        rx_busy_next = rx_busy_o;
        
        case (state)
            IDLE: begin
                rx_busy_next = 1'b0;
                tick_cnt_next = 4'd0;
                bit_cnt_next = 3'd0;
                rx_valid_next = 1'b0;
                
                // Detect start bit on falling edge OR low level at tick
                if (rx_falling_edge || (baud_tick_16x_i && !rx)) begin
                    state_next = START_BIT;
                    rx_busy_next = 1'b1;
                    tick_cnt_next = 4'd1;  // Start counting from 1
                end
            end

            START_BIT: begin
                if (baud_tick_16x_i) begin
                    tick_cnt_next = tick_cnt + 1'b1;
                    
                    // Sample at middle of bit (tick 7 of 0-15)
                    if (tick_cnt == 4'd7) begin
                        if (!rx) begin
                            // Valid start bit confirmed, continue
                        end else begin
                            // False start bit (glitch), return to idle
                            state_next = IDLE;
                            rx_busy_next = 1'b0;
                        end
                    end else if (tick_cnt == 4'd15) begin
                        // End of start bit period
                        // Only proceed if start bit is still valid (low)
                        if (!rx) begin
                            state_next = DATA_BITS;
                            tick_cnt_next = 4'd0;
                        end else begin
                            // Start bit invalid at end, abort
                            state_next = IDLE;
                            rx_busy_next = 1'b0;
                        end
                    end
                end
            end

            DATA_BITS: begin
                if (baud_tick_16x_i) begin
                    tick_cnt_next = tick_cnt + 1'b1;
                    
                    // Sample at middle of bit (tick 7 of 0-15)
                    if (tick_cnt == 4'd7) begin
                        // Sample data bit (LSB first)
                        shift_reg_next = {rx, shift_reg[7:1]};
                        bit_cnt_next = bit_cnt + 1'b1;
                    end else if (tick_cnt == 4'd15) begin
                        // End of bit period
                        tick_cnt_next = 4'd0;
                        
                        // Check if all 8 bits received (bit_cnt wraps to 0 after increment)
                        if (bit_cnt == 3'd0) begin
                            state_next = STOP_BIT;
                        end
                    end
                end
            end

            STOP_BIT: begin
                if (baud_tick_16x_i) begin
                    tick_cnt_next = tick_cnt + 1'b1;
                    
                    // Sample stop bit at middle (tick 7)
                    if (tick_cnt == 4'd7) begin
                        if (rx) begin
                            // Valid stop bit
                            rx_data_next = shift_reg;
                            rx_valid_next = 1'b1;
                        end else begin
                            // Framing error
                            rx_frame_err_next = 1'b1;
                        end
                    end else if (tick_cnt == 4'd15) begin
                        // End of stop bit period - return to idle
                        state_next = IDLE;
                        rx_busy_next = 1'b0;
                        tick_cnt_next = 4'd0;
                    end
                end
            end

            default: begin
                state_next = IDLE;
                rx_busy_next = 1'b0;
            end
        endcase
    end

    //=========================================================================
    // Sequential Logic - State Registers
    //=========================================================================
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            state <= IDLE;
            tick_cnt <= 4'd0;
            bit_cnt <= 3'd0;
            shift_reg <= 8'd0;
            rx_data_o <= 8'd0;
            rx_valid_o <= 1'b0;
            rx_frame_err_o <= 1'b0;
            rx_busy_o <= 1'b0;
        end else begin
            state <= state_next;
            tick_cnt <= tick_cnt_next;
            bit_cnt <= bit_cnt_next;
            shift_reg <= shift_reg_next;
            rx_data_o <= rx_data_next;
            rx_valid_o <= rx_valid_next;
            rx_frame_err_o <= rx_frame_err_next;
            rx_busy_o <= rx_busy_next;
        end
    end

endmodule
