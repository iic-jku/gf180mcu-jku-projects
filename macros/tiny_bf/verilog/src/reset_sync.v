//=============================================================================
// reset_sync.v - TinyBF Reset Synchronizer
//=============================================================================
// Project:     TinyBF - Tiny Tapeout Sky 25B Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Synchronizes asynchronous reset deassertion to prevent timing violations
//   3-stage synchronizer for metastability protection
//   Asynchronous assertion, synchronous deassertion
//   Synthesis attributes prevent optimization
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

    // 3-stage synchronization chain for metastability protection
    reg [2:0] reset_sync_chain;

    // Reset synchronization logic
    // Async assertion (immediate): When async_rst_i=0, all stages -> 0
    // Sync deassertion (gradual): When async_rst_i=1, shift in 1's over 3 clocks
    always @(posedge clk_i or negedge async_rst_i) begin
        if (!async_rst_i) begin
            // Asynchronous reset assertion - immediate response
            reset_sync_chain <= 3'b000;
        end else begin
            // Synchronous reset deassertion - shift 1's through chain
            reset_sync_chain <= {reset_sync_chain[1:0], 1'b1};
        end
    end

    // Output from final stage ensures 3 clock cycles of synchronization
    assign sync_rst_o = reset_sync_chain[2];

endmodule
