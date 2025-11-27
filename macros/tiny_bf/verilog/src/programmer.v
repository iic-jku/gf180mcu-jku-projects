//=============================================================================
// programmer.v - TinyBF Program Uploader via UART
//=============================================================================
// Project:     TinyBF - Tiny Tapeout Sky 25B Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-25
// Version:     1.0
//
// Description:
//   UART-based programmer for uploading Brainfuck programs to RAM
//   Receives bytes via UART RX and writes to program memory
//   Simple protocol: Each byte is one instruction, written sequentially
//   Address auto-increments after each write
//
// Protocol:
//   - When prog_mode_i=1, programmer is active
//   - Each UART byte received is written to program memory
//   - Address starts at 0 and auto-increments
//   - When prog_mode_i=0, programmer is disabled
//
// Parameters:
//   INSTR_W:     Instruction width in bits (default 8)
//   ADDR_W:      Program address width (default 5 = 32 instructions)
//
// Interfaces:
//   clk_i:           System clock
//   rst_i:           Active-low reset
//   prog_mode_i:     Programming mode enable (1=program, 0=execute)
//   uart_data_i:     UART received data byte
//   uart_valid_i:    UART data valid (1-cycle pulse)
//   prog_wen_o:      Program memory write enable
//   prog_waddr_o:    Program memory write address
//   prog_wdata_o:    Program memory write data
//   prog_busy_o:     Programmer busy (high during write operation)
//
//=============================================================================

`timescale 1ns/1ps

module programmer #(
    parameter integer INSTR_W = 8,
    parameter integer ADDR_W = 5
) (
    input  wire                 clk_i,
    input  wire                 rst_i,        // Active-low reset
    
    // Control
    input  wire                 prog_mode_i,  // Programming mode enable
    
    // UART interface
    input  wire [INSTR_W-1:0]   uart_data_i,  // Received data byte
    input  wire                 uart_valid_i, // Data valid (1-cycle pulse)
    
    // Program memory write interface
    output reg                  prog_wen_o,
    output reg  [ADDR_W-1:0]    prog_waddr_o,
    output reg  [INSTR_W-1:0]   prog_wdata_o,
    
    // Status
    output wire                 prog_busy_o
);

    //=========================================================================
    // State Encoding
    //=========================================================================
    localparam S_IDLE  = 2'b00;
    localparam S_WRITE = 2'b01;
    localparam S_WAIT  = 2'b10;

    //=========================================================================
    // Registers
    //=========================================================================
    reg [1:0] state;
    reg [1:0] next_state;
    
    reg [ADDR_W-1:0] addr;
    reg [ADDR_W-1:0] next_addr;
    
    reg [INSTR_W-1:0] data_reg;
    reg [INSTR_W-1:0] next_data_reg;

    //=========================================================================
    // Combinational Logic - Next State
    //=========================================================================
    always @(*) begin
        // Default assignments
        next_state = state;
        next_addr = addr;
        next_data_reg = data_reg;
        prog_wen_o = 1'b0;
        prog_waddr_o = addr;
        prog_wdata_o = data_reg;
        
        case (state)
            S_IDLE: begin
                if (prog_mode_i && uart_valid_i) begin
                    // Latch incoming data
                    next_data_reg = uart_data_i;
                    next_state = S_WRITE;
                end else if (!prog_mode_i) begin
                    // Reset address when exiting programming mode
                    next_addr = {ADDR_W{1'b0}};
                end
            end
            
            S_WRITE: begin
                // Write to program memory
                prog_wen_o = 1'b1;
                prog_waddr_o = addr;
                prog_wdata_o = data_reg;
                next_state = S_WAIT;
            end
            
            S_WAIT: begin
                // Wait 1 cycle, then increment address
                next_addr = addr + 1'b1;
                next_state = S_IDLE;
            end
            
            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    //=========================================================================
    // Sequential Logic - State Register
    //=========================================================================
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            state <= S_IDLE;
            addr <= {ADDR_W{1'b0}};
            data_reg <= {INSTR_W{1'b0}};
        end else begin
            state <= next_state;
            addr <= next_addr;
            data_reg <= next_data_reg;
        end
    end

    //=========================================================================
    // Status Output
    //=========================================================================
    assign prog_busy_o = (state != S_IDLE);

endmodule
