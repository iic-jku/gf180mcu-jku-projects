//=============================================================================
// rh_bf_top.v - TinyBF GF180 Board-Level Interface
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-28
// Version:     2.0
//
// Description:
//   GF180 tapeout board interface for TinyBF Brainfuck CPU
//   Maps standard I/O pins to bf_top module interface
//   Supports program upload via UART and default program on reset
//
// Pin Mapping:
//   Dedicated Inputs (ui_in):
//     ui[0]:     UART RX serial input (for Brainfuck ',' input command)
//     ui[1]:     Start execution (pulse high to begin from PC=0)
//     ui[2]:     Halt execution (pulse high to stop)
//     ui[3]:     Programming mode (1=upload program, 0=execute)
//
//   Bidirectional I/O (uio) - All outputs:
//     uio[3:0]:  Data pointer [3:0] (4-bit tape address, 0-15)
//
//   Dedicated Outputs (uo_out):
//     uo[0]:     UART TX serial output (for Brainfuck '.' output command)
//     uo[1]:     CPU busy status (high when executing)
//     uo[6:2]:   Program counter [4:0] (all 5 bits)
//=============================================================================


module rh_bf_top (
	input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset
	input  wire [3:0] ui_in,    // Dedicated inputs
	
	output wire [3:0] uio_out,  // IOs: Output path
    output wire [6:0] uo_out    // Dedicated outputs
);

    //=========================================================================
    // Parameters
    //=========================================================================
    localparam ADDR_W = 5;              // 32 program memory locations
    localparam TAPE_ADDR_W = 4;         // 16 tape cells
    localparam CLK_FREQ = 25000000;     // 25 MHz system clock
    localparam BAUD_RATE = 115200;      // UART baud rate

    //=========================================================================
    // Internal Signals
    //=========================================================================
    wire [4:0] pc;              // Program counter (5-bit for 32 instructions)
    wire [3:0] dp;              // Data pointer (4-bit for 16 cells)
    wire [7:0] cell_data;       // Current cell value
    wire       cpu_busy;        // CPU busy status
    wire       prog_busy;       // Programmer busy status
    wire       uart_tx;         // UART transmit output

    //=========================================================================
    // Bidirectional I/O Output Assignment
    //=========================================================================
    assign uio_out[3:0] = dp[3:0];         // Data pointer [3:0] (all 4 bits)

    //=========================================================================
    // Dedicated Output Assignment
    //=========================================================================
    assign uo_out[0]   = uart_tx;                 // UART TX output
    assign uo_out[1]   = cpu_busy | prog_busy;    // CPU or programmer busy status
    assign uo_out[6:2] = pc[4:0];                 // Program counter [4:0] (all 5 bits)

    //=========================================================================
    // BF Top Module Instantiation
    //=========================================================================
    bf_top #(
        .ADDR_W      (ADDR_W),
        .TAPE_ADDR_W (TAPE_ADDR_W),
        .CLK_FREQ    (CLK_FREQ),
        .BAUD_RATE   (BAUD_RATE)
    ) u_bf_core (
        // Clock and reset
        .clk_i         (clk),
        .rst_i         (rst_n),        // Active-low reset
        
        // UART interface
        .uart_rx_i     (ui_in[0]),     // UART RX from ui[0]
        .uart_tx_o     (uart_tx),      // UART TX output
        
        // CPU control
        .start_i       (ui_in[1]),     // Start execution from ui[1]
        .halt_i        (ui_in[2]),     // Halt execution from ui[2]
        .prog_mode_i   (ui_in[3]),     // Programming mode from ui[3]
        
        // Debug outputs
        .pc_o          (pc),           // Program counter
        .dp_o          (dp),           // Data pointer
        .cell_data_o   (cell_data),    // Cell data
        .cpu_busy_o    (cpu_busy),     // CPU busy to uo[1]
        .prog_busy_o   (prog_busy)     // Programmer busy (internal)
    );

endmodule