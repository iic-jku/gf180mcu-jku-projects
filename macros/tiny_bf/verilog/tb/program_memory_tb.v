//=============================================================================
// program_memory_ram_tb.v - TinyBF Program Memory RAM Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-25
// Version:     3.0
//
// Description:
//   Comprehensive testbench for RAM-based program memory
//   Tests: Write/read operations, timing, reset behavior, write-first semantics
//
// Test Cases:
//   1. Reset behavior - verify default program loaded on reset
//   2. Write operation - write custom instructions and read back
//   3. Read enable control - verify ren_i gates reads
//   4. Write-first semantics - simultaneous write/read returns new data
//   5. Read latency - confirm 1-cycle delay from ren_i to valid data
//   6. Retained output - verify rdata_o holds value when ren_i=0
//   7. Sequential write/read - write all addresses, then read all back
//   8. Random access - verify any address can be written/read in any order
//   9. Write enable control - verify wen_i gates writes
//   10. Default program verification - check initialized ROM content
//
//=============================================================================

`timescale 1ns/1ps

module program_memory_ram_tb;

    //========================================================================
    // Parameters
    //========================================================================
    parameter DATA_W = 8;
    parameter DEPTH = 32;
    parameter ADDR_W = $clog2(DEPTH);
    parameter CLK_PERIOD = 40;  // 40ns = 25MHz

    //========================================================================
    // DUT Signals
    //========================================================================
    reg                  clk;
    reg                  rst_n;
    reg                  ren;
    reg  [ADDR_W-1:0]    raddr;
    wire [DATA_W-1:0]    rdata;
    reg                  wen;
    reg  [ADDR_W-1:0]    waddr;
    reg  [DATA_W-1:0]    wdata;

    //========================================================================
    // Test Tracking
    //========================================================================
    integer test_num;
    integer pass_count;
    integer fail_count;
    integer i;

    //========================================================================
    // Expected Default Program Contents
    //========================================================================
    // Default program from program_memory.v (case converter)
    reg [DATA_W-1:0] expected_default [0:15];
    
    initial begin
        expected_default[0]  = 8'b101_00000;  // ,        Read character from UART
        expected_default[1]  = 8'b000_00001;  // >        Move to cell[1]
        expected_default[2]  = 8'b010_01010;  // +10      cell[1] = 10 (newline)
        expected_default[3]  = 8'b001_00001;  // <        Move back to cell[0]
        expected_default[4]  = 8'b110_00110;  // [ +6     JZ forward 6
        expected_default[5]  = 8'b011_01111;  // -15      Subtract 15
        expected_default[6]  = 8'b011_01111;  // -15      Subtract 15
        expected_default[7]  = 8'b011_00010;  // -2       Subtract 2
        expected_default[8]  = 8'b100_00000;  // .        Output converted character
        expected_default[9]  = 8'b101_00000;  // ,        Read next character
        expected_default[10] = 8'b111_11010;  // ] -6     JNZ back -6
        expected_default[11] = 8'b000_00001;  // >        Move to cell[1]
        expected_default[12] = 8'b100_00000;  // .        Output newline
        expected_default[13] = 8'h00;         // HALT
        expected_default[14] = 8'h00;         // HALT
        expected_default[15] = 8'h00;         // HALT
    end

    //========================================================================
    // DUT Instantiation
    //========================================================================
    program_memory #(
        .DATA_W (DATA_W),
        .DEPTH  (DEPTH)
    ) dut (
        .clk_i   (clk),
        .rst_i   (rst_n),
        .ren_i   (ren),
        .raddr_i (raddr),
        .rdata_o (rdata),
        .wen_i   (wen),
        .waddr_i (waddr),
        .wdata_i (wdata)
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
            ren = 0;
            wen = 0;
            raddr = 0;
            waddr = 0;
            wdata = 0;
            repeat(3) @(posedge clk);
            rst_n = 1;
            @(posedge clk);
            $display("[%0t] Reset released", $time);
        end
    endtask

    // Task: Write to memory
    task write_mem;
        input [ADDR_W-1:0] addr;
        input [DATA_W-1:0] data;
        begin
            @(posedge clk);
            wen = 1;
            waddr = addr;
            wdata = data;
            @(posedge clk);
            wen = 0;
        end
    endtask

    // Task: Read from memory
    task read_mem;
        input [ADDR_W-1:0] addr;
        output [DATA_W-1:0] data;
        begin
            @(posedge clk);
            ren = 1;
            raddr = addr;
            @(posedge clk);  // Wait 1 cycle for read latency
            ren = 0;
            data = rdata;
        end
    endtask

    // Task: Check result
    task check_result;
        input [DATA_W-1:0] expected;
        input [DATA_W-1:0] actual;
        input [255:0] test_name;
        begin
            if (actual === expected) begin
                $display("  [PASS] %s: Got 0x%02h", test_name, actual);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s: Expected 0x%02h, got 0x%02h", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Helper task for dynamic test names (works around $sformatf limitations)
    task check_result_fmt;
        input [DATA_W-1:0] expected;
        input [DATA_W-1:0] actual;
        input integer addr_num;
        input [255:0] prefix;
        reg [255:0] full_name;
        begin
            $sformat(full_name, "%s[%0d]", prefix, addr_num);
            check_result(expected, actual, full_name);
        end
    endtask

    //========================================================================
    // Main Test Sequence
    //========================================================================
    reg [DATA_W-1:0] read_value;
    
    initial begin
        // Initialize
        test_num = 0;
        pass_count = 0;
        fail_count = 0;
        
        $display("========================================");
        $display("Program Memory RAM Testbench");
        $display("========================================");
        
        // Initial reset
        apply_reset();
        
        //====================================================================
        // Test 1: Reset Behavior - Verify Default Program Loaded
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Reset behavior - default program loaded", test_num);
        
        for (i = 0; i < 16; i = i + 1) begin
            read_mem(i, read_value);
            check_result_fmt(expected_default[i], read_value, i, "Default addr");
        end
        
        //====================================================================
        // Test 2: Write Operation - Write Custom Instructions
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Write operation - custom program", test_num);
        
        // Write a simple test program
        write_mem(0, 8'b010_00101);  // +5
        write_mem(1, 8'b000_00001);  // >
        write_mem(2, 8'b010_00011);  // +3
        write_mem(3, 8'b100_00000);  // .
        
        // Read back and verify
        read_mem(0, read_value);
        check_result(8'b010_00101, read_value, "Written addr[0]");
        
        read_mem(1, read_value);
        check_result(8'b000_00001, read_value, "Written addr[1]");
        
        read_mem(2, read_value);
        check_result(8'b010_00011, read_value, "Written addr[2]");
        
        read_mem(3, read_value);
        check_result(8'b100_00000, read_value, "Written addr[3]");
        
        //====================================================================
        // Test 3: Read Enable Control
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Read enable control", test_num);
        
        // Set address but don't enable read
        @(posedge clk);
        ren = 0;
        raddr = 0;
        @(posedge clk);
        @(posedge clk);
        // rdata should retain previous value
        check_result(8'b100_00000, rdata, "Read disabled (retained)");
        
        // Now enable read
        @(posedge clk);
        ren = 1;
        raddr = 0;
        @(posedge clk);
        ren = 0;
        check_result(8'b010_00101, rdata, "Read enabled");
        
        //====================================================================
        // Test 4: Write-First Semantics
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Write-first semantics", test_num);
        
        // Simultaneous write and read to same address
        @(posedge clk);
        wen = 1;
        ren = 1;
        waddr = 5;
        raddr = 5;
        wdata = 8'hAA;
        @(posedge clk);
        wen = 0;
        ren = 0;
        // Should get the newly written value
        check_result(8'hAA, rdata, "Write-first same addr");
        
        //====================================================================
        // Test 5: Read Latency - 1 Cycle Delay
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Read latency verification", test_num);
        
        write_mem(10, 8'hBB);
        
        // Test that data is available within 1 cycle after ren assertion
        @(posedge clk);
        ren = 1;
        raddr = 10;
        
        // After clock edge, data must be valid (within 1-cycle latency spec)
        @(posedge clk);
        ren = 0;
        check_result(8'hBB, rdata, "Read latency: Data valid within 1 cycle");
        
        //====================================================================
        // Test 6: Retained Output
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Retained output when ren=0", test_num);
        
        read_mem(10, read_value);  // Read 0xBB
        
        // Change address but don't enable read
        @(posedge clk);
        ren = 0;
        raddr = 0;
        @(posedge clk);
        @(posedge clk);
        // Should still have 0xBB
        check_result(8'hBB, rdata, "Output retained");
        
        //====================================================================
        // Test 7: Sequential Write/Read All Addresses
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Sequential write/read all addresses", test_num);
        
        // Write unique pattern to all addresses
        for (i = 0; i < DEPTH; i = i + 1) begin
            write_mem(i, 8'h10 + i);
        end
        
        // Read back all addresses
        for (i = 0; i < DEPTH; i = i + 1) begin
            read_mem(i, read_value);
            check_result_fmt(8'h10 + i, read_value, i, "Sequential addr");
        end
        
        //====================================================================
        // Test 8: Random Access
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Random access write/read", test_num);
        
        write_mem(7, 8'hC7);
        write_mem(3, 8'hC3);
        write_mem(12, 8'hCC);
        write_mem(0, 8'hC0);
        
        read_mem(12, read_value);
        check_result(8'hCC, read_value, "Random addr[12]");
        
        read_mem(3, read_value);
        check_result(8'hC3, read_value, "Random addr[3]");
        
        read_mem(7, read_value);
        check_result(8'hC7, read_value, "Random addr[7]");
        
        read_mem(0, read_value);
        check_result(8'hC0, read_value, "Random addr[0]");
        
        //====================================================================
        // Test 9: Write Enable Control
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Write enable control", test_num);
        
        // Set address and data but don't enable write
        @(posedge clk);
        wen = 0;
        waddr = 8;
        wdata = 8'hFF;
        @(posedge clk);
        
        // Read back - should have old value (0x18 from test 7)
        read_mem(8, read_value);
        check_result(8'h18, read_value, "Write disabled");
        
        // Now enable write
        write_mem(8, 8'hFF);
        read_mem(8, read_value);
        check_result(8'hFF, read_value, "Write enabled");
        
        //====================================================================
        // Test 10: Reset Restores Default Program
        //====================================================================
        test_num = test_num + 1;
        $display("\n[Test %0d] Reset restores default program", test_num);
        
        apply_reset();
        
        // Verify first few addresses have default program
        read_mem(0, read_value);
        check_result(expected_default[0], read_value, "Reset addr[0]");
        
        read_mem(4, read_value);
        check_result(expected_default[4], read_value, "Reset addr[4]");
        
        read_mem(15, read_value);
        check_result(expected_default[15], read_value, "Reset addr[15]");
        
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
        #(CLK_PERIOD * 10000);  // 200us timeout
        $display("\n[ERROR] Testbench timeout!");
        $finish;
    end

    //========================================================================
    // Waveform Dump
    //========================================================================
    initial begin
        $dumpfile("results/program_memory_ram_tb.vcd");
        $dumpvars(0, program_memory_ram_tb);
    end

endmodule
