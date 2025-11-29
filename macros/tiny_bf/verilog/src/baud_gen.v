//=============================================================================
// baud_gen.v - TinyBF UART Baud Rate Generator
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Generates 16x and 1x baud rate ticks for UART operation
//   Single counter with registered outputs
//   16x tick for RX mid-bit sampling, 1x tick for TX bit timing
//
// Parameters:
//   CLK_FREQ:  System clock frequency in Hz (default 25,000,000)
//   BAUD_RATE: Target baud rate in bps (default 115200)
//
// Interfaces:
//   clk_i:      System clock
//   rst_i:      Active-low reset
//   tick_16x_o: 16x oversampled tick (1 clock pulse every 16x period)
//   tick_1x_o:  1x baud tick (1 clock pulse every baud period)
//=============================================================================

`timescale 1ns/1ps
module baud_gen #(
    parameter CLK_FREQ = 25000000,   // System clock frequency (Hz)
    parameter BAUD_RATE = 115200     // Target baud rate (bps)
)(
    input  wire        clk_i,          // System clock
    input  wire        rst_i,          // Active-low reset
    output reg         tick_16x_o,     // 16x oversampled tick (1 clock pulse)
    output reg         tick_1x_o       // 1x baud tick (1 clock pulse)
);

    // Calculate divisor for 16x oversampling
    // Divide by 16 gives the number of clocks per 16x tick
    localparam DIVISOR_16X = CLK_FREQ / (BAUD_RATE * 16);
    localparam COUNTER_WIDTH = $clog2(DIVISOR_16X);

    // Counters
    reg [COUNTER_WIDTH-1:0] cnt_16x;   // Counter for 16x tick
    reg [3:0] cnt_1x;                  // Counter for 1x tick (0-15)

    // 16x tick generation
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            cnt_16x <= {COUNTER_WIDTH{1'b0}};
            tick_16x_o <= 1'b0;
        end else begin
            // Compare and reset
            if (cnt_16x == DIVISOR_16X[COUNTER_WIDTH-1:0] - 1'b1) begin
                cnt_16x <= {COUNTER_WIDTH{1'b0}};
                tick_16x_o <= 1'b1;
            end else begin
                cnt_16x <= cnt_16x + 1'b1;
                tick_16x_o <= 1'b0;
            end
        end
    end

    // 1x tick generation (divide 16x by 16)
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            cnt_1x <= 4'd0;
            tick_1x_o <= 1'b0;
        end else begin
            if (tick_16x_o) begin
                if (cnt_1x == 4'd15) begin
                    cnt_1x <= 4'd0;
                    tick_1x_o <= 1'b1;
                end else begin
                    cnt_1x <= cnt_1x + 1'b1;
                    tick_1x_o <= 1'b0;
                end
            end else begin
                tick_1x_o <= 1'b0;
            end
        end
    end

endmodule
