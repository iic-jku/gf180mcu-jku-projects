//=============================================================================
// bf_top_tb.v - TinyBF System Integration Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-26
// Version:     7.0
//
// Description:
//   Comprehensive system-level testbench for TinyBF with RAM-based program memory
//   Multiple working test cases combining program upload and execution:
//     1. Simple increment+output test (+5, ., HALT)
//     2. Multi-cell pointer test (>, +3, <, +2, >, ., HALT)
//     3. Simple loop test (+3, [-, .], HALT)
//     4. Default program test (case converter with UART I/O)
//
// Test Coverage:
//   ✅ Program upload via UART programmer
//   ✅ Program execution with verification
//   ✅ Arithmetic operations (+/-)
//   ✅ Pointer movement (</>)
//   ✅ Loop operations ([/])
//   ✅ UART output (.)
//   ✅ UART input (,)
//   ✅ Default program initialization

`timescale 1ns/1ps

module bf_top_tb;

    //========================================================================
    // Parameters
    //========================================================================
    parameter ADDR_W = 5;              // 32 program locations
    parameter TAPE_ADDR_W = 4;         // 16 tape cells
    parameter CLK_FREQ = 25000000;     // 25 MHz
    parameter BAUD_RATE = 115200;      // UART baud rate
    parameter CLK_PERIOD = 40;         // 40ns = 25MHz
    parameter BIT_PERIOD = 208;        // Clocks per UART bit (13*16 = 208)

    //========================================================================
    // DUT Signals
    //========================================================================
    reg                      clk;
    reg                      rst_n;
    reg                      uart_rx;
    wire                     uart_tx;
    reg                      start;
    reg                      halt;
    reg                      prog_mode;     // Programming mode control
    wire [ADDR_W-1:0]        pc;
    wire [TAPE_ADDR_W-1:0]   dp;
    wire [7:0]               cell_data;
    wire                     cpu_busy;
    wire                     prog_busy;     // Programmer busy status

    //========================================================================
    // Test Tracking
    //========================================================================
    integer test_num;
    integer pass_count;
    integer fail_count;
    
    // UART receive buffer
    reg [7:0] rx_buffer[0:15];
    integer rx_count;

    //========================================================================
    // DUT Instantiation
    //========================================================================
    bf_top #(
        .ADDR_W      (ADDR_W),
        .TAPE_ADDR_W (TAPE_ADDR_W),
        .CLK_FREQ    (CLK_FREQ),
        .BAUD_RATE   (BAUD_RATE)
    ) dut (
        .clk_i       (clk),
        .rst_i       (rst_n),
        .uart_rx_i   (uart_rx),
        .uart_tx_o   (uart_tx),
        .start_i     (start),
        .halt_i      (halt),
        .prog_mode_i (prog_mode),
        .pc_o        (pc),
        .dp_o        (dp),
        .cell_data_o (cell_data),
        .cpu_busy_o  (cpu_busy),
        .prog_busy_o (prog_busy)
    );

    //========================================================================
    // Clock Generation
    //========================================================================
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    //========================================================================
    // Main Test Sequence
    //========================================================================
    initial begin
        $dumpfile("results/bf_top_tb.vcd");
        $dumpvars(0, bf_top_tb);
        
        // Simulation timeout watchdog
        #50_000_000;  // 50ms max simulation time
        $display("\n[ERROR] Simulation timeout after 50ms!");
        $display("        CPU may be stuck in infinite loop.\n");
        $finish;
    end
    
    initial begin
        // Initialize
        init_signals();
        
        // Release reset
        #100;
        rst_n = 1'b1;
        #(CLK_PERIOD * 10);

        $display("\n============================================================");
        $display("TinyBF System Integration Test Suite");
        $display("============================================================");
        $display("Multiple upload+execute test cases");
        $display("============================================================\n");

        // Test 1: Simple increment + output
        test_simple_increment();
        
        // Test 2: Multi-cell pointer test
        test_pointer_movement();
        
        // Test 3: Simple loop test
        test_simple_loop();
        
        // Test 4: Default program execution
        test_default_program();
        
        // Summary
        $display("\n============================================================");
        $display("TEST SUMMARY");
        $display("============================================================");
        $display("Total tests: %0d", test_num);
        $display("Passed:      %0d", pass_count);
        $display("Failed:      %0d", fail_count);
        if (fail_count == 0) begin
            $display("\n*** ALL TESTS PASSED ***\n");
        end else begin
            $display("\n*** SOME TESTS FAILED ***\n");
        end
        $display("============================================================\n");

        #100;
        $finish;
    end

    //========================================================================
    // Test 1: Simple Increment + Output
    // Program: +5, ., HALT
    // Expected: cell[0]=5, UART TX outputs 0x05
    //========================================================================
    task test_simple_increment;
        integer timeout;
        reg [7:0] expected_output;
        begin
            test_num = test_num + 1;
            $display("\n[Test %0d] Simple increment + output", test_num);
            $display("=====================================");
            $display("[INFO] Program: +5, ., HALT");
            $display("[INFO] Expected: cell[0]=5, TX outputs 0x05");
            
            // Reset system
            reset_system();
            
            // Enter programming mode
            prog_mode = 1'b1;
            @(posedge clk);
            
            // Upload program
            $display("[INFO] Uploading program...");
            uart_send_byte(8'b010_00101);  // [0] +5 (CELL_INC by 5)
            wait_prog_idle();
            
            uart_send_byte(8'b100_00000);  // [1] . (OUT)
            wait_prog_idle();
            
            uart_send_byte(8'h00);         // [2] HALT
            wait_prog_idle();
            
            $display("[PASS] Program uploaded (3 instructions)");
            
            // Exit programming mode
            prog_mode = 1'b0;
            @(posedge clk);
            #(CLK_PERIOD * 10);
            
            // Start execution
            $display("[INFO] Starting execution...");
            start_run();
            
            // Wait for UART TX to start (output instruction)
            timeout = 0;
            while (!dut.tx_busy && timeout < 10000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            if (timeout >= 10000) begin
                $display("[FAIL] UART TX never started");
                fail_count = fail_count + 1;
                return;
            end
            
            $display("[INFO] UART TX started at cycle %0d", timeout);
            
            // Monitor UART TX output
            expected_output = 8'h05;
            uart_receive_byte();
            
            if (rx_buffer[rx_count-1] === expected_output) begin
                $display("[PASS] UART TX output correct: 0x%02h", rx_buffer[rx_count-1]);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] UART TX output: expected 0x%02h, got 0x%02h", 
                         expected_output, rx_buffer[rx_count-1]);
                fail_count = fail_count + 1;
            end
            
            // Wait for CPU halt
            wait_cpu_halt();
            
            // Verify final state
            check_value("Final cell value", cell_data, 8'h05);
            check_value("Final data pointer", dp, 4'h0);
            
            $display("[INFO] Test 1 complete\n");
        end
    endtask

    //========================================================================
    // Test 2: Multi-cell Pointer Movement
    // Program: >, +3, <, +2, >, ., HALT
    // Expected: cell[0]=2, cell[1]=3, output 0x03
    //========================================================================
    task test_pointer_movement;
        integer timeout;
        begin
            test_num = test_num + 1;
            $display("\n[Test %0d] Multi-cell pointer movement", test_num);
            $display("========================================");
            $display("[INFO] Program: >, +3, <, +2, >, ., HALT");
            $display("[INFO] Expected: cell[0]=2, cell[1]=3, output 0x03");
            
            // Reset system
            reset_system();
            
            // Enter programming mode
            prog_mode = 1'b1;
            @(posedge clk);
            
            // Upload program
            $display("[INFO] Uploading program...");
            uart_send_byte(8'b000_00001);  // [0] >  (DP_INC by 1)
            wait_prog_idle();
            
            uart_send_byte(8'b010_00011);  // [1] +3 (CELL_INC by 3)
            wait_prog_idle();
            
            uart_send_byte(8'b001_00001);  // [2] <  (DP_DEC by 1)
            wait_prog_idle();
            
            uart_send_byte(8'b010_00010);  // [3] +2 (CELL_INC by 2)
            wait_prog_idle();
            
            uart_send_byte(8'b000_00001);  // [4] >  (DP_INC by 1)
            wait_prog_idle();
            
            uart_send_byte(8'b100_00000);  // [5] .  (OUT)
            wait_prog_idle();
            
            uart_send_byte(8'h00);         // [6] HALT
            wait_prog_idle();
            
            $display("[PASS] Program uploaded (7 instructions)");
            
            // Exit programming mode
            prog_mode = 1'b0;
            @(posedge clk);
            #(CLK_PERIOD * 10);
            
            // Start execution
            $display("[INFO] Starting execution...");
            rx_count = 0;  // Reset RX buffer
            start_run();
            
            // Wait for UART TX
            timeout = 0;
            while (!dut.tx_busy && timeout < 10000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            if (timeout >= 10000) begin
                $display("[FAIL] UART TX never started");
                fail_count = fail_count + 1;
                return;
            end
            
            // Receive output
            uart_receive_byte();
            
            if (rx_buffer[rx_count-1] === 8'h03) begin
                $display("[PASS] UART output correct: 0x03");
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] UART output: expected 0x03, got 0x%02h", rx_buffer[rx_count-1]);
                fail_count = fail_count + 1;
            end
            
            // Wait for halt
            wait_cpu_halt();
            
            // Verify final state
            check_value("Final data pointer", dp, 4'h1);
            check_value("Final cell value (cell[1])", cell_data, 8'h03);
            
            $display("[INFO] Test 2 complete\n");
        end
    endtask

    //========================================================================
    // Test 3: Simple Loop
    // Program: +3, [-, .], HALT
    // Expected: outputs 0x02, 0x01, 0x00 (decrements from 3 to 0)
    //========================================================================
    task test_simple_loop;
        integer i;
        integer timeout;
        reg [7:0] expected_values[0:2];
        begin
            test_num = test_num + 1;
            $display("\n[Test %0d] Simple loop test", test_num);
            $display("============================");
            $display("[INFO] Program: +3, [-, .], HALT");
            $display("[INFO] Expected: outputs 0x02, 0x01, 0x00");
            
            expected_values[0] = 8'h02;
            expected_values[1] = 8'h01;
            expected_values[2] = 8'h00;
            
            // Reset system
            reset_system();
            
            // Enter programming mode
            prog_mode = 1'b1;
            @(posedge clk);
            
            // Upload program
            $display("[INFO] Uploading program...");
            uart_send_byte(8'b010_00011);  // [0] +3    (CELL_INC by 3)
            wait_prog_idle();
            
            uart_send_byte(8'b110_00100);  // [1] [ +4  (JZ forward to addr 5)
            wait_prog_idle();
            
            uart_send_byte(8'b011_00001);  // [2] -     (CELL_DEC by 1)
            wait_prog_idle();
            
            uart_send_byte(8'b100_00000);  // [3] .     (OUT)
            wait_prog_idle();
            
            uart_send_byte(8'b111_11101);  // [4] ] -3  (JNZ back to addr 1)
            wait_prog_idle();
            
            uart_send_byte(8'h00);         // [5] HALT
            wait_prog_idle();
            
            $display("[PASS] Program uploaded (6 instructions)");
            
            // Exit programming mode
            prog_mode = 1'b0;
            @(posedge clk);
            #(CLK_PERIOD * 10);
            
            // Start execution
            $display("[INFO] Starting execution...");
            rx_count = 0;  // Reset RX buffer
            start_run();
            
            // Receive 3 outputs
            for (i = 0; i < 3; i = i + 1) begin
                timeout = 0;
                while (!dut.tx_busy && timeout < 50000) begin
                    @(posedge clk);
                    timeout = timeout + 1;
                end
                
                if (timeout >= 50000) begin
                    $display("[FAIL] UART TX timeout for output %0d", i);
                    fail_count = fail_count + 1;
                    return;
                end
                
                uart_receive_byte();
                $display("[INFO] Received byte %0d: 0x%02h", i, rx_buffer[rx_count-1]);
            end
            
            // Verify all outputs
            if (rx_buffer[0] === expected_values[0] && 
                rx_buffer[1] === expected_values[1] && 
                rx_buffer[2] === expected_values[2]) begin
                $display("[PASS] Loop outputs correct: 0x02, 0x01, 0x00");
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Loop outputs incorrect");
                $display("       Expected: 0x02, 0x01, 0x00");
                $display("       Got:      0x%02h, 0x%02h, 0x%02h", 
                         rx_buffer[0], rx_buffer[1], rx_buffer[2]);
                fail_count = fail_count + 1;
            end
            
            // Wait for halt
            wait_cpu_halt();
            
            check_value("Final cell value", cell_data, 8'h00);
            
            $display("[INFO] Test 3 complete\n");
        end
    endtask

    //========================================================================
    // Test 4: Default Program Execution (Case Converter)
    //========================================================================
    task test_default_program;
        integer timeout;
        begin
            test_num = test_num + 1;
            $display("\n[Test %0d] Default program (case converter)", test_num);
            $display("============================================");
            $display("[INFO] Tests default RAM initialization");
            $display("[INFO] Program converts lowercase to uppercase");
            
            // Reset to reload default program
            reset_system();
            
            // Verify we're in execute mode (not programming)
            prog_mode = 1'b0;
            @(posedge clk);
            #(CLK_PERIOD * 10);
            
            $display("[INFO] Starting execution of default program...");
            rx_count = 0;
            start_run();
            
            // Wait for first ',' instruction (UART input)
            $display("[INFO] Waiting for CPU to reach first input...");
            timeout = 0;
            while (timeout < 5000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            // Send lowercase 'a' (0x61)
            $display("[INFO] Sending 'a' (0x61) via UART...");
            uart_send_byte(8'h61);
            
            // Wait for UART TX output
            $display("[INFO] Waiting for output...");
            timeout = 0;
            while (!dut.tx_busy && timeout < 50000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            if (timeout >= 50000) begin
                $display("[FAIL] No UART TX output detected");
                fail_count = fail_count + 1;
                return;
            end
            
            // Receive converted character
            uart_receive_byte();
            
            if (rx_buffer[0] === 8'h41) begin  // 'A'
                $display("[PASS] Case conversion correct: 'a' → 'A' (0x61 → 0x41)");
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Case conversion: expected 0x41, got 0x%02h", rx_buffer[0]);
                fail_count = fail_count + 1;
            end
            
            // Send null terminator
            $display("[INFO] Sending null terminator...");
            #(CLK_PERIOD * 1000);
            uart_send_byte(8'h00);
            
            // Wait for newline output
            timeout = 0;
            while (!dut.tx_busy && timeout < 50000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            uart_receive_byte();
            
            if (rx_buffer[1] === 8'h0A) begin  // newline
                $display("[PASS] Newline output correct: 0x0A");
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Newline: expected 0x0A, got 0x%02h", rx_buffer[1]);
                fail_count = fail_count + 1;
            end
            
            // Wait for halt
            wait_cpu_halt();
            
            $display("[INFO] Test 4 complete\n");
        end
    endtask

    //========================================================================
    // Helper Tasks
    //========================================================================

    // Initialize all signals
    task init_signals;
        begin
            rst_n = 1'b0;
            uart_rx = 1'b1;  // UART idle high
            start = 1'b0;
            halt = 1'b0;
            prog_mode = 1'b0;  // Execute mode (not programming)
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
            rx_count = 0;
        end
    endtask

    // Reset system (resets CPU and reloads default program)
    task reset_system;
        begin
            rst_n = 1'b0;
            #(CLK_PERIOD * 5);
            rst_n = 1'b1;
            #(CLK_PERIOD * 10);
        end
    endtask

    // Start program execution
    task start_run;
        begin
            @(posedge clk);
            start = 1'b1;
            @(posedge clk);
            start = 1'b0;
        end
    endtask

    // Wait for programmer to return to IDLE
    task wait_prog_idle;
        integer timeout;
        begin
            timeout = 0;
            while (prog_busy && timeout < 5000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            if (timeout >= 5000) begin
                $display("[WARN] Programmer timeout!");
            end
            #(CLK_PERIOD * 5);  // Extra settling time
        end
    endtask

    // Wait for CPU to halt (cpu_busy goes low)
    task wait_cpu_halt;
        integer timeout;
        begin
            timeout = 0;
            while (cpu_busy && timeout < 100000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            if (timeout >= 100000) begin
                $display("[WARN] CPU halt timeout!");
            end else begin
                $display("[INFO] CPU halted after %0d cycles", timeout);
            end
            #(CLK_PERIOD * 10);
        end
    endtask

    // Receive one byte via UART (monitor TX line)
    task uart_receive_byte;
        integer i;
        reg [7:0] data;
        integer timeout;
        begin
            // Wait for start bit with timeout
            timeout = 0;
            while (uart_tx == 1'b1 && timeout < 1000000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            
            if (timeout >= 1000000) begin
                $display("[WARN] UART RX timeout - no start bit detected");
                return;
            end
            
            $display("[INFO] UART start bit detected at time %0t", $time);
            
            // Move to middle of start bit
            #(BIT_PERIOD * CLK_PERIOD / 2);
            
            // Sample 8 data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                // Move to middle of next data bit
                #(BIT_PERIOD * CLK_PERIOD);
                data[i] = uart_tx;
            end
            
            // Store received byte
            rx_buffer[rx_count] = data;
            rx_count = rx_count + 1;
            
            $display("[INFO] UART byte received: 0x%02h at time %0t", data, $time);
            
            // Wait through stop bit
            #(BIT_PERIOD * CLK_PERIOD);
        end
    endtask

    // Send one byte via UART (drive RX line)
    task uart_send_byte;
        input [7:0] data;
        integer i;
        begin
            $display("[INFO] Sending UART byte 0x%02h at time %0t", data, $time);
            
            // Start bit (drive low)
            uart_rx = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                uart_rx = data[i];
                #(BIT_PERIOD * CLK_PERIOD);
            end
            
            // Stop bit (drive high)
            uart_rx = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD);
            
            $display("[INFO] UART byte sent at time %0t", $time);
        end
    endtask

    // Check a value against expected
    task check_value;
        input [255:0] test_name;
        input [31:0] actual;
        input [31:0] expected;
        begin
            test_num = test_num + 1;
            if (actual === expected) begin
                $display("  [PASS] %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected 0x%h, got 0x%h", 
                         test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

endmodule
