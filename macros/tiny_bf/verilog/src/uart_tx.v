//=============================================================================
// uart_tx.v - TinyBF UART Transmitter (8N1 Serial Output)
//=============================================================================
// Project:     TinyBF - Tiny Tapeout Sky 25B Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Standard 8N1 UART transmitter (1 start, 8 data LSB-first, 1 stop)
//   4-state FSM with registered outputs
//   Baud rate controlled by external 1x tick generator
//
// Parameters:
//   None
//
// Interfaces:
//   clk_i:        System clock
//   rst_i:        Active-low reset
//   baud_tick_i:  Baud rate tick (1x, from baud_gen)
//   tx_start_i:   Start transmission (pulse)
//   tx_data_i:    Data byte to transmit (latched on tx_start_i)
//   tx_serial_o:  Serial output line (idles high)
//   tx_busy_o:    Busy flag (high during transmission)
//=============================================================================

`timescale 1ns/1ps
module uart_tx (
    input  wire        clk_i,          // System clock
    input  wire        rst_i,          // Active-low reset
    input  wire        baud_tick_i,    // Baud rate tick (1x)
    input  wire        tx_start_i,     // Start transmission (pulse)
    input  wire  [7:0] tx_data_i,      // Data to transmit
    output reg         tx_serial_o,    // Serial output (idles high)
    output reg         tx_busy_o       // Busy flag
);

    // State encoding
    localparam [1:0] IDLE      = 2'b00;
    localparam [1:0] START_BIT = 2'b01;
    localparam [1:0] DATA_BITS = 2'b10;
    localparam [1:0] STOP_BIT  = 2'b11;

    // Registers
    reg [1:0] state;
    reg [2:0] bit_cnt;      // 0-7 for data bits
    reg [7:0] shift_reg;    // Shift register for data

    // FSM and datapath
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            state <= IDLE;
            bit_cnt <= 3'd0;
            shift_reg <= 8'd0;
            tx_serial_o <= 1'b1;   // Idle high
            tx_busy_o <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    tx_serial_o <= 1'b1;   // Idle high
                    tx_busy_o <= 1'b0;
                    
                    if (tx_start_i) begin
                        shift_reg <= tx_data_i;    // Latch data
                        state <= START_BIT;
                        tx_busy_o <= 1'b1;
                        tx_serial_o <= 1'b0;       // Pre-set start bit (look-ahead)
                    end
                end

                START_BIT: begin
                    // tx_serial_o already set to 0 from IDLE state
                    tx_busy_o <= 1'b1;
                    
                    if (baud_tick_i) begin
                        state <= DATA_BITS;
                        bit_cnt <= 3'd0;
                        tx_serial_o <= shift_reg[0];  // Pre-set first data bit
                    end
                end

                DATA_BITS: begin
                    // tx_serial_o already set from previous state
                    tx_busy_o <= 1'b1;
                    
                    if (baud_tick_i) begin
                        shift_reg <= {1'b0, shift_reg[7:1]};  // Shift right
                        
                        if (bit_cnt == 3'd7) begin
                            state <= STOP_BIT;
                            tx_serial_o <= 1'b1;    // Pre-set stop bit
                        end else begin
                            bit_cnt <= bit_cnt + 1'b1;
                            tx_serial_o <= shift_reg[1];  // Pre-set next data bit (after shift)
                        end
                    end
                end

                STOP_BIT: begin
                    // tx_serial_o already set to 1 from DATA_BITS state
                    tx_busy_o <= 1'b1;
                    
                    if (baud_tick_i) begin
                        state <= IDLE;
                        tx_busy_o <= 1'b0;
                        tx_serial_o <= 1'b1;    // Maintain idle high
                    end
                end

                default: begin
                    state <= IDLE;
                    tx_serial_o <= 1'b1;
                    tx_busy_o <= 1'b0;
                end
            endcase
        end
    end

endmodule
