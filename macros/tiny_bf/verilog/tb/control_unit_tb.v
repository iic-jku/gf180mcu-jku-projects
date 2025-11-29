//=============================================================================
// control_unit_tb.v - TinyBF Control Unit Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     2.0
//
// Description:
//   Unit testbench for 11-state FSM control unit
//   Tests control signals, instruction execution, and state transitions in isolation
//   Uses binary state encoding (4-bit state register)

`timescale 1ns/1ps

module control_unit_tb;

    parameter ADDR_W = 3;          // 8 program locations
    parameter INSTR_W = 8;
    parameter CELL_W = 8;
    parameter TAPE_ADDR_W = 3;     // 8 tape cells
    parameter CLK_PERIOD = 40;
    
    // State encoding (MUST match control_unit.v binary encoding)
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

    // DUT signals
    reg                  clk;
    reg                  rst_n;
    reg                  start_run;
    reg                  halt;
    
    wire [ADDR_W-1:0]    prog_raddr;
    wire                 prog_ren;
    reg  [INSTR_W-1:0]   prog_rdata;
    
    wire [TAPE_ADDR_W-1:0] tape_addr_r;
    wire                   tape_ren;
    wire [TAPE_ADDR_W-1:0] tape_addr_w;
    wire                   tape_wen;
    wire [CELL_W-1:0]      tape_wdata;
    reg  [CELL_W-1:0]      tape_rdata;
    
    wire [CELL_W-1:0]    uart_tx_byte;
    wire                 uart_tx_start;
    reg                  uart_tx_busy;
    reg  [CELL_W-1:0]    uart_rx_byte;
    reg                  uart_rx_valid;
    
    wire [ADDR_W-1:0]    pc_out;
    wire [TAPE_ADDR_W-1:0] dp_out;
    wire [CELL_W-1:0]    cell_out;

    integer test_num;
    integer pass_count;
    integer fail_count;

    // Instantiate DUT
    control_unit #(
        .ADDR_W(ADDR_W),
        .INSTR_W(INSTR_W),
        .CELL_W(CELL_W),
        .TAPE_ADDR_W(TAPE_ADDR_W)
    ) dut (
        .clk_i(clk),
        .rst_i(rst_n),
        .prog_raddr_o(prog_raddr),
        .prog_ren_o(prog_ren),
        .prog_rdata_i(prog_rdata),
        .tape_addr_r_o(tape_addr_r),
        .tape_ren_o(tape_ren),
        .tape_rdata_i(tape_rdata),
        .tape_addr_w_o(tape_addr_w),
        .tape_wen_o(tape_wen),
        .tape_wdata_o(tape_wdata),
        .uart_tx_byte_o(uart_tx_byte),
        .uart_tx_start_o(uart_tx_start),
        .uart_tx_busy_i(uart_tx_busy),
        .uart_rx_byte_i(uart_rx_byte),
        .uart_rx_valid_i(uart_rx_valid),
        .start_run_i(start_run),
        .halt_i(halt),
        .pc_out_o(pc_out),
        .dp_out_o(dp_out),
        .cell_out_o(cell_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Main test sequence
    initial begin
        init_signals();
        
        #20;
        rst_n = 1'b1;
        #20;

        $display("\n========================================");
        $display("CONTROL UNIT ISOLATED TESTS");
        $display("========================================\n");

        // Test each instruction type independently
        test_dp_inc();
        test_dp_dec();
        test_cell_inc();
        test_cell_dec();
        test_output();
        test_input();
        test_jz_taken();
        test_jz_not_taken();
        test_jnz_taken();
        test_jnz_not_taken();
        test_dp_wraparound();
        test_cell_overflow();
        
        // Multi-instruction sequences (mini programs)
        test_simple_program();
        test_loop_simulation();
        test_conditional_skip();
        test_cell_manipulation_chain();
        test_uart_wait_states();
        
        // Edge cases
        test_pc_overflow();
        
        // Summary
        #100;
        $display("\n========================================");
        $display("TEST SUMMARY");
        $display("========================================");
        $display("Total tests: %0d", test_num);
        $display("Passed:      %0d", pass_count);
        $display("Failed:      %0d", fail_count);
        if (fail_count == 0) begin
            $display("\n*** ALL TESTS PASSED ***\n");
        end else begin
            $display("\n*** SOME TESTS FAILED ***\n");
        end

        #100;
        $finish;
    end

    //========================================================================
    // TEST CASES - Each tests one instruction type
    //========================================================================

    // Test: DP_INC instruction (opcode 000)
    task test_dp_inc;
        begin
            $display("TEST: DP_INC (Data Pointer Increment)");
            $display("--------------------------------------");
            
            // Setup: DP at position 2, increment by 3
            reset_to_known_state(3'd2);  // DP=2
            prog_rdata = 8'b000_00011;  // DP_INC, arg=3
            tape_rdata = 8'h00;
            
            // Execute: Start and run through instruction
            pulse_start();  // Ends positioned at negedge in S_FETCH
            
            // Verify state transitions: FETCH -> WAIT_FETCH -> DECODE -> EXECUTE -> FETCH
            check_state("DP_INC enters FETCH", S_FETCH);
            // prog_ren is registered and updates on posedge, check after one cycle
            @(posedge clk);  // State transitions FETCH->WAIT_FETCH, prog_ren becomes active
            @(negedge clk);  // Stable sample point
            check_signal("DP_INC FETCH: prog_ren", prog_ren, 1'b1);
            check_signal("DP_INC FETCH: prog_raddr", prog_raddr, 3'h0);
            check_state("DP_INC enters WAIT_FETCH", S_WAIT_FETCH);
            
            wait_cycles(1);  // WAIT_FETCH -> DECODE
            check_state("DP_INC enters DECODE", S_DECODE);
            
            wait_cycles(1);  // DECODE -> EXECUTE
            check_state("DP_INC enters EXECUTE", S_EXECUTE);
            
            wait_cycles(1);  // EXECUTE -> FETCH
            check_state("DP_INC returns to FETCH", S_FETCH);
            check_signal("DP_INC result: DP", dp_out, 3'd5);  // 2+3=5
            check_signal("DP_INC result: PC", pc_out, 3'd1);  // PC incremented

            // only for further visual checking
            wait_cycles(2);
            
            $display("  -> Verify state flow: FETCH->DECODE->EXECUTE->FETCH (uniform with other ops)\n");
        end
    endtask

    // Test: DP_DEC instruction (opcode 001)
    task test_dp_dec;
        begin
            $display("TEST: DP_DEC (Data Pointer Decrement)");
            $display("--------------------------------------");
            
            reset_to_known_state(3'd5);  // DP=5
            prog_rdata = 8'b001_00010;  // DP_DEC, arg=2
            tape_rdata = 8'h00;
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("DP_DEC enters FETCH", S_FETCH);
            wait_cycles(1);  // FETCH -> WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH -> DECODE
            check_state("DP_DEC enters DECODE", S_DECODE);
            wait_cycles(1);  // DECODE -> EXECUTE
            check_state("DP_DEC enters EXECUTE", S_EXECUTE);
            wait_cycles(1);  // EXECUTE -> FETCH
            check_state("DP_DEC returns to FETCH", S_FETCH);
            check_signal("DP_DEC result: DP", dp_out, 3'd3);  // 5-2=3
            check_signal("DP_DEC result: PC", pc_out, 3'h1);  // 0+1=1

            // only for further visual checking
            wait_cycles(2);
            
            $display("  -> Verify DP decremented correctly with EXECUTE state\n");
        end
    endtask

    // Test: CELL_INC instruction (opcode 010)
    task test_cell_inc;
        begin
            $display("TEST: CELL_INC (Cell Increment)");
            $display("--------------------------------");
            
            reset_to_known_state(3'd3);  // DP=3
            prog_rdata = 8'b010_00101;  // CELL_INC, arg=5
            tape_rdata = 8'd10;  // Current cell value
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            // State flow: FETCH -> WAIT_FETCH -> DECODE -> READ_CELL -> WAIT_CELL -> EXECUTE -> WRITE_CELL -> FETCH
            check_state("CELL_INC enters FETCH", S_FETCH);
            wait_cycles(1);  // FETCH -> WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH -> DECODE
            check_state("CELL_INC enters DECODE", S_DECODE);
            wait_cycles(1);  // DECODE -> READ_CELL
            check_state("CELL_INC enters READ_CELL", S_READ_CELL);
            check_signal("CELL_INC READ: tape_ren", tape_ren, 1'b1);
            check_signal("CELL_INC READ: tape_addr_r", tape_addr_r, 3'd3);
            wait_cycles(1);  // READ_CELL -> WAIT_CELL
            wait_cycles(1);  // WAIT_CELL -> EXECUTE
            check_state("CELL_INC enters EXECUTE", S_EXECUTE);
            wait_cycles(1);  // EXECUTE -> WRITE_CELL
            check_state("CELL_INC enters WRITE_CELL", S_WRITE_CELL);
            check_signal("CELL_INC WRITE: tape_wen", tape_wen, 1'b1);
            check_signal("CELL_INC WRITE: tape_addr_w", tape_addr_w, 3'd3);
            check_signal("CELL_INC WRITE: tape_wdata", tape_wdata, 8'd15);  // 10+5=15
            wait_cycles(1);  // WRITE_CELL -> FETCH
            check_state("CELL_INC returns to FETCH", S_FETCH);
            check_signal("CELL_INC result: PC", pc_out, 3'h1);  // 0+1=1
            
            $display("  -> Manual check: Verify full state sequence FETCH->DECODE->READ->EXECUTE->WRITE->FETCH\n");
        end
    endtask

    // Test: CELL_DEC instruction (opcode 011)
    task test_cell_dec;
        begin
            $display("TEST: CELL_DEC (Cell Decrement)");
            $display("--------------------------------");
            
            reset_to_known_state(3'd1);  // DP=1
            prog_rdata = 8'b011_00011;  // CELL_DEC, arg=3
            tape_rdata = 8'd20;  // Current cell value
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("CELL_DEC enters FETCH", S_FETCH);
            wait_cycles(2);  // FETCH -> WAIT_FETCH -> DECODE
            wait_cycles(1);  // DECODE -> READ_CELL
            check_state("CELL_DEC enters READ_CELL", S_READ_CELL);
            wait_cycles(2);  // READ_CELL -> WAIT_CELL -> EXECUTE
            wait_cycles(1);  // EXECUTE -> WRITE_CELL
            check_state("CELL_DEC enters WRITE_CELL", S_WRITE_CELL);
            check_signal("CELL_DEC WRITE: tape_wdata", tape_wdata, 8'd17);  // 20-3=17
            check_signal("CELL_DEC result: PC", pc_out, 3'h1);  // 0+1=1
            
            $display("  -> Manual check: Verify decrement arithmetic\n");
        end
    endtask

    // Test: OUTPUT instruction (opcode 100)
    task test_output;
        begin
            $display("TEST: OUTPUT (Send cell to UART)");
            $display("---------------------------------");
            
            reset_to_known_state(3'd2);  // DP=2
            prog_rdata = 8'b100_00000;  // OUTPUT
            tape_rdata = 8'h41;  // 'A'
            uart_tx_busy = 1'b0;  // UART ready
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("OUTPUT enters FETCH", S_FETCH);
            wait_cycles(2);  // FETCH -> WAIT_FETCH -> DECODE
            wait_cycles(1);  // DECODE -> READ_CELL
            check_state("OUTPUT enters READ_CELL", S_READ_CELL);
            wait_cycles(2);  // READ_CELL -> WAIT_CELL -> EXECUTE
            check_state("OUTPUT enters EXECUTE", S_EXECUTE);
            wait_cycles(1);  // EXECUTE -> FETCH (no UART wait since busy=0)
            check_state("OUTPUT returns to FETCH", S_FETCH);
            check_signal("OUTPUT: uart_tx_byte", uart_tx_byte, 8'h41);
            check_signal("OUTPUT result: PC", pc_out, 3'h1);  // 0+1=1
            
            $display("  -> Manual check: Verify uart_tx_start pulsed high for one cycle\n");
        end
    endtask

    // Test: INPUT instruction (opcode 101)
    task test_input;
        begin
            $display("TEST: INPUT (Receive from UART to cell)");
            $display("----------------------------------------");
            
            reset_to_known_state(3'd4); // DP=4
            prog_rdata = 8'b101_00000;  // INPUT
            tape_rdata = 8'h00;  // Will be read but not used (input overwrites)
            uart_rx_byte = 8'h42;  // 'B' waiting
            uart_rx_valid = 1'b1;  // Data available
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("INPUT enters FETCH", S_FETCH);
            wait_cycles(1);  // FETCH -> WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH -> DECODE
            check_state("INPUT enters DECODE", S_DECODE);
            wait_cycles(1);  // DECODE -> EXECUTE (INPUT does NOT read cell)
            check_state("INPUT enters EXECUTE", S_EXECUTE);
            wait_cycles(1);  // EXECUTE -> WRITE_CELL (uart_rx_valid=1, so immediate write)
            check_state("INPUT enters WRITE_CELL", S_WRITE_CELL);
            check_signal("INPUT WRITE: tape_wen", tape_wen, 1'b1);
            check_signal("INPUT WRITE: tape_wdata", tape_wdata, 8'h42);
            check_signal("INPUT WRITE: tape_addr_w", tape_addr_w, 3'd4);
            
            uart_rx_valid = 1'b0;  // Clear valid signal
            
            $display("  -> Verify INPUT follows state sequence: FETCH->WAIT_FETCH->DECODE->EXECUTE->WRITE_CELL\n");
        end
    endtask

    // Test: JZ instruction - jump taken (opcode 110)
    task test_jz_taken;
        begin
            $display("TEST: JZ - Jump Zero (taken)");
            $display("-----------------------------");
            
            reset_to_known_state(3'd0);  // DP=0
            prog_rdata = 8'b110_00101;  // JZ, offset=+5
            tape_rdata = 8'd0;  // Cell is zero -> jump taken
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("JZ enters FETCH", S_FETCH);
            wait_cycles(2);  // FETCH -> WAIT_FETCH -> DECODE
            wait_cycles(1);  // DECODE -> READ_CELL
            check_state("JZ enters READ_CELL", S_READ_CELL);
            wait_cycles(2);  // READ_CELL -> WAIT_CELL -> EXECUTE
            check_state("JZ enters EXECUTE", S_EXECUTE);
            wait_cycles(1);  // EXECUTE -> FETCH
            check_state("JZ returns to FETCH", S_FETCH);
            check_signal("JZ taken: PC", pc_out, 3'h5);  // PC=0, offset=+5 -> 0+5=5
            
            $display("  -> Manual check: Verify PC = old_PC + offset when cell=0 (PC-relative)\n");
        end
    endtask

    // Test: JZ instruction - not taken (opcode 110)
    task test_jz_not_taken;
        begin
            $display("TEST: JZ - Jump Zero (not taken)");
            $display("---------------------------------");
            
            reset_to_known_state(3'd0);  // DP=0
            prog_rdata = 8'b110_00101;  // JZ, offset=+5
            tape_rdata = 8'd7;  // Cell is non-zero -> jump NOT taken
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("JZ enters FETCH", S_FETCH);
            wait_cycles(6);  // Full sequence to FETCH (FETCH->WAIT_FETCH->DECODE->READ->WAIT->EXEC->FETCH)
            
            check_state("JZ returns to FETCH", S_FETCH);
            check_signal("JZ not taken: PC", pc_out, 3'h1);  // 0+1=1 (normal increment)
            
            $display("  -> Manual check: Verify PC = old_PC + 1 when cell!=0\n");
        end
    endtask

    // Test: JNZ instruction - jump taken (opcode 111)
    task test_jnz_taken;
        begin
            $display("TEST: JNZ - Jump Not Zero (taken)");
            $display("----------------------------------");
            
            reset_to_known_state(3'd0);  // DP=0
            prog_rdata = 8'b111_11110;  // JNZ, offset=-2 (signed 5-bit)
            tape_rdata = 8'd1;  // Cell is non-zero -> jump taken
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("JNZ enters FETCH", S_FETCH);
            wait_cycles(6);  // Full sequence (FETCH->WAIT_FETCH->DECODE->READ->WAIT->EXEC->FETCH)
            
            check_state("JNZ returns to FETCH", S_FETCH);
            check_signal("JNZ taken: PC", pc_out, 3'h6);  // PC=0, offset=-2 (11110)=0xE=-2 in 3-bit→0+(sign-ext -2)=0-2=6 (wraps)
            
            $display("  -> Manual check: Verify negative jump offset works correctly (PC-relative)\n");
        end
    endtask

    // Test: JNZ instruction - not taken (opcode 111)
    task test_jnz_not_taken;
        begin
            $display("TEST: JNZ - Jump Not Zero (not taken)");
            $display("--------------------------------------");
            
            reset_to_known_state(3'd0);  // DP=0
            prog_rdata = 8'b111_00011;  // JNZ, offset=+3
            tape_rdata = 8'd0;  // Cell is zero -> jump NOT taken
            
            pulse_start();  // Ends at negedge in S_FETCH
            
            check_state("JNZ enters FETCH", S_FETCH);
            wait_cycles(6);  // Full sequence
            
            check_state("JNZ returns to FETCH", S_FETCH);
            check_signal("JNZ not taken: PC", pc_out, 3'h1);  // 0+1=1
            
            $display("  -> Manual check: Verify JNZ doesn't jump when cell=0\n");
        end
    endtask

    // Test: DP wraparound (3-bit address wraps at 8)
    task test_dp_wraparound;
        begin
            $display("TEST: DP Wraparound");
            $display("-------------------");
            
            // Forward wrap: 7 + 1 = 0
            reset_to_known_state(3'd7);
            prog_rdata = 8'b000_00001;
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            @(posedge clk);  // EXECUTE->FETCH
            @(negedge clk);  // Stable sample
            check_state("DP forward wrap enters FETCH", S_FETCH);
            check_signal("DP forward wrap: 7+1", dp_out, 3'd0);
            
            // Backward wrap: 0 - 1 = 7
            reset_to_known_state(3'd0);
            prog_rdata = 8'b001_00001;
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            @(posedge clk);  // EXECUTE->FETCH
            @(negedge clk);  // Stable sample
            check_state("DP backward wrap enters FETCH", S_FETCH);
            check_signal("DP backward wrap: 0-1", dp_out, 3'd7);
            
            $display("  -> Verify DP wraps correctly at boundaries\n");
        end
    endtask

    // Test: Cell overflow/underflow (8-bit wraps at 256)
    task test_cell_overflow;
        begin
            $display("TEST: Cell Overflow/Underflow");
            $display("------------------------------");
            
            // Overflow: 255 + 1 = 0
            reset_to_known_state(3'h0);
            prog_rdata = 8'b010_00001;  // CELL_INC, arg=1
            tape_rdata = 8'hFF;  // 255
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(7);  // FETCH->WAIT_FETCH->DEC->READ->WAIT_CELL->EXEC->WRITE->FETCH
            check_state("Cell Overflow enters FETCH", S_FETCH);
            // tape_wdata still holds the written value
            check_signal("Cell overflow: 255+1", tape_wdata, 8'h00);
            
            // Underflow: 0 - 1 = 255
            reset_to_known_state(3'h0);
            prog_rdata = 8'b011_00001;  // CELL_DEC, arg=1
            tape_rdata = 8'h00;  // 0
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT_FETCH->DEC->READ->WAIT_CELL->EXEC->WRITE_CELL
            check_state("Cell Underflow enters WRITE_CELL", S_WRITE_CELL);
            check_signal("Cell underflow: 0-1", tape_wdata, 8'hFF);
            
            $display("  -> Manual check: Verify cell values wrap at 8-bit boundaries\n");
        end
    endtask

    //========================================================================
    // MULTI-INSTRUCTION TESTS (Mini Programs)
    // They do work, expect for the cellmanipulation_chain which is incomplete
    // Conclusio: Control unit should work as intended
    //========================================================================

    // Test: Simple 3-instruction sequence: DP_INC, CELL_INC, DP_DEC
    task test_simple_program;
        begin
            $display("TEST: Simple Program (3 instructions)");
            $display("--------------------------------------");
            
            reset_to_known_state(3'd2);
            tape_rdata = 8'd5;
            
            // Instruction 1: DP_INC by 2 (dp: 2->4)
            prog_rdata = 8'b000_00010;
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE (back at FETCH after posedge)
            @(posedge clk);  // Transition EXECUTE->FETCH
            @(negedge clk);  // Sample stable FETCH state
            check_state("Prog[1] FETCH", S_FETCH);
            check_signal("Prog[1] DP=4", dp_out, 3'd4);
            check_signal("Prog[1] PC=1", pc_out, 3'd1);
            
            // Instruction 2: CELL_INC by 3 at dp=4 (cell: 5->8)
            // FSM is in FETCH state, will read prog_rdata next cycle
            prog_rdata = 8'b010_00011;
            // Don't call pulse_start() - let FSM continue!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL
            wait_cycles(1);  // READ_CELL->WAIT_CELL (tape_rdata will be sampled)
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->WRITE_CELL
            check_state("Prog[2] WRITE_CELL", S_WRITE_CELL);
            check_signal("Prog[2] tape_wdata=8", tape_wdata, 8'd8);
            wait_cycles(1);  // WRITE_CELL->FETCH
            check_signal("Prog[2] PC=2", pc_out, 3'd2);

            // Instruction 3: DP_DEC by 1 (dp: 4->3)
            prog_rdata = 8'b001_00001;
            // Don't call pulse_start() - let FSM continue!
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            @(posedge clk);  // Transition EXECUTE->FETCH
            @(negedge clk);  // Sample stable FETCH state
            check_state("Prog[3] FETCH", S_FETCH);
            check_signal("Prog[3] DP=3", dp_out, 3'd3);
            check_signal("Prog[3] PC=3", pc_out, 3'd3);
            
            $display("  -> Verify sequential execution with PC incrementing\n");
        end
    endtask

    // Test: Loop simulation (JNZ backward, cell decrement)
    task test_loop_simulation;
        begin
            $display("TEST: Loop Simulation (JNZ backward)");
            $display("-------------------------------------");
            
            // Simulate: cell[0]=3, decrement at PC=0, loop-back at PC=1
            // PC=0: CELL_DEC (decrement cell)
            // PC=1: JNZ -1 (jump back to PC=0 if cell!=0)
            
            reset_to_known_state(3'd0);
            tape_rdata = 8'd3;
            
            // First iteration: CELL_DEC (3->2) at PC=0
            prog_rdata = 8'b011_00001;  // CELL_DEC by 1
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT_FETCH->DEC->READ->WAIT_CELL->EXEC->WRITE_CELL
            check_signal("Loop iter1: cell=2", tape_wdata, 8'd2);
            wait_cycles(1);  // WRITE_CELL->FETCH
            check_signal("Loop iter1: PC=1", pc_out, 3'd1);
            
            // JNZ at PC=1: jump back to PC=0 (offset=-1)
            tape_rdata = 8'd2;  // Updated cell value for JNZ to read
            prog_rdata = 8'b111_11111;  // JNZ -1 (5-bit signed: 11111=-1, PC=1+(-1)=0)
            // Don't call pulse_start() - FSM is already running!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL
            wait_cycles(1);  // READ_CELL->WAIT_CELL
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->FETCH
            check_signal("Loop iter1 JNZ: PC=0", pc_out, 3'd0);  // PC=1+(-1)=0
            
            // Second iteration: CELL_DEC (2->1) at PC=0
            prog_rdata = 8'b011_00001;
            tape_rdata = 8'd2;  // Set tape_rdata BEFORE FSM reads it
            // FSM is in FETCH, will fetch instruction
            // Don't call pulse_start()!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL (tape_rdata is already set)
            wait_cycles(1);  // READ_CELL->WAIT_CELL (samples tape_rdata)
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->WRITE_CELL
            check_signal("Loop iter2: cell=1", tape_wdata, 8'd1);
            wait_cycles(1);  // WRITE_CELL->FETCH
            
            // JNZ at PC=1: jump back to PC=0
            prog_rdata = 8'b111_11111;  // JNZ -1
            // Don't call pulse_start()!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL
            wait_cycles(1);  // READ_CELL->WAIT_CELL
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->FETCH
            check_signal("Loop iter2 JNZ: PC=0", pc_out, 3'd0);  // PC=1+(-1)=0
            
            // Third iteration: CELL_DEC (1->0)
            prog_rdata = 8'b011_00001;
            tape_rdata = 8'd1;  // Set to value written in iter2 BEFORE FSM reads it
            // Don't call pulse_start()!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL (tape_rdata already set)
            wait_cycles(1);  // READ_CELL->WAIT_CELL (samples tape_rdata)
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->WRITE_CELL
            check_signal("Loop iter3: cell=0", tape_wdata, 8'd0);
            wait_cycles(1);  // WRITE_CELL->FETCH
            
            // JNZ (cell=0, don't jump, exit loop)
            tape_rdata = 8'd0;
            prog_rdata = 8'b111_11111;
            // Don't call pulse_start()!
            wait_cycles(6);  // Full JNZ sequence (ends in FETCH)
            check_signal("Loop exit: PC=2", pc_out, 3'd2);  // Exited loop
            
            $display("  -> Verify backward jump creates loop behavior\n");
        end
    endtask

    // Test: Conditional skip pattern (JZ forward jump)
    task test_conditional_skip;
        begin
            $display("TEST: Conditional Skip Pattern");
            $display("-------------------------------");
            
            reset_to_known_state(3'd0);
            
            // Case 1: Skip instructions when cell=0
            tape_rdata = 8'd0;
            prog_rdata = 8'b110_00011;  // JZ +3 (skip 3 instructions)
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT->DEC->READ->WAIT->EXEC->FETCH
            check_signal("Skip: PC=3", pc_out, 3'd3);  // PC=0, offset=+3 -> 0+3=3
            
            // Case 2: Don't skip when cell!=0
            reset_to_known_state(3'd0);
            tape_rdata = 8'd5;
            prog_rdata = 8'b110_00011;  // JZ +3
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT->DEC->READ->WAIT->EXEC->FETCH
            check_signal("No skip: PC=1", pc_out, 3'd1);  // Just increment
            
            $display("  -> Verify conditional execution flow control\n");
        end
    endtask

    // DOES NOT WORK PROPERLY YET: prog_rdata_i is wrong
    // Test: Chain of cell operations on different cells
    task test_cell_manipulation_chain;
        begin
            $display("TEST: Cell Manipulation Chain");
            $display("------------------------------");
            
            reset_to_known_state(3'd0);
            
            // Instruction sequence:
            // 1. CELL_INC at dp=0
            // 2. DP_INC (move to dp=1)
            // 3. CELL_DEC at dp=1
            // 4. DP_INC (move to dp=2)
            // 5. CELL_INC at dp=2
            
            // 1. CELL_INC at dp=0 (0->10)
            tape_rdata = 8'd0;
            prog_rdata = 8'b010_01010;  // CELL_INC by 10
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT->DEC->READ->WAIT->EXEC->WRITE_CELL
            check_signal("Chain[1]: cell[0]=10", tape_wdata, 8'd10);
            check_signal("Chain[1]: dp=0", dp_out, 3'd0);
            wait_cycles(1);  // WRITE_CELL->FETCH
            
            // 2. DP_INC to 1
            prog_rdata = 8'b000_00001;
            // Don't call pulse_start() - FSM is already running!
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            @(posedge clk);  // EXECUTE->FETCH
            @(negedge clk);  // Stable sample
            check_signal("Chain[2]: dp=1", dp_out, 3'd1);
            
            // 3. CELL_DEC at dp=1 (20->15)
            prog_rdata = 8'b011_00101;  // CELL_DEC by 5
            tape_rdata = 8'd20;  // Set tape_rdata BEFORE FSM reads it
            // Don't call pulse_start()!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL (tape_rdata already set)
            wait_cycles(1);  // READ_CELL->WAIT_CELL (samples tape_rdata)
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->WRITE_CELL
            check_signal("Chain[3]: cell[1]=15", tape_wdata, 8'd15);
            check_signal("Chain[3]: dp=1", dp_out, 3'd1);
            wait_cycles(1);  // WRITE_CELL->FETCH
            
            // 4. DP_INC to 2
            prog_rdata = 8'b000_00001;
            // Don't call pulse_start()!
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            @(posedge clk);  // EXECUTE->FETCH
            @(negedge clk);  // Stable sample
            check_signal("Chain[4]: dp=2", dp_out, 3'd2);
            
            // 5. CELL_INC at dp=2 (7->14)
            prog_rdata = 8'b010_00111;  // CELL_INC by 7
            tape_rdata = 8'd7;  // Set tape_rdata BEFORE FSM reads it
            // Don't call pulse_start()!
            wait_cycles(1);  // FETCH->WAIT_FETCH
            wait_cycles(1);  // WAIT_FETCH->DECODE
            wait_cycles(1);  // DECODE->READ_CELL (tape_rdata already set)
            wait_cycles(1);  // READ_CELL->WAIT_CELL (samples tape_rdata)
            wait_cycles(1);  // WAIT_CELL->EXECUTE
            wait_cycles(1);  // EXECUTE->WRITE_CELL
            check_signal("Chain[5]: cell[2]=14", tape_wdata, 8'd14);
            wait_cycles(1);  // WRITE_CELL->FETCH
            check_signal("Chain[5]: PC=5", pc_out, 3'd5);
            
            $display("  -> Verify operations on multiple cells with DP movement\n");
        end
    endtask

    // Test: UART wait states (TX busy, RX not ready)
    // Tests both single-cycle and multi-cycle waits
    task test_uart_wait_states;
        begin
            $display("TEST: UART Wait States");
            $display("----------------------");
            
            reset_to_known_state(3'd0);
            tape_rdata = 8'hAA;
            
            // Test OUTPUT with UART busy for MULTIPLE cycles
            uart_tx_busy = 1'b1;  // UART busy
            prog_rdata = 8'b100_00000;  // OUTPUT
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(6);  // FETCH->WAIT->DEC->READ->WAIT->EXEC->WAIT_TX
            check_state("OUTPUT waits: WAIT_TX", S_WAIT_TX);
            check_signal("OUTPUT wait: PC=0", pc_out, 3'd0);  // PC should not increment
            check_signal("OUTPUT wait: tx_byte", uart_tx_byte, 8'hAA);  // Byte preserved
            
            // Continue waiting (multi-cycle wait test)
            wait_cycles(3);
            check_state("OUTPUT still waits: WAIT_TX", S_WAIT_TX);
            check_signal("OUTPUT still wait: PC=0", pc_out, 3'd0);
            check_signal("OUTPUT still wait: tx_byte", uart_tx_byte, 8'hAA);
            
            // UART becomes ready
            uart_tx_busy = 1'b0;
            wait_cycles(1);
            check_state("OUTPUT completes: FETCH", S_FETCH);
            check_signal("OUTPUT complete: PC=1", pc_out, 3'd1);
            
            // Test INPUT waiting for data for MULTIPLE cycles
            reset_to_known_state(3'd0);
            uart_rx_valid = 1'b0;  // No data available
            uart_rx_byte = 8'hBB;
            prog_rdata = 8'b101_00000;  // INPUT
            pulse_start();  // Ends at negedge in S_FETCH
            wait_cycles(4);  // FETCH->WAIT_FETCH->DEC->EXEC->WAIT_RX (uart_rx_valid=0)
            check_state("INPUT waits: WAIT_RX", S_WAIT_RX);
            check_signal("INPUT wait: PC=0", pc_out, 3'd0);  // PC should not increment
            
            // Continue waiting (multi-cycle wait test)
            wait_cycles(5);
            check_state("INPUT still waits: WAIT_RX", S_WAIT_RX);
            check_signal("INPUT still wait: PC=0", pc_out, 3'd0);
            
            // Data arrives
            uart_rx_valid = 1'b1;
            wait_cycles(1);  // WAIT_RX->WRITE_CELL
            check_state("INPUT completes: WRITE_CELL", S_WRITE_CELL);
            check_signal("INPUT complete: tape_wdata=0xBB", tape_wdata, 8'hBB);
            wait_cycles(1);  // WRITE_CELL->FETCH
            
            uart_rx_valid = 1'b0;
            uart_tx_busy = 1'b0;  // Reset to default
            
            $display("  -> Verify UART multi-cycle wait state handling\n");
        end
    endtask

    //========================================================================
    // EDGE CASE TESTS
    //========================================================================

    // Test: PC overflow/wraparound (3-bit PC wraps at 8)
    task test_pc_overflow;
        integer i;
        begin
            $display("TEST: PC Overflow");
            $display("-----------------");
            
            reset_to_known_state(3'd0);
            
            // Execute 7 instructions to get PC to 7
            // Use DP_INC with arg=1 (DP will increment, but that's OK for this test)
            prog_rdata = 8'b000_00001;  // DP_INC by 1
            
            // Start execution once
            pulse_start();  // Ends at negedge in S_FETCH
            
            // Execute 7 instructions to advance PC from 0 to 7
            for (i = 0; i < 7; i = i + 1) begin
                // FSM is in FETCH, will execute current instruction
                wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
                @(posedge clk);  // EXECUTE->FETCH (PC increments)
                @(negedge clk);  // Stable at FETCH for next iteration
            end
            
            // Verify we're at PC=7 (DP will be 7 too, but we only care about PC)
            check_signal("PC overflow setup: PC=7", pc_out, 3'd7);
            
            // Execute one more instruction - PC should wrap from 7 to 0
            prog_rdata = 8'b000_00001;  // DP_INC by 1 (DP: 7->0 wraps, PC: 7->0 wraps)
            // Don't call pulse_start() - FSM is already running!
            wait_cycles(3);  // FETCH->WAIT_FETCH->DECODE->EXECUTE
            check_state("PC overflow: EXECUTE", S_EXECUTE);
            @(posedge clk);  // EXECUTE->FETCH (DP and PC update here)
            @(negedge clk);  // Stable sample
            check_signal("PC overflow: DP incremented", dp_out, 3'd0);  // DP wrapped 7+1=0
            check_signal("PC wraps: 7->0", pc_out, 3'd0);  // 7+1=0 (wrap)
            
            $display("  -> Verify PC wraps at 3-bit boundary\n");
        end
    endtask

    //========================================================================
    // HELPER TASKS
    //========================================================================

    // Initialize all testbench signals
    task init_signals;
        begin
            rst_n = 1'b0;
            start_run = 1'b0;
            halt = 1'b0;
            prog_rdata = 8'h00;
            tape_rdata = 8'h00;
            uart_tx_busy = 1'b0;
            uart_rx_byte = 8'h00;
            uart_rx_valid = 1'b0;
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
        end
    endtask

    // Reset and set DP to known value
    task reset_to_known_state;
        input [TAPE_ADDR_W-1:0] dp_val;
        begin
            // Reset
            rst_n = 1'b0;
            wait_posedges(2);  // Wait at posedge, ready to release reset
            rst_n = 1'b1;
            wait_posedges(1);  // Wait at posedge, ready to force dp

            // Manually set data pointer (simulation only!)
            // In real hardware, you'd execute instructions to reach this state
            force dut.dp = dp_val;
            wait_posedges(1);  // Wait at posedge, ready to release dp
            release dut.dp;
        end
    endtask

    // Pulse start_run signal and position at negedge after transition
    task pulse_start;
        begin
            start_run = 1'b1;
            @(posedge clk);  // Posedge: FSM transitions S_IDLE→S_FETCH  
            start_run = 1'b0;
            @(negedge clk);  // Position at negedge for stable sampling (now in S_FETCH)
        end
    endtask

    // Wait N clock cycles, then position at negative edge for stable sampling
    // Rationale: After posedge, flip-flops update. By negedge (half cycle later),
    // all combinational logic has settled and outputs are stable.
    // USE THIS in test cases after pulse_start() for checking state/signals.
    task wait_cycles;
        input integer n;
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                @(posedge clk);
            end
            @(negedge clk);  // Wait for falling edge - all posedge changes are stable
        end
    endtask

    // Wait N clock positive edges (stop AT the edge, ready to drive new inputs)
    // USE THIS in helper functions (reset_to_known_state, pulse_start) that need
    // to change synchronous inputs BEFORE the next clock edge.
    task wait_posedges;
        input integer n;
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                @(posedge clk);
            end
        end
    endtask

    // Check if in expected state
    task check_state;
        input [255:0] test_name;
        input [3:0] expected_state;  // CHANGED: 4-bit for binary encoding
        begin
            test_num = test_num + 1;
            if (dut.state == expected_state) begin
                $display("  [PASS] %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected state %d, got %d", 
                         test_name, expected_state, dut.state);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Check signal value
    task check_signal;
        input [255:0] test_name;
        input [31:0] actual;
        input [31:0] expected;
        begin
            test_num = test_num + 1;
            if (actual === expected) begin
                $display("  [PASS] %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected %h, got %h", 
                         test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Waveform dump
    initial begin
        $dumpfile("results/control_unit_tb.vcd");
        $dumpvars(0, control_unit_tb);
    end

endmodule