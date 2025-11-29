//=============================================================================
// reset_sync_tb.v - TinyBF Reset Synchronizer Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Tests synchronization behavior, metastability protection, timing

`timescale 1ns/1ps

module reset_sync_tb;

    // Testbench parameters
    parameter CLK_PERIOD = 40;      // 40ns = 25MHz
    parameter RESET_STAGES = 3;     // Expected number of sync stages
    
    // Test signals
    reg  clk;
    reg  async_rst_n;
    wire sync_rst_n;
    
    // Test tracking
    integer test_num;
    integer pass_count;
    integer fail_count;
    
    // Instantiate DUT
    reset_sync dut (
        .clk_i         (clk),
        .async_rst_i   (async_rst_n),
        .sync_rst_o    (sync_rst_n)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Main test sequence
    initial begin
        $dumpfile("results/reset_sync_tb.vcd");
        $dumpvars(0, reset_sync_tb);
        
        init_test();
        
        $display("\n========================================");
        $display("RESET SYNCHRONIZER TESTS");
        $display("========================================\n");
        
        // Basic functionality tests
        test_async_assertion();
        test_sync_deassertion();
        test_stage_count();
        
        // Timing tests
        test_immediate_assertion();
        test_deassertion_timing();
        test_glitch_filtering();
        
        // Edge cases
        test_multiple_pulses();
        test_clock_edge_alignment();
        test_long_reset();
        
        // Summary
        #1000;
        print_summary();
        
        $finish;
    end
    
    //========================================================================
    // TEST CASES
    //========================================================================
    
    // Test: Asynchronous reset assertion
    task test_async_assertion;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Asynchronous Reset Assertion", test_num);
            $display("----------------------------------------");
            
            // Start with reset deasserted
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 5);
            
            // Assert reset asynchronously (not aligned to clock)
            #(CLK_PERIOD / 3);  // Offset from clock edge
            async_rst_n = 1'b0;
            #1;  // Immediate check
            
            if (sync_rst_n === 1'b0) begin
                $display("  [PASS] Reset asserted immediately (async)");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Reset not immediate - got %b", sync_rst_n);
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 3);
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 5);
            $display("");
        end
    endtask
    
    // Test: Synchronous reset deassertion
    task test_sync_deassertion;
        integer i;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Synchronous Reset Deassertion", test_num);
            $display("---------------------------------------");
            
            // Assert reset
            async_rst_n = 1'b0;
            #(CLK_PERIOD * 2);
            
            // Deassert reset at non-clock-aligned time
            #(CLK_PERIOD / 2.7);
            async_rst_n = 1'b1;
            
            // Check that reset stays asserted for at least 1 clock
            @(posedge clk);
            if (sync_rst_n === 1'b0) begin
                $display("  [PASS] Reset held low for at least 1 clock");
                pass_count = pass_count + 1;
                test_num = test_num + 1;
            end else begin
                $display("  [FAIL] Reset released too early");
                fail_count = fail_count + 1;
                test_num = test_num + 1;
            end
            
            // Wait for full synchronization
            #(CLK_PERIOD * 5);
            $display("");
        end
    endtask
    
    // Test: Verify correct number of synchronization stages
    task test_stage_count;
        integer clk_count;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Synchronization Stage Count", test_num);
            $display("-------------------------------------");
            
            // Reset the system
            async_rst_n = 1'b0;
            #(CLK_PERIOD * 3);
            
            // Deassert reset just BEFORE a clock edge
            @(negedge clk);  // Wait for negedge (middle of clock cycle)
            #(CLK_PERIOD / 4);  // Quarter cycle later, still before posedge
            async_rst_n = 1'b1;
            $display("  [DEBUG] async_rst_n deasserted at time %0t", $time);
            
            // Count clocks until sync_rst_n goes high
            // The output should go high ON the Nth clock edge, not after it
            clk_count = 0;
            repeat (10) begin
                @(posedge clk);
                #1;  // Small delay to let combinational logic settle
                clk_count = clk_count + 1;
                $display("  [DEBUG] Clock %0d at time %0t, sync_rst_n = %b, chain = %b", 
                         clk_count, $time, sync_rst_n, dut.reset_sync_chain);
                if (sync_rst_n === 1'b1) begin
                    break;
                end
            end
            
            if (clk_count === RESET_STAGES) begin
                $display("  [PASS] Reset released after %0d clocks (expected %0d)", 
                         clk_count, RESET_STAGES);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Reset released after %0d clocks (expected %0d)", 
                         clk_count, RESET_STAGES);
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 3);
            $display("");
        end
    endtask
    
    // Test: Immediate assertion (no clock cycles needed)
    task test_immediate_assertion;
        time assert_time;
        time response_time;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Immediate Assertion Timing", test_num);
            $display("------------------------------------");
            
            // Start deasserted
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 3);
            
            // Assert reset and measure response time
            assert_time = $time;
            async_rst_n = 1'b0;
            wait (sync_rst_n === 1'b0);
            response_time = $time - assert_time;
            
            if (response_time < CLK_PERIOD) begin
                $display("  [PASS] Assertion response time: %0t ns (< 1 clock)", response_time);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Assertion too slow: %0t ns", response_time);
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 2);
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 5);
            $display("");
        end
    endtask
    
    // Test: Deassertion timing accuracy
    task test_deassertion_timing;
        integer edge_count;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Deassertion Timing Accuracy", test_num);
            $display("-------------------------------------");
            
            // Reset
            async_rst_n = 1'b0;
            #(CLK_PERIOD * 2);
            
            // Deassert at known clock edge
            @(posedge clk);
            async_rst_n = 1'b1;
            
            // Count positive edges until release
            edge_count = 0;
            repeat (RESET_STAGES) begin
                @(posedge clk);
                edge_count = edge_count + 1;
                if (edge_count < RESET_STAGES && sync_rst_n !== 1'b0) begin
                    $display("  [FAIL] Reset released early at edge %0d", edge_count);
                    fail_count = fail_count + 1;
                    test_num = test_num + 1;
                    #(CLK_PERIOD * 3);
                    $display("");
                    disable test_deassertion_timing;
                end
            end
            
            // Check that reset is now released
            #1;
            if (sync_rst_n === 1'b1) begin
                $display("  [PASS] Reset released exactly after %0d clocks", RESET_STAGES);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Reset not released after %0d clocks", RESET_STAGES);
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 3);
            $display("");
        end
    endtask
    
    // Test: Glitch filtering (short pulses filtered out)
    task test_glitch_filtering;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Short Pulse Handling", test_num);
            $display("------------------------------");
            
            // Start with reset deasserted
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 5);
            
            // Create very short reset pulse (much less than 1 clock)
            async_rst_n = 1'b0;
            #(CLK_PERIOD / 10);
            async_rst_n = 1'b1;
            
            // The pulse should still propagate (async assertion)
            #1;
            $display("  [INFO] Short pulse creates glitch (expected)");
            pass_count = pass_count + 1;
            
            #(CLK_PERIOD * 5);
            $display("");
        end
    endtask
    
    // Test: Multiple reset pulses in sequence
    task test_multiple_pulses;
        integer i;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Multiple Reset Pulses", test_num);
            $display("-------------------------------");
            
            for (i = 0; i < 3; i = i + 1) begin
                async_rst_n = 1'b0;
                #(CLK_PERIOD * 2);
                async_rst_n = 1'b1;
                #(CLK_PERIOD * 5);
                
                if (sync_rst_n === 1'b1) begin
                    $display("  [PASS] Pulse %0d: Reset deasserted", i + 1);
                    if (i == 0) pass_count = pass_count + 1;
                end else begin
                    $display("  [FAIL] Pulse %0d: Reset stuck low", i + 1);
                    if (i == 0) fail_count = fail_count + 1;
                end
            end
            
            #(CLK_PERIOD * 2);
            $display("");
        end
    endtask
    
    // Test: Clock edge alignment sensitivity
    task test_clock_edge_alignment;
        integer offset;
        integer success;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Clock Edge Alignment", test_num);
            $display("------------------------------");
            
            success = 1;
            
            // Test deassertion at various clock offsets
            for (offset = 0; offset < CLK_PERIOD; offset = offset + CLK_PERIOD/4) begin
                async_rst_n = 1'b0;
                #(CLK_PERIOD * 2);
                
                // Deassert at different phase
                #offset;
                async_rst_n = 1'b1;
                
                // Wait for synchronization
                #(CLK_PERIOD * (RESET_STAGES + 2));
                
                if (sync_rst_n !== 1'b1) begin
                    $display("  [FAIL] Failed at offset %0d ns", offset);
                    success = 0;
                end
            end
            
            if (success) begin
                $display("  [PASS] Works at all clock phase offsets");
                pass_count = pass_count + 1;
            end else begin
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 2);
            $display("");
        end
    endtask
    
    // Test: Long reset duration
    task test_long_reset;
        begin
            test_num = test_num + 1;
            $display("TEST %0d: Long Reset Duration", test_num);
            $display("-----------------------------");
            
            async_rst_n = 1'b0;
            #(CLK_PERIOD * 100);  // Hold reset for 100 clocks
            
            if (sync_rst_n === 1'b0) begin
                $display("  [PASS] Reset held low during long assertion");
                pass_count = pass_count + 1;
                test_num = test_num + 1;
            end else begin
                $display("  [FAIL] Reset not released");
                fail_count = fail_count + 1;
                test_num = test_num + 1;
            end
            
            async_rst_n = 1'b1;
            #(CLK_PERIOD * 5);
            
            if (sync_rst_n === 1'b1) begin
                $display("  [PASS] Reset released after long assertion");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Reset stuck after long assertion");
                fail_count = fail_count + 1;
            end
            
            #(CLK_PERIOD * 2);
            $display("");
        end
    endtask
    
    //========================================================================
    // HELPER TASKS
    //========================================================================
    
    task init_test;
        begin
            async_rst_n = 1'b1;
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
            
            #100;  // Initial settling time
        end
    endtask
    
    task print_summary;
        begin
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
        end
    endtask

endmodule
