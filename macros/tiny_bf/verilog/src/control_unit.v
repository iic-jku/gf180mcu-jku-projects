//=============================================================================
// control_unit.v - TinyBF CPU Control Unit (11-State FSM)
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-26
// Version:     2.0
//
// Description:
//   Main CPU execution unit implementing Brainfuck instruction set
//   11-state FSM with binary encoding (4-bit state register)
//   Synchronous memory interfaces with 1-cycle read latency
//
// Parameters:
//   ADDR_W:      Program memory address width (default 5 = 32 instructions)
//   INSTR_W:     Instruction width (default 8 bits)
//   CELL_W:      Data cell width (default 8 bits)
//   TAPE_ADDR_W: Data tape address width (default 4 = 16 cells)
//
// Interfaces:
//   clk_i, rst_i:        Clock and active-low reset
//   prog_raddr_o/ren_o:  Program memory read port
//   prog_rdata_i:        Program memory read data
//   tape_addr_r_o/ren_o: Tape memory read port
//   tape_rdata_i:        Tape memory read data
//   tape_addr_w_o/wen_o: Tape memory write port
//   tape_wdata_o:        Tape memory write data
//   uart_tx_*:           UART transmitter interface
//   uart_rx_*:           UART receiver interface
//   start_run_i:         Start execution from PC=0
//   halt_i:              Stop execution
//   pc_out_o:            Program counter (debug)
//   dp_out_o:            Data pointer (debug)
//   cell_out_o:          Last read cell value (debug)
//=============================================================================

