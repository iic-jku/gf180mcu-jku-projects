//=============================================================================
// reset_sync.v - TinyBF Reset Synchronizer
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Synchronizes asynchronous reset for metastability protection
//   3-stage synchronizer: asynchronous assertion, synchronous deassertion
//
// Parameters:
//   None
//
// Interfaces:
//   clk_i:        System clock
//   async_rst_i:  Asynchronous reset input (active-low)
//   sync_rst_o:   Synchronized reset output (active-low, deasserts after 3 cycles)

`timescale 1ns/1ps

module reset_sync (
    input  wire  clk_i,           // System clock
    input  wire  async_rst_i,     // Asynchronous reset input (active low)
    output wire  sync_rst_o       // Synchronized reset output (active low)
);

    // 3-stage synchronization chain
    reg [2:0] reset_sync_chain;

    // Async assertion, sync deassertion
    always @(posedge clk_i or negedge async_rst_i) begin
        if (!async_rst_i) begin
            reset_sync_chain <= 3'b000;
        end else begin
            reset_sync_chain <= {reset_sync_chain[1:0], 1'b1};
        end
    end

    assign sync_rst_o = reset_sync_chain[2];

endmodule
