//=============================================================================
// program_memory.v - TinyBF Program Memory (RAM - Programmable)
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-25
// Version:     3.0
//
// Description:
//   Synchronous dual-port RAM for Brainfuck program instructions
//   Write-first semantics (simultaneous read/write returns new data)
//   1-cycle read latency, synchronous reset clears all memory
//   Programs can be loaded via write port at runtime
//
// Default Program (16 instructions):
//   Character case converter: lowercase → uppercase via UART
//   Demonstrates: Input, arithmetic, conditional, output
//   Address | Instruction | Description
//   --------|-------------|------------
//   0       | ,           | Read character from UART into cell[0]
//   1       | >           | Move to cell[1] (working cell)
//   2       | +10         | cell[1] = 10 (newline character)
//   3       | <           | Back to cell[0]
//   4       | [           | Loop while cell[0] != 0 (not null):
//   5       | -15         | Subtract 15
//   6       | -15         | Subtract 15 (total -30)
//   7       | -2          | Subtract 2 more (total -32: lowercase→uppercase)
//   8       | .           | Output converted character via UART
//   9       | ,           | Read next character
//   10      | ]           | Jump back if cell[0] != 0
//   11      | >           | Move to cell[1]
//   12      | .           | Output newline (10)
//   13-15   | HALT        | Safety: halt at end
//
//   Example: Input "abc" → Output "ABC\n"
//   - Reads characters via UART RX (,)
//   - Converts lowercase to uppercase by subtracting 32 (via -15, -15, -2)
//   - Outputs via UART TX (.)
//   - Ends with newline
//
// Parameters:
//   DATA_W: Instruction width in bits (default 8)
//   DEPTH:  Number of memory locations (default 16, must be power of 2)
//
// Interfaces:
//   clk_i:   System clock
//   rst_i:   Active-low reset (clears all memory)
//   ren_i:   Read enable
//   raddr_i: Read address
//   rdata_o: Read data (valid 1 cycle after ren_i assertion)
//   wen_i:   Write enable
//   waddr_i: Write address
//   wdata_i: Write data
//
//=============================================================================

`timescale 1ns/1ps
module program_memory #(
    parameter integer DATA_W = 8,
    parameter integer DEPTH  = 32
) (
    input  wire                      clk_i,
    input  wire                      rst_i,    // Active-low reset
    // Read port
    input  wire                      ren_i,
    input  wire [$clog2(DEPTH)-1:0]  raddr_i,
    output reg  [DATA_W-1:0]         rdata_o,
    // Write port
    input  wire                      wen_i,
    input  wire [$clog2(DEPTH)-1:0]  waddr_i,
    input  wire [DATA_W-1:0]         wdata_i
);

    // ----------------------------
    // Memory Storage Array
    // ----------------------------
    reg [DATA_W-1:0] mem [0:DEPTH-1];

    // ----------------------------
    // Default Program (for initialization)
    // ----------------------------
    // Returns the default demo program instruction for given address
    function [DATA_W-1:0] default_program;
        input [$clog2(DEPTH)-1:0] addr;
        begin
            case (addr)
                // Demo: UART case converter (lowercase → UPPERCASE)
                // Shows: Input (,), Output (.), Arithmetic (-32 via -15 and -15 and -2), Loops ([])
                0:  default_program = 8'b101_00000;  // ,        Read character from UART into cell[0]
                1:  default_program = 8'b000_00001;  // >        Move to cell[1]
                2:  default_program = 8'b010_01010;  // +10      cell[1] = 10 (newline character)
                3:  default_program = 8'b001_00001;  // <        Move back to cell[0]
                4:  default_program = 8'b110_00110;  // [ +6     JZ to addr 10 if cell==0
                5:  default_program = 8'b011_01111;  // -15      Subtract 15
                6:  default_program = 8'b011_01111;  // -15      Subtract 15 (total -30, close to -32)
                7:  default_program = 8'b011_00010;  // -2       Subtract 2 more (total -32)
                8:  default_program = 8'b100_00000;  // .        Output converted character
                9:  default_program = 8'b101_00000;  // ,        Read next character
                10: default_program = 8'b111_11010;  // ] -6     JNZ to addr 4 if cell!=0
                11: default_program = 8'b000_00001;  // >        Move to cell[1] (newline)
                12: default_program = 8'b100_00000;  // .        Output newline
                13: default_program = 8'h00;         // HALT     End of program
                14: default_program = 8'h00;         // HALT
                15: default_program = 8'h00;         // HALT
                default: default_program = 8'h00;    // Safety: HALT for unused addresses
            endcase
        end
    endfunction

    // ----------------------------
    // Initialize Memory with Default Program
    // ----------------------------
    integer i;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            mem[i] = default_program(i[$clog2(DEPTH)-1:0]);
        end
    end

    // ----------------------------
    // Synchronous Write and Read (1-cycle latency)
    // ----------------------------
    // Write-first semantics: simultaneous read/write returns new data
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            // Reset: reload default program
            for (i = 0; i < DEPTH; i = i + 1) begin
                mem[i] <= default_program(i[$clog2(DEPTH)-1:0]);
            end
            rdata_o <= {DATA_W{1'b0}};
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
        end
    end

endmodule