`timescale 1ns/1ps
module control_unit #(
    parameter ADDR_W = 5,          // program address width (32 entries)
    parameter INSTR_W = 8,         // instruction width
    parameter CELL_W = 8,          // cell width
    parameter TAPE_ADDR_W = 4      // data tape address width (16 cells)
)(
    input  wire                      clk_i,
    input  wire                      rst_i,

    // Program memory interface
    output wire [ADDR_W-1:0]         prog_raddr_o,
    output wire                      prog_ren_o,
    input  wire [INSTR_W-1:0]        prog_rdata_i,

    // Data memory (tape) interface
    output wire [TAPE_ADDR_W-1:0]   tape_addr_r_o,
    output wire                     tape_ren_o,
    input  wire [CELL_W-1:0]        tape_rdata_i,
    output wire [TAPE_ADDR_W-1:0]   tape_addr_w_o,
    output wire                     tape_wen_o,
    output wire [CELL_W-1:0]        tape_wdata_o,

    // UART TX
    output wire [CELL_W-1:0]        uart_tx_byte_o,
    output wire                     uart_tx_start_o,
    input  wire                     uart_tx_busy_i,

    // UART RX
    input  wire [CELL_W-1:0]        uart_rx_byte_i,
    input  wire                     uart_rx_valid_i,

    // High-level control
    input  wire                     start_run_i,   // pulse to start running from PC=0
    input  wire                     halt_i,        // pulse to stop (not used heavily)
    output wire [ADDR_W-1:0]        pc_out_o,      // debug
    output wire [TAPE_ADDR_W-1:0]   dp_out_o,      // debug
    output wire [CELL_W-1:0]        cell_out_o     // debug (last-read cell)
);

    // ----------------------------
    // Opcodes
    // ----------------------------
    localparam [2:0] OP_DP_INC   = 3'b000; // '>'
    localparam [2:0] OP_DP_DEC   = 3'b001; // '<'
    localparam [2:0] OP_CELL_INC = 3'b010; // '+'
    localparam [2:0] OP_CELL_DEC = 3'b011; // '-'
    localparam [2:0] OP_OUT      = 3'b100; // '.'
    localparam [2:0] OP_IN       = 3'b101; // ','
    localparam [2:0] OP_JZ       = 3'b110; // '[' -> JZ rel offset
    localparam [2:0] OP_JNZ      = 3'b111; // ']' -> JNZ rel offset

    // Special instructions
    // HALT: DP_INC with arg=0 (instruction 0x00)
    localparam [7:0] INSTR_HALT = 8'h00;

    // State encoding (4 bits for 11 states)
    localparam [3:0] S_IDLE        = 4'd0;
    localparam [3:0] S_FETCH       = 4'd1;
    localparam [3:0] S_WAIT_FETCH  = 4'd2;
    localparam [3:0] S_DECODE      = 4'd3;
    localparam [3:0] S_READ_CELL   = 4'd4;
    localparam [3:0] S_WAIT_CELL   = 4'd5;
    localparam [3:0] S_EXECUTE     = 4'd6;
    localparam [3:0] S_WRITE_CELL  = 4'd7;
    localparam [3:0] S_WAIT_TX     = 4'd8;
    localparam [3:0] S_WAIT_RX     = 4'd9;
    localparam [3:0] S_HALT        = 4'd10;

    // State registers
    reg [3:0] state, next_state;

    // Core registers
    reg [ADDR_W-1:0] pc, pc_next;
    reg [INSTR_W-1:0] instr_reg, instr_reg_next;
    reg [TAPE_ADDR_W-1:0] dp, dp_next;
    reg [CELL_W-1:0] cell_reg, cell_reg_next;

    // Control signals
    reg prog_ren, prog_ren_next;
    reg [ADDR_W-1:0] prog_raddr, prog_raddr_next;
    reg tape_ren, tape_ren_next;
    reg [TAPE_ADDR_W-1:0] tape_addr_r, tape_addr_r_next;
    reg tape_wen, tape_wen_next;
    reg [TAPE_ADDR_W-1:0] tape_addr_w, tape_addr_w_next;
    reg [CELL_W-1:0] tape_wdata, tape_wdata_next;
    reg uart_tx_start, uart_tx_start_next;
    reg [CELL_W-1:0] uart_tx_byte, uart_tx_byte_next;

    // Instruction decode (uses latched instruction from instr_reg)
    wire [2:0] opcode = instr_reg[7:5];
    wire [4:0] arg5 = instr_reg[4:0];
    
    // PC arithmetic with sign extension for jumps
    wire signed [ADDR_W:0] arg_signed;
    generate
        if (ADDR_W >= 5) begin : gen_pc_full_arg
            assign arg_signed = $signed({{(ADDR_W+1-5){arg5[4]}}, arg5});
        end else begin : gen_pc_truncate_arg
            assign arg_signed = $signed({arg5[ADDR_W-1], arg5[ADDR_W-1:0]});
        end
    endgenerate
    wire signed [ADDR_W:0] pc_ext = $signed({1'b0, pc});
    /* verilator lint_off UNUSEDSIGNAL */
    wire signed [ADDR_W:0] pc_plus1 = pc_ext + 1;
    wire [ADDR_W:0] temp_pc_jump = pc_ext + arg_signed;
    /* verilator lint_on UNUSEDSIGNAL */
    wire [ADDR_W-1:0] pc_jump = temp_pc_jump[ADDR_W-1:0];
    wire [ADDR_W-1:0] pc_inc = pc_plus1[ADDR_W-1:0];

    // Data pointer arithmetic with sign extension
    wire signed [TAPE_ADDR_W:0] arg_dp_signed;
    generate
        if (TAPE_ADDR_W >= 5) begin : gen_extend_arg
            assign arg_dp_signed = $signed({{(TAPE_ADDR_W+1-5){arg5[4]}}, arg5});
        end else begin : gen_truncate_arg
            assign arg_dp_signed = $signed({arg5[TAPE_ADDR_W-1], arg5[TAPE_ADDR_W-1:0]});
        end
    endgenerate
    
    wire signed [TAPE_ADDR_W:0] dp_ext = $signed({1'b0, dp});
    /* verilator lint_off UNUSEDSIGNAL */
    wire [TAPE_ADDR_W:0] temp_dp_inc = dp_ext + arg_dp_signed;
    wire [TAPE_ADDR_W:0] temp_dp_dec = dp_ext - arg_dp_signed;
    /* verilator lint_on UNUSEDSIGNAL */
    wire [TAPE_ADDR_W-1:0] dp_inc = temp_dp_inc[TAPE_ADDR_W-1:0];
    wire [TAPE_ADDR_W-1:0] dp_dec = temp_dp_dec[TAPE_ADDR_W-1:0];

    // Cell arithmetic
    wire signed [CELL_W:0] cell_ext = {1'b0, cell_reg};
    wire signed [CELL_W:0] cell_offset = $signed({{(CELL_W+1-5){arg5[4]}}, arg5});
    /* verilator lint_off UNUSEDSIGNAL */
    wire [CELL_W:0] temp_cell_inc = cell_ext + cell_offset;  
    wire [CELL_W:0] temp_cell_dec = cell_ext - cell_offset;
    /* verilator lint_on UNUSEDSIGNAL */
    wire [CELL_W-1:0] cell_inc = temp_cell_inc[CELL_W-1:0];
    wire [CELL_W-1:0] cell_dec = temp_cell_dec[CELL_W-1:0];

    // ----------------------------
    // Combinational Logic Block
    // ----------------------------
    always @(*) begin
        // Default next values (maintain current state)
        next_state = state;
        pc_next = pc;
        instr_reg_next = instr_reg;
        dp_next = dp;
        cell_reg_next = cell_reg;

        // Default control signals (inactive)
        prog_ren_next = 1'b0;
        prog_raddr_next = pc;
        tape_ren_next = 1'b0;
        tape_addr_r_next = dp;
        tape_wen_next = 1'b0;
        tape_addr_w_next = dp;
        tape_wdata_next = {CELL_W{1'b0}};
        uart_tx_start_next = 1'b0;
        uart_tx_byte_next = {CELL_W{1'b0}};

        case (state)
            S_IDLE: begin
                // Keep program address at 0 during IDLE to avoid X propagation
                prog_raddr_next = {ADDR_W{1'b0}};
                if (start_run_i && !halt_i) begin
                    next_state = S_FETCH;
                    pc_next = {ADDR_W{1'b0}};
                end
            end

            S_FETCH: begin
                // Request instruction fetch from synchronous memory
                prog_ren_next = 1'b1;
                prog_raddr_next = pc;
                next_state = S_WAIT_FETCH;
            end

            S_WAIT_FETCH: begin
                // Data becomes valid this cycle
                prog_raddr_next = pc;
                next_state = S_DECODE;
            end

            S_DECODE: begin
                // prog_rdata_i is now valid (two cycles after read request)
                // Latch instruction for use in subsequent states
                instr_reg_next = prog_rdata_i;
                
                // Check for HALT instruction (0x00)
                if (prog_rdata_i == INSTR_HALT) begin
                    next_state = S_HALT;
                end else begin
                    // Route to execution path based on instruction type
                    case (prog_rdata_i[7:5])
                        OP_DP_INC, OP_DP_DEC: begin
                            // Data pointer operations don't need cell value
                            next_state = S_EXECUTE;
                        end

                        OP_IN: begin
                            // Input operation doesn't need cell value
                            next_state = S_EXECUTE;
                        end

                        OP_CELL_INC, OP_CELL_DEC, OP_OUT, OP_JZ, OP_JNZ: begin
                            // These operations need current cell value
                            tape_ren_next = 1'b1;
                            tape_addr_r_next = dp;
                            next_state = S_READ_CELL;
                        end

                        default: begin
                            // Unknown opcode = NOP
                            pc_next = pc_inc;
                            next_state = S_FETCH;
                        end
                    endcase
                end
            end

            S_READ_CELL: begin
                // Data becomes valid this cycle
                tape_addr_r_next = dp;
                next_state = S_WAIT_CELL;
            end

            S_WAIT_CELL: begin
                // Tape data now valid
                cell_reg_next = tape_rdata_i;
                next_state = S_EXECUTE;
            end

            S_EXECUTE: begin
                case (opcode)
                    OP_DP_INC: begin
                        dp_next = dp_inc;
                        pc_next = pc_inc;
                        next_state = S_FETCH;
                    end

                    OP_DP_DEC: begin
                        dp_next = dp_dec;
                        pc_next = pc_inc;
                        next_state = S_FETCH;
                    end

                    OP_CELL_INC: begin
                        tape_wdata_next = cell_inc;
                        tape_addr_w_next = dp;
                        tape_wen_next = 1'b1;
                        pc_next = pc_inc;
                        next_state = S_WRITE_CELL;
                    end

                    OP_CELL_DEC: begin
                        tape_wdata_next = cell_dec;
                        tape_addr_w_next = dp;
                        tape_wen_next = 1'b1;
                        pc_next = pc_inc;
                        next_state = S_WRITE_CELL;
                    end

                    OP_OUT: begin
                        uart_tx_byte_next = cell_reg;
                        if (!uart_tx_busy_i) begin
                            uart_tx_start_next = 1'b1;
                            pc_next = pc_inc;
                            next_state = S_FETCH;
                        end else begin
                            next_state = S_WAIT_TX;
                        end
                    end

                    OP_IN: begin
                        if (uart_rx_valid_i) begin
                            // Input available, write to cell
                            tape_wdata_next = uart_rx_byte_i;
                            tape_addr_w_next = dp;
                            tape_wen_next = 1'b1;
                            pc_next = pc_inc;
                            next_state = S_WRITE_CELL;
                        end else begin
                            // Wait for input
                            next_state = S_WAIT_RX;
                        end
                    end

                    OP_JZ: begin
                        if (cell_reg == {CELL_W{1'b0}}) begin
                            pc_next = pc_jump;
                        end else begin
                            pc_next = pc_inc;
                        end
                        next_state = S_FETCH;
                    end

                    OP_JNZ: begin
                        if (cell_reg != {CELL_W{1'b0}}) begin
                            pc_next = pc_jump;
                        end else begin
                            pc_next = pc_inc;
                        end
                        next_state = S_FETCH;
                    end

                    default: begin
                        pc_next = pc_inc;
                        next_state = S_FETCH;
                    end
                endcase
            end

            S_WRITE_CELL: begin
                // Memory write completed, continue to next instruction
                next_state = S_FETCH;
            end

            S_WAIT_TX: begin
                // Wait for UART transmitter to be ready
                uart_tx_byte_next = cell_reg;
                if (!uart_tx_busy_i) begin
                    uart_tx_start_next = 1'b1;
                    pc_next = pc_inc;
                    next_state = S_FETCH;
                end
            end

            S_WAIT_RX: begin
                // Wait for UART receiver to provide data
                if (uart_rx_valid_i) begin
                    // Data available, latch and write
                    tape_wdata_next = uart_rx_byte_i;
                    tape_addr_w_next = dp;
                    tape_wen_next = 1'b1;
                    pc_next = pc_inc;
                    next_state = S_WRITE_CELL;
                end
            end

            S_HALT: begin
                next_state = S_HALT;
            end

            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    // ----------------------------
    // Sequential Logic Block
    // ----------------------------
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            // Reset all registers to initial values
            state <= S_IDLE;
            pc <= {ADDR_W{1'b0}};
            instr_reg <= {INSTR_W{1'b0}};
            dp <= {TAPE_ADDR_W{1'b0}};
            cell_reg <= {CELL_W{1'b0}};

            // Reset control signals
            prog_ren <= 1'b0;
            prog_raddr <= {ADDR_W{1'b0}};
            tape_ren <= 1'b0;
            tape_addr_r <= {TAPE_ADDR_W{1'b0}};
            tape_wen <= 1'b0;
            tape_addr_w <= {TAPE_ADDR_W{1'b0}};
            tape_wdata <= {CELL_W{1'b0}};
            uart_tx_start <= 1'b0;
            uart_tx_byte <= {CELL_W{1'b0}};
        end else begin
            // Update all registers from next values
            state <= next_state;
            pc <= pc_next;
            instr_reg <= instr_reg_next;
            dp <= dp_next;
            cell_reg <= cell_reg_next;

            // Update control signals
            prog_ren <= prog_ren_next;
            prog_raddr <= prog_raddr_next;
            tape_ren <= tape_ren_next;
            tape_addr_r <= tape_addr_r_next;
            tape_wen <= tape_wen_next;
            tape_addr_w <= tape_addr_w_next;
            tape_wdata <= tape_wdata_next;
            uart_tx_start <= uart_tx_start_next;
            uart_tx_byte <= uart_tx_byte_next;
        end
    end

    // ----------------------------
    // Output Assignments
    // ----------------------------
    // Program memory
    assign prog_raddr_o = prog_raddr;
    assign prog_ren_o   = prog_ren;

    // Tape read port
    assign tape_addr_r_o = tape_addr_r;
    assign tape_ren_o    = tape_ren;

    // Tape write port
    assign tape_addr_w_o = tape_addr_w;
    assign tape_wen_o    = tape_wen;
    assign tape_wdata_o  = tape_wdata;

    // UART TX
    assign uart_tx_byte_o  = uart_tx_byte;
    assign uart_tx_start_o = uart_tx_start;

    // Debug
    assign pc_out_o  = pc;
    assign dp_out_o  = dp;
    assign cell_out_o = cell_reg;

endmodule
