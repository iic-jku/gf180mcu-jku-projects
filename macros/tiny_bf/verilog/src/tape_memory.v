//=============================================================================
// tape_memory.v - TinyBF Data Tape Memory (Runtime Data Storage)
//=============================================================================
// Project:     TinyBF - Tiny Tapeout Sky 25B Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Synchronous dual-port RAM for Brainfuck data tape
//   Write-first semantics (simultaneous read/write returns new data)
//   1-cycle read latency, synchronous reset clears all cells
//
// Parameters:
//   CELL_W: Data cell width in bits (default 8)
//   DEPTH:  Number of tape cells (default 8, must be power of 2)
//
// Interfaces:
//   clk_i:   System clock
//   rst_i:   Active-low reset (clears all cells)
//   ren_i:   Read enable
//   raddr_i: Read address
//   rdata_o: Read data (valid 1 cycle after ren_i assertion)
//   wen_i:   Write enable
//   waddr_i: Write address
//   wdata_i: Write data
//=============================================================================

`timescale 1ns/1ps
module tape_memory #(
    parameter integer CELL_W = 8,
    parameter integer DEPTH  = 16
) (
    input  wire                      clk_i,
    input  wire                      rst_i,
    // Read port
    input  wire                      ren_i,
    input  wire [$clog2(DEPTH)-1:0]  raddr_i,
    output reg  [CELL_W-1:0]         rdata_o,
    // Write port
    input  wire                      wen_i,
    input  wire [$clog2(DEPTH)-1:0]  waddr_i,
    input  wire [CELL_W-1:0]         wdata_i
);

    // Memory storage array
    reg [CELL_W-1:0] mem [0:DEPTH-1];

    // Initialize memory to zero for simulation
    integer i;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            mem[i] = {CELL_W{1'b0}};
        end
    end

    // Synchronous write and read with write-first behavior
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            // Clear all memory on reset (critical for repeatable execution)
            for (i = 0; i < DEPTH; i = i + 1) begin
                mem[i] <= {CELL_W{1'b0}};
            end
            rdata_o <= {CELL_W{1'b0}};
        end else begin
            // Write operation
            if (wen_i) begin
                mem[waddr_i] <= wdata_i;
            end

            // Read operation with write-first semantics
            if (ren_i) begin
                if (wen_i && (waddr_i == raddr_i)) begin
                    // Write-first: return the data being written
                    rdata_o <= wdata_i;
                end else begin
                    // Normal read from memory
                    rdata_o <= mem[raddr_i];
                end
            end
            // Note: If ren_i is low, rdata_o retains its previous value
        end
    end

endmodule
