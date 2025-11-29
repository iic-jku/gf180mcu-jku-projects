//=============================================================================
// programmer_tb.v - TinyBF Programmer Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-25
// Version:     1.0
//
// Description:
//   Comprehensive testbench for UART-based programmer module
//   Tests: Protocol timing, address incrementing, mode control, edge cases
//
// Test Cases:
//   1. Reset behavior - verify initial state
//   2. Single instruction upload - write one instruction
//   3. Multiple sequential uploads - write several instructions
//   4. Address auto-increment - verify address increments after each write
//   5. Programming mode control - enable/disable programming
//   6. Mode change resets address - verify address resets when prog_mode=0
//   7. Busy signal timing - verify prog_busy_o timing
//   8. Full program upload - upload complete 16-instruction program
//   9. Boundary conditions - test maximum address
//   10. Timing verification - verify write timing matches memory requirements
//
//=============================================================================

`timescale 1ns/1ps

module programmer_tb;

    //========================================================================
    // Parameters
    //========================================================================
    parameter INSTR_W = 8;
    parameter ADDR_W = 5;
    parameter CLK_PERIOD = 40;  // 40ns = 25MHz

    //========================================================================
    // DUT Signals
    //========================================================================
    reg                  clk;
    reg                  rst_n;
    reg                  prog_mode;
    reg  [INSTR_W-1:0]   uart_data;
    reg                  uart_valid;
    wire                 prog_wen;
    wire [ADDR_W-1:0]    prog_waddr;
    wire [INSTR_W-1:0]   prog_wdata;
    wire                 prog_busy;

    //========================================================================
    // Test Tracking
    //========================================================================
    integer test_num;
    integer pass_count;
    integer fail_count;
    integer i;

    //========================================================================
    // DUT Instantiation
    //========================================================================
    programmer #(
        .INSTR_W (INSTR_W),
        .ADDR_W  (ADDR_W)
    ) dut (
        .clk_i         (clk),
        .rst_i         (rst_n),
        .prog_mode_i   (prog_mode),
        .uart_data_i   (uart_data),
        .uart_valid_i  (uart_valid),
        .prog_wen_o    (prog_wen),
        .prog_waddr_o  (prog_waddr),
        .prog_wdata_o  (prog_wdata),
        .prog_busy_o   (prog_busy)
    );

    //========================================================================
    // Clock Generation
    //========================================================================
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    //========================================================================
    // Test Helper Tasks
    //========================================================================
    
    // Task: Apply reset
    task apply_reset;
        begin
            $display("[%0t] Applying reset...", $time);
            rst_n = 0;
            prog_mode = 0;
            uart_data = 0;
            uart_valid = 0;
            repeat(3) @(posedge clk);
            rst_n = 1;
            @(posedge clk);
            $display("[%0t] Reset released", $time);
        end
    endtask

    // Task: Send UART byte
    task send_uart_byte;
        input [INSTR_W-1:0] data;
        begin
            @(posedge clk);
            uart_data = data;
            uart_valid = 1;
            @(posedge clk);
            uart_valid = 0;
            // Wait for programmer to complete (3 cycles: WRITE + WAIT + back to IDLE)
            @(posedge clk);  // WRITE state
            @(posedge clk);  // WAIT state (addr increment assigned)
            @(posedge clk);  // IDLE state (addr register updated)
        end
    endtask

    // Task: Check result
    task check_value;
        input [ADDR_W-1:0] expected_addr;
        input [INSTR_W-1:0] expected_data;
        input              expected_wen;
        input [255:0]      test_name;
        begin
            if (prog_waddr === expected_addr && prog_wdata === expected_data && prog_wen === expected_wen) begin
                $display("  [PASS] %s: addr=0x%02h data=0x%02h wen=%b", 
                         test_name, prog_waddr, prog_wdata, prog_wen);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s: Expected addr=0x%02h data=0x%02h wen=%b, got addr=0x%02h data=0x%02h wen=%b", 
                         test_name, expected_addr, expected_data, expected_wen,
                         prog_waddr, prog_wdata, prog_wen);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Helper task for dynamic test names (works around $sformatf limitations)
    task check_value_fmt;
        input [ADDR_W-1:0] expected_addr;
        input [INSTR_W-1:0] expected_data;
        input              expected_wen;
        input integer      num_value;
        input [255:0]      prefix;
        reg [255:0] full_name;
        begin
            $sformat(full_name, "%s%0d writes", prefix, num_value);
            check_value(expected_addr, expected_data, expected_wen, full_name);
        end
    endtask

    //========================================================================
    // Main Test Sequence
    //========================================================================
    
    initial begin
        // Initialize
        test_num = 0;
        pass_count = 0;
        fail_count = 0;
        
        $display("========================================");
        $display("Programmer Testbench");
        $display("========================================");
        
        // Initial reset
        apply_reset();
        
        //====================================================================
        // Test 1: Reset Behavior - Verify Initial State
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Reset behavior - initial state", test_num);
        
        check_value(0, 0, 0, "After reset");
        
        if (prog_busy === 0) begin
            $display("  [PASS] prog_busy=0 after reset");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] prog_busy should be 0 after reset");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 2: Single Instruction Upload
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Single instruction upload", test_num);
        
        prog_mode = 1;
        @(posedge clk);
        
        // Send one instruction
        uart_data = 8'hAB;
        uart_valid = 1;
        @(posedge clk);
        uart_valid = 0;
        
        // Check WRITE state
        @(posedge clk);
        check_value(0, 8'hAB, 1, "Write state");
        
        if (prog_busy === 1) begin
            $display("  [PASS] prog_busy=1 during write");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] prog_busy should be 1 during write");
            fail_count = fail_count + 1;
        end
        
        // Check WAIT state (wen should be deasserted)
        @(posedge clk);
        check_value(0, 8'hAB, 0, "Wait state");
        
        // Check IDLE state (address should increment)
        @(posedge clk);
        check_value(1, 8'hAB, 0, "After write (addr incremented)");
        
        if (prog_busy === 0) begin
            $display("  [PASS] prog_busy=0 after write complete");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] prog_busy should be 0 after write complete");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 3: Multiple Sequential Uploads
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Multiple sequential uploads", test_num);
        
        send_uart_byte(8'hCD);
        check_value(2, 8'hCD, 0, "After 2nd write");
        
        send_uart_byte(8'hEF);
        check_value(3, 8'hEF, 0, "After 3rd write");
        
        send_uart_byte(8'h12);
        check_value(4, 8'h12, 0, "After 4th write");
        
        //====================================================================
        // Test 4: Address Auto-Increment
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Address auto-increment verification", test_num);
        
        for (i = 0; i < 8; i = i + 1) begin
            send_uart_byte(8'h10 + i);
        end
        
        // Address should now be 12 (4 from test 3 + 8 from this test)
        check_value_fmt(12, 8'h17, 0, 12, "After ");
        
        //====================================================================
        // Test 5: Programming Mode Control - Disable
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Programming mode control - disable", test_num);
        
        prog_mode = 0;
        @(posedge clk);
        
        // Send data but it should be ignored
        uart_data = 8'hFF;
        uart_valid = 1;
        @(posedge clk);
        uart_valid = 0;
        @(posedge clk);
        @(posedge clk);
        
        // Write enable should never assert
        if (prog_wen === 0) begin
            $display("  [PASS] Write disabled when prog_mode=0");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Write should be disabled when prog_mode=0");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 6: Mode Change Resets Address
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Mode change resets address", test_num);
        
        // Address should have been reset to 0 when prog_mode went low
        // Wait for address reset to take effect
        @(posedge clk);
        
        if (prog_waddr === 0) begin
            $display("  [PASS] Address reset to 0 when prog_mode=0");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Address should reset to 0 when prog_mode=0, got 0x%02h", prog_waddr);
            fail_count = fail_count + 1;
        end
        
        // Re-enable programming
        prog_mode = 1;
        @(posedge clk);
        
        send_uart_byte(8'h00);  // Should write to address 0
        
        if (prog_waddr === 1) begin
            $display("  [PASS] First write after re-enable starts at addr 0");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] First write should be at addr 0 after mode change");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 7: Busy Signal Timing
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Busy signal timing verification", test_num);
        
        // Start idle
        if (prog_busy === 0) begin
            $display("  [PASS] Busy=0 in IDLE");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Busy should be 0 in IDLE");
            fail_count = fail_count + 1;
        end
        
        // Trigger write
        uart_data = 8'h55;
        uart_valid = 1;
        @(posedge clk);
        uart_valid = 0;
        
        // Should be busy in WRITE state
        @(posedge clk);
        if (prog_busy === 1) begin
            $display("  [PASS] Busy=1 in WRITE state");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Busy should be 1 in WRITE state");
            fail_count = fail_count + 1;
        end
        
        // Should still be busy in WAIT state
        @(posedge clk);
        if (prog_busy === 1) begin
            $display("  [PASS] Busy=1 in WAIT state");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Busy should be 1 in WAIT state");
            fail_count = fail_count + 1;
        end
        
        // Should return to idle
        @(posedge clk);
        if (prog_busy === 0) begin
            $display("  [PASS] Busy=0 after returning to IDLE");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Busy should be 0 after returning to IDLE");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 8: Full Program Upload
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Full program upload (16 instructions)", test_num);
        
        // Reset and start fresh
        apply_reset();
        prog_mode = 1;
        @(posedge clk);
        
        // Upload case converter program
        send_uart_byte(8'b101_00000);  // ,
        send_uart_byte(8'b000_00001);  // >
        send_uart_byte(8'b010_01010);  // +10
        send_uart_byte(8'b001_00001);  // <
        send_uart_byte(8'b110_00110);  // [
        send_uart_byte(8'b011_01111);  // -15
        send_uart_byte(8'b011_01111);  // -15
        send_uart_byte(8'b011_00010);  // -2
        send_uart_byte(8'b100_00000);  // .
        send_uart_byte(8'b101_00000);  // ,
        send_uart_byte(8'b111_11010);  // ]
        send_uart_byte(8'b000_00001);  // >
        send_uart_byte(8'b100_00000);  // .
        send_uart_byte(8'h00);         // HALT
        send_uart_byte(8'h00);         // HALT
        send_uart_byte(8'h00);         // HALT
        
        // Verify final address
        if (prog_waddr === 16) begin
            $display("  [PASS] Full program uploaded, addr=16");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Expected addr=16 after 16 writes, got 0x%02h", prog_waddr);
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 9: Boundary Conditions - Maximum Address
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Boundary conditions - max address", test_num);
        
        // Upload to near maximum address (31 = 0x1F for 5-bit address)
        apply_reset();
        prog_mode = 1;
        @(posedge clk);
        
        for (i = 0; i < 31; i = i + 1) begin
            send_uart_byte(8'hAA);
        end
        
        // Verify address is 31
        if (prog_waddr === 31) begin
            $display("  [PASS] Address reached maximum (31)");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Expected addr=31, got 0x%02h", prog_waddr);
            fail_count = fail_count + 1;
        end
        
        // One more write should wrap to 0 (5-bit address)
        send_uart_byte(8'hBB);
        
        if (prog_waddr === 0) begin
            $display("  [PASS] Address wrapped to 0 after max");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Expected addr=0 after wrap, got 0x%02h", prog_waddr);
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test 10: Timing Verification - Write Pulse Width
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Timing verification - write pulse width", test_num);
        
        apply_reset();
        prog_mode = 1;
        @(posedge clk);
        
        // Trigger write and measure wen pulse width
        uart_data = 8'hCC;
        uart_valid = 1;
        @(posedge clk);
        uart_valid = 0;
        
        // Wait for WRITE state
        @(posedge clk);
        
        // wen should be high for exactly 1 cycle
        if (prog_wen === 1) begin
            $display("  [PASS] wen asserted in cycle 1");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] wen should be asserted in cycle 1");
            fail_count = fail_count + 1;
        end
        
        @(posedge clk);
        if (prog_wen === 0) begin
            $display("  [PASS] wen deasserted in cycle 2 (1-cycle pulse)");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] wen should be deasserted after 1 cycle");
            fail_count = fail_count + 1;
        end
        
        //====================================================================
        // Test Summary
        //====================================================================
        $display("\n========================================");
        $display("Test Summary");
        $display("========================================");
        $display("Total Tests: %0d", pass_count + fail_count);
        $display("Passed:      %0d", pass_count);
        $display("Failed:      %0d", fail_count);
        
        if (fail_count == 0) begin
            $display("\n*** ALL TESTS PASSED ***");
        end else begin
            $display("\n*** SOME TESTS FAILED ***");
        end
        
        $display("========================================");
        $finish;
    end

    //========================================================================
    // Timeout Watchdog
    //========================================================================
    initial begin
        #(CLK_PERIOD * 50000);  // 1ms timeout
        $display("\n[ERROR] Testbench timeout!");
        $finish;
    end

    //========================================================================
    // Waveform Dump
    //========================================================================
    initial begin
        $dumpfile("results/programmer_tb.vcd");
        $dumpvars(0, programmer_tb);
    end

endmodule
