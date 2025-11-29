//=============================================================================
// tape_memory_tb.v - TinyBF Tape Memory Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Tests synchronous read/write, write-first semantics, dual-port operation

`timescale 1ns/1ps

module tape_memory_tb;

    // Parameters matching DUT
    parameter CELL_W = 8;
    parameter DEPTH = 8;
    parameter ADDR_W = $clog2(DEPTH);
    parameter CLK_PERIOD = 40;

    // DUT signals
    reg                 clk;
    reg                 rst_n;
    reg                 ren;
    reg  [ADDR_W-1:0]   raddr;
    wire [CELL_W-1:0]   rdata;
    reg                 wen;
    reg  [ADDR_W-1:0]   waddr;
    reg  [CELL_W-1:0]   wdata;

    // Test tracking
    integer test_num;
    integer pass_count;
    integer fail_count;

    // Instantiate DUT
    tape_memory #(
        .CELL_W(CELL_W),
        .DEPTH(DEPTH)
    ) dut (
        .clk_i(clk),
        .rst_i(rst_n),
        .ren_i(ren),
        .raddr_i(raddr),
        .rdata_o(rdata),
        .wen_i(wen),
        .waddr_i(waddr),
        .wdata_i(wdata)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Main test sequence
    initial begin
        init_signals();
        
        #100;
        rst_n = 1'b1;
        #100;

        $display("\n========================================");
        $display("TAPE MEMORY TESTS");
        $display("========================================\n");

        // Basic functionality tests
        test_single_write_read();
        test_multiple_cells();
        test_read_all_cells();
        test_write_all_cells();
        
        // Timing and control tests
        test_read_latency();
        test_write_latency();
        test_ren_deasserted();
        test_data_retention();
        
        // Write-first semantics tests
        test_write_first_same_address();
        test_write_first_different_address();
        test_simultaneous_write_read_sequence();
        
        // Dual-port operation tests
        test_dual_port_independent();
        test_dual_port_read_while_write();
        test_dual_port_interleaved();
        
        // Brainfuck CPU usage patterns
        test_increment_sequence();
        test_decrement_sequence();
        test_pointer_movement_pattern();
        test_cell_modification_chain();
        
        // Edge case tests
        test_address_boundaries();
        test_data_patterns();
        test_rapid_address_changes();
        test_wraparound_behavior();
        
        // Reset behavior
        test_reset_during_operation();
        
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
    // TEST CASES - BASIC FUNCTIONALITY
    //========================================================================

    // Test: Single write followed by read
    task test_single_write_read;
        begin
            $display("TEST: Single Write and Read");
            $display("----------------------------");
            
            reset_memory();
            
            // Write 0x42 to cell 3
            write_cell(3'd3, 8'h42);
            wait_cycles(1);
            
            // Read from cell 3
            read_cell(3'd3);
            wait_cycles(1);
            check_rdata("Single W/R: read back 0x42", 8'h42);
            
            $display("  -> Verify basic write and read functionality\n");
        end
    endtask

    // Test: Multiple cells with different values
    task test_multiple_cells;
        begin
            $display("TEST: Multiple Cell Operations");
            $display("-------------------------------");
            
            reset_memory();
            
            // Write different values to different cells
            write_cell(3'd0, 8'h10);
            wait_cycles(1);
            write_cell(3'd1, 8'h20);
            wait_cycles(1);
            write_cell(3'd2, 8'h30);
            wait_cycles(1);
            write_cell(3'd3, 8'h40);
            wait_cycles(1);
            
            // Read back and verify
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Multi-cell: cell 0", 8'h10);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Multi-cell: cell 1", 8'h20);
            
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("Multi-cell: cell 2", 8'h30);
            
            read_cell(3'd3);
            wait_cycles(1);
            check_rdata("Multi-cell: cell 3", 8'h40);
            
            $display("  -> Verify multiple independent cells\n");
        end
    endtask

    // Test: Read from all tape cells
    task test_read_all_cells;
        integer addr;
        reg [CELL_W-1:0] expected_data;
        begin
            $display("TEST: Read All Cells");
            $display("--------------------");
            
            reset_memory();
            
            // Write unique pattern to each cell
            for (addr = 0; addr < DEPTH; addr = addr + 1) begin
                write_cell(addr[ADDR_W-1:0], addr[CELL_W-1:0]);
                wait_cycles(1);
            end
            
            // Read back all cells
            for (addr = 0; addr < DEPTH; addr = addr + 1) begin
                expected_data = addr[CELL_W-1:0];
                read_cell(addr[ADDR_W-1:0]);
                wait_cycles(1);
                check_rdata("Read all cells", expected_data);
            end
            
            $display("  -> Verify all %0d cells accessible\n", DEPTH);
        end
    endtask

    // Test: Write to all tape cells with pattern
    task test_write_all_cells;
        integer addr;
        reg [CELL_W-1:0] expected;
        begin
            $display("TEST: Write All Cells");
            $display("---------------------");
            
            reset_memory();
            
            // Write inverted address pattern
            for (addr = 0; addr < DEPTH; addr = addr + 1) begin
                write_cell(addr[ADDR_W-1:0], ~addr[CELL_W-1:0]);
                wait_cycles(1);
            end
            
            // Verify all writes
            for (addr = 0; addr < DEPTH; addr = addr + 1) begin
                expected = ~addr[CELL_W-1:0];
                read_cell(addr[ADDR_W-1:0]);
                wait_cycles(1);
                check_rdata("Write all cells", expected);
            end
            
            $display("  -> Verify all cells writable\n");
        end
    endtask

    //========================================================================
    // TEST CASES - TIMING AND CONTROL
    //========================================================================

    // Test: Read latency (1 cycle)
    task test_read_latency;
        begin
            $display("TEST: Read Latency");
            $display("------------------");
            
            reset_memory();
            
            // Write a value
            write_cell(3'd5, 8'hAB);
            wait_cycles(1);
            
            // Start read - data won't be available until next cycle
            read_cell(3'd5);
            @(posedge clk);
            @(negedge clk);
            
            // Data available after 1 cycle
            check_rdata("Read latency: 1 cycle", 8'hAB);
            
            $display("  -> Verify 1-cycle read latency\n");
        end
    endtask

    // Test: Write latency and read-after-write
    task test_write_latency;
        begin
            $display("TEST: Write Latency");
            $display("-------------------");
            
            reset_memory();
            
            // Write value and wait for completion
            write_cell(3'd4, 8'h77);
            wait_cycles(1);
            
            // Read the written value
            read_cell(3'd4);
            wait_cycles(1);
            check_rdata("Write latency: read after write", 8'h77);
            
            // Test write-to-read dependency
            write_cell(3'd4, 8'h88);
            wait_cycles(1);  // Wait for write to complete
            read_cell(3'd4);
            wait_cycles(1);
            check_rdata("Write latency: sequential W->R", 8'h88);
            
            $display("  -> Verify write completes in 1 cycle\n");
        end
    endtask

    // Test: ren deasserted - rdata should retain value
    task test_ren_deasserted;
        begin
            $display("TEST: Read Enable Deasserted");
            $display("-----------------------------");
            
            reset_memory();
            
            // Write and read a value
            write_cell(3'd2, 8'hCC);
            wait_cycles(1);
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("ren deassert: initial read", 8'hCC);
            
            // Deassert ren - rdata holds value
            ren = 1'b0;
            wait_cycles(1);
            check_rdata("ren deassert: after 1 cycle", 8'hCC);
            
            wait_cycles(2);
            check_rdata("ren deassert: after 3 cycles", 8'hCC);
            
            $display("  -> Verify rdata retention when ren=0\n");
        end
    endtask

    // Test: Data retention across clock cycles
    task test_data_retention;
        begin
            $display("TEST: Data Retention");
            $display("--------------------");
            
            reset_memory();
            
            // Write pattern
            write_cell(3'd7, 8'hEE);
            wait_cycles(1);
            
            // Wait several cycles without any operations
            wen = 1'b0;
            ren = 1'b0;
            wait_cycles(5);
            
            // Read back - should still be there
            read_cell(3'd7);
            wait_cycles(1);
            check_rdata("Data retention: after idle", 8'hEE);
            
            $display("  -> Verify data persists without activity\n");
        end
    endtask

    //========================================================================
    // TEST CASES - WRITE-FIRST SEMANTICS
    //========================================================================

    // Test: Write-first semantics - same address
    task test_write_first_same_address;
        begin
            $display("TEST: Write-First Same Address");
            $display("-------------------------------");
            
            reset_memory();
            
            // Pre-write old value
            write_cell(3'd1, 8'h11);
            wait_cycles(1);
            
            // Simultaneous write and read to same address
            wen = 1'b1;
            waddr = 3'd1;
            wdata = 8'h99;
            ren = 1'b1;
            raddr = 3'd1;
            wait_cycles(1);
            
            // Write-first semantics: should get NEW value (0x99)
            check_rdata("Write-first same addr: new value", 8'h99);
            
            wen = 1'b0;
            ren = 1'b0;
            
            $display("  -> Verify write-first returns new value\n");
        end
    endtask

    // Test: Write-first semantics - different addresses
    task test_write_first_different_address;
        begin
            $display("TEST: Write-First Different Address");
            $display("------------------------------------");
            
            reset_memory();
            
            // Pre-write values
            write_cell(3'd2, 8'hAA);
            wait_cycles(1);
            write_cell(3'd3, 8'hBB);
            wait_cycles(1);
            
            // Simultaneous write to addr 2, read from addr 3
            wen = 1'b1;
            waddr = 3'd2;
            wdata = 8'h55;
            ren = 1'b1;
            raddr = 3'd3;
            wait_cycles(1);
            
            // Should get value from addr 3 (0xBB), not affected by write to addr 2
            check_rdata("Write-first diff addr: unaffected", 8'hBB);
            
            wen = 1'b0;
            ren = 1'b0;
            
            $display("  -> Verify write doesn't affect different read address\n");
        end
    endtask

    // Test: Sequence of simultaneous write/read operations
    task test_simultaneous_write_read_sequence;
        begin
            $display("TEST: Simultaneous Write/Read Sequence");
            $display("---------------------------------------");
            
            reset_memory();
            
            // Cycle 1: Write 0x10 to cell 0, read from cell 0
            wen = 1'b1;
            waddr = 3'd0;
            wdata = 8'h10;
            ren = 1'b1;
            raddr = 3'd0;
            wait_cycles(1);
            check_rdata("Simul seq 1: write-first", 8'h10);
            
            // Cycle 2: Write 0x20 to cell 1, read from cell 0
            waddr = 3'd1;
            wdata = 8'h20;
            raddr = 3'd0;
            wait_cycles(1);
            check_rdata("Simul seq 2: read prev write", 8'h10);
            
            // Cycle 3: Write 0x30 to cell 1, read from cell 1
            waddr = 3'd1;
            wdata = 8'h30;
            raddr = 3'd1;
            wait_cycles(1);
            check_rdata("Simul seq 3: overwrite+read", 8'h30);
            
            wen = 1'b0;
            ren = 1'b0;
            
            $display("  -> Verify complex write/read sequences\n");
        end
    endtask

    //========================================================================
    // TEST CASES - DUAL-PORT OPERATION
    //========================================================================

    // Test: Independent dual-port access
    task test_dual_port_independent;
        begin
            $display("TEST: Dual-Port Independent Access");
            $display("-----------------------------------");
            
            reset_memory();
            
            // Pre-populate cells
            write_cell(3'd0, 8'h11);
            wait_cycles(1);
            write_cell(3'd1, 8'h22);
            wait_cycles(1);
            
            // Simultaneous read from addr 0, write to addr 1
            ren = 1'b1;
            raddr = 3'd0;
            wen = 1'b1;
            waddr = 3'd1;
            wdata = 8'h33;
            wait_cycles(1);
            
            // Should read addr 0 (unaffected by write to addr 1)
            check_rdata("Dual-port: independent R/W", 8'h11);
            
            // Verify write to addr 1 succeeded
            ren = 1'b1;
            raddr = 3'd1;
            wen = 1'b0;
            wait_cycles(1);
            check_rdata("Dual-port: verify write", 8'h33);
            
            ren = 1'b0;
            
            $display("  -> Verify independent read/write ports\n");
        end
    endtask

    // Test: Read while writing to different location
    task test_dual_port_read_while_write;
        begin
            $display("TEST: Read While Writing");
            $display("------------------------");
            
            reset_memory();
            
            // Setup initial values
            write_cell(3'd5, 8'h55);
            wait_cycles(1);
            write_cell(3'd6, 8'h66);
            wait_cycles(1);
            
            // Read cell 5 while writing to cell 6
            ren = 1'b1;
            raddr = 3'd5;
            wen = 1'b1;
            waddr = 3'd6;
            wdata = 8'h77;
            wait_cycles(1);
            check_rdata("R while W: read unaffected", 8'h55);
            
            // Verify write succeeded
            read_cell(3'd6);
            wait_cycles(1);
            check_rdata("R while W: write succeeded", 8'h77);
            
            $display("  -> Verify concurrent different-address access\n");
        end
    endtask

    // Test: Interleaved read/write operations
    task test_dual_port_interleaved;
        begin
            $display("TEST: Interleaved Operations");
            $display("-----------------------------");
            
            reset_memory();
            
            // Cycle 1: Write cell 0 and wait for completion
            write_cell(3'd0, 8'hA0);
            wait_cycles(1);
            
            // Cycle 2: Write cell 1, read cell 0 (pipelined)
            wen = 1'b1;
            waddr = 3'd1;
            wdata = 8'hA1;
            ren = 1'b1;
            raddr = 3'd0;
            @(posedge clk);
            @(negedge clk);
            check_rdata("Interleaved: R cell 0", 8'hA0);
            
            // Cycle 3: Write cell 2, read cell 1 (pipelined)
            waddr = 3'd2;
            wdata = 8'hA2;
            raddr = 3'd1;
            @(posedge clk);
            @(negedge clk);
            check_rdata("Interleaved: R cell 1", 8'hA1);
            
            wen = 1'b0;
            ren = 1'b0;
            
            $display("  -> Verify pipelined R/W operations\n");
        end
    endtask

    //========================================================================
    // TEST CASES - BRAINFUCK CPU PATTERNS
    //========================================================================

    // Test: Increment sequence (simulates '+' operations)
    task test_increment_sequence;
        begin
            $display("TEST: Increment Sequence (Brainfuck +)");
            $display("---------------------------------------");
            
            reset_memory();
            
            // Initialize cell to 0
            write_cell(3'd0, 8'h00);
            wait_cycles(1);
            
            // Simulate increment operations: read, increment, write
            read_cell(3'd0);
            wait_cycles(1);
            write_cell(3'd0, rdata + 1);
            wait_cycles(1);
            
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Increment seq: after 1st inc", 8'h01);
            
            write_cell(3'd0, rdata + 1);
            wait_cycles(1);
            
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Increment seq: after 2nd inc", 8'h02);
            
            write_cell(3'd0, rdata + 1);
            wait_cycles(1);
            
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Increment seq: after 3rd inc", 8'h03);
            
            $display("  -> Verify read-modify-write pattern\n");
        end
    endtask

    // Test: Decrement sequence (simulates '-' operations)
    task test_decrement_sequence;
        begin
            $display("TEST: Decrement Sequence (Brainfuck -)");
            $display("---------------------------------------");
            
            reset_memory();
            
            // Initialize cell to 5
            write_cell(3'd1, 8'h05);
            wait_cycles(1);
            
            // Simulate decrement operations
            read_cell(3'd1);
            wait_cycles(1);
            write_cell(3'd1, rdata - 1);
            wait_cycles(1);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Decrement seq: after 1st dec", 8'h04);
            
            write_cell(3'd1, rdata - 1);
            wait_cycles(1);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Decrement seq: after 2nd dec", 8'h03);
            
            $display("  -> Verify decrement pattern\n");
        end
    endtask

    // Test: Pointer movement pattern (simulates '>' and '<')
    task test_pointer_movement_pattern;
        begin
            $display("TEST: Pointer Movement Pattern (Brainfuck > <)");
            $display("-----------------------------------------------");
            
            reset_memory();
            
            // Write to multiple cells
            write_cell(3'd0, 8'hC0);
            wait_cycles(1);
            write_cell(3'd1, 8'hC1);
            wait_cycles(1);
            write_cell(3'd2, 8'hC2);
            wait_cycles(1);
            
            // Simulate moving pointer right and reading
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Pointer move: cell 0", 8'hC0);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Pointer move: cell 1", 8'hC1);
            
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("Pointer move: cell 2", 8'hC2);
            
            // Move back left
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Pointer move: back to cell 1", 8'hC1);
            
            $display("  -> Verify sequential cell access\n");
        end
    endtask

    // Test: Cell modification chain
    task test_cell_modification_chain;
        begin
            $display("TEST: Cell Modification Chain");
            $display("------------------------------");
            
            reset_memory();
            
            // Simulate complex Brainfuck program pattern
            // Initialize cell 0 to 10
            write_cell(3'd0, 8'd10);
            wait_cycles(1);
            
            // Read cell 0, write modified value to cell 1
            read_cell(3'd0);
            wait_cycles(1);
            write_cell(3'd1, rdata + 8'd5);
            wait_cycles(1);
            
            // Read cell 1, write to cell 2
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Mod chain: cell 1 value", 8'd15);
            write_cell(3'd2, rdata * 2);
            wait_cycles(1);
            
            // Verify cell 2
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("Mod chain: cell 2 value", 8'd30);
            
            $display("  -> Verify data propagation across cells\n");
        end
    endtask

    //========================================================================
    // TEST CASES - EDGE CASES
    //========================================================================

    // Test: Address boundary conditions
    task test_address_boundaries;
        begin
            $display("TEST: Address Boundaries");
            $display("------------------------");
            
            reset_memory();
            
            // Test cell 0 (minimum)
            write_cell(3'd0, 8'hF0);
            wait_cycles(1);
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Boundary: cell 0", 8'hF0);
            
            // Test cell DEPTH-1 (maximum)
            write_cell(DEPTH-1, 8'hFF);
            wait_cycles(1);
            read_cell(DEPTH-1);
            wait_cycles(1);
            check_rdata("Boundary: cell max", 8'hFF);
            
            $display("  -> Verify min and max cell access\n");
        end
    endtask

    // Test: Various data patterns
    task test_data_patterns;
        begin
            $display("TEST: Data Patterns");
            $display("-------------------");
            
            reset_memory();
            
            // All zeros
            write_cell(3'd0, 8'h00);
            wait_cycles(1);
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Pattern: all zeros", 8'h00);
            
            // All ones
            write_cell(3'd1, 8'hFF);
            wait_cycles(1);
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Pattern: all ones", 8'hFF);
            
            // Alternating 10101010
            write_cell(3'd2, 8'hAA);
            wait_cycles(1);
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("Pattern: 0xAA", 8'hAA);
            
            // Alternating 01010101
            write_cell(3'd3, 8'h55);
            wait_cycles(1);
            read_cell(3'd3);
            wait_cycles(1);
            check_rdata("Pattern: 0x55", 8'h55);
            
            $display("  -> Verify various bit patterns\n");
        end
    endtask

    // Test: Rapid address changes
    task test_rapid_address_changes;
        begin
            $display("TEST: Rapid Address Changes");
            $display("----------------------------");
            
            reset_memory();
            
            // Pre-populate with known values
            write_cell(3'd0, 8'h00);
            wait_cycles(1);
            write_cell(3'd1, 8'h11);
            wait_cycles(1);
            write_cell(3'd2, 8'h22);
            wait_cycles(1);
            write_cell(3'd3, 8'h33);
            wait_cycles(1);
            
            // Rapid sequential reads
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Rapid: cell 0", 8'h00);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Rapid: cell 1", 8'h11);
            
            read_cell(3'd2);
            wait_cycles(1);
            check_rdata("Rapid: cell 2", 8'h22);
            
            read_cell(3'd3);
            wait_cycles(1);
            check_rdata("Rapid: cell 3", 8'h33);
            
            $display("  -> Verify rapid cell switching\n");
        end
    endtask

    // Test: Wraparound behavior with 8-bit arithmetic
    task test_wraparound_behavior;
        begin
            $display("TEST: Wraparound Behavior");
            $display("-------------------------");
            
            reset_memory();
            
            // Test increment wraparound (255 -> 0)
            write_cell(3'd0, 8'hFF);
            wait_cycles(1);
            read_cell(3'd0);
            wait_cycles(1);
            write_cell(3'd0, rdata + 1);
            wait_cycles(1);
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Wraparound: increment 255->0", 8'h00);
            
            // Test decrement wraparound (0 -> 255)
            write_cell(3'd1, 8'h00);
            wait_cycles(1);
            read_cell(3'd1);
            wait_cycles(1);
            write_cell(3'd1, rdata - 1);
            wait_cycles(1);
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Wraparound: decrement 0->255", 8'hFF);
            
            $display("  -> Verify 8-bit wraparound arithmetic\n");
        end
    endtask

    //========================================================================
    // TEST CASES - RESET
    //========================================================================

    // Test: Reset during operation
    task test_reset_during_operation;
        begin
            $display("TEST: Reset During Operation");
            $display("-----------------------------");
            
            reset_memory();
            
            // Write some values
            write_cell(3'd0, 8'hDD);
            wait_cycles(1);
            write_cell(3'd1, 8'hEE);
            wait_cycles(1);
            
            // Deassert write enable before reset
            wen = 1'b0;
            @(posedge clk);
            
            // Assert reset
            rst_n = 1'b0;
            wait_cycles(2);
            rst_n = 1'b1;
            wait_cycles(1);
            
            // Memory should clear on reset (synchronous reset clears all cells)
            read_cell(3'd0);
            wait_cycles(1);
            check_rdata("Reset: data cleared cell 0", 8'h00);
            
            read_cell(3'd1);
            wait_cycles(1);
            check_rdata("Reset: data cleared cell 1", 8'h00);
            
            $display("  -> Verify reset behavior\n");
        end
    endtask

    //========================================================================
    // HELPER TASKS
    //========================================================================

    // Initialize all signals
    task init_signals;
        begin
            rst_n = 1'b0;
            ren = 1'b0;
            raddr = {ADDR_W{1'b0}};
            wen = 1'b0;
            waddr = {ADDR_W{1'b0}};
            wdata = {CELL_W{1'b0}};
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
        end
    endtask

    // Reset memory (reset signal and clear control signals)
    task reset_memory;
        begin
            rst_n = 1'b0;
            wen = 1'b0;
            ren = 1'b0;
            wait_posedges(2);
            rst_n = 1'b1;
            wait_posedges(1);
        end
    endtask

    // Write to cell (single cycle operation)
    task write_cell;
        input [ADDR_W-1:0] addr;
        input [CELL_W-1:0] data;
        begin
            wen = 1'b1;
            waddr = addr;
            wdata = data;
            ren = 1'b0;  // Don't read during write (unless testing write-first)
        end
    endtask

    // Read from cell (single cycle operation)
    task read_cell;
        input [ADDR_W-1:0] addr;
        begin
            ren = 1'b1;
            raddr = addr;
            wen = 1'b0;  // Don't write during read (unless testing dual-port)
        end
    endtask

    // Wait N clock cycles, then position at negedge for stable sampling
    task wait_cycles;
        input integer n;
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                @(posedge clk);
            end
            @(negedge clk);
        end
    endtask

    // Wait N positive edges (for driving inputs)
    task wait_posedges;
        input integer n;
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                @(posedge clk);
            end
        end
    endtask

    // Check rdata value
    task check_rdata;
        input [255:0] test_name;
        input [CELL_W-1:0] expected;
        begin
            test_num = test_num + 1;
            if (rdata === expected) begin
                $display("  [PASS] %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected %h, got %h", 
                         test_name, expected, rdata);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Waveform dump
    initial begin
        $dumpfile("results/tape_memory_tb.vcd");
        $dumpvars(0, tape_memory_tb);
    end

endmodule
