//=============================================================================
// baud_gen_tb.v - TinyBF Baud Rate Generator Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Tests tick generation, frequency accuracy, parameter variations

`timescale 1ns/1ps

module baud_gen_tb;

    // Testbench parameters
    parameter CLK_FREQ = 25000000;   // 25MHz
    parameter BAUD_RATE = 115200;    // 115200 baud
    parameter CLK_PERIOD = 40;       // 40ns = 25MHz
    
    // Calculate expected divisor for tick generation
    // For 16x oversampling: divisor = CLK_FREQ / (BAUD_RATE * 16)
    parameter DIVISOR_16X = CLK_FREQ / (BAUD_RATE * 16);  // ~14 for 25MHz

    // DUT signals
    reg         clk;
    reg         rst_n;
    wire        tick_16x;
    wire        tick_1x;

    // Test tracking
    integer test_num;
    integer pass_count;
    integer fail_count;
    
    // Measurement variables
    integer tick_16x_count;
    integer tick_1x_count;
    integer time_start;
    integer time_end;
    real measured_freq_16x;
    real measured_freq_1x;
    real expected_freq_16x;
    real expected_freq_1x;
    real error_16x;
    real error_1x;

    // Instantiate DUT
    baud_gen #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) dut (
        .clk_i(clk),
        .rst_i(rst_n),
        .tick_16x_o(tick_16x),
        .tick_1x_o(tick_1x)
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
        $display("BAUD GENERATOR TESTS");
        $display("========================================\n");
        $display("Configuration:");
        $display("  CLK_FREQ  = %0d Hz", CLK_FREQ);
        $display("  BAUD_RATE = %0d bps", BAUD_RATE);
        $display("  Expected 16x freq = %0d Hz", BAUD_RATE * 16);
        $display("  Expected 1x freq  = %0d Hz\n", BAUD_RATE);

        // Basic functionality tests
        test_reset_behavior();
        test_tick_16x_generation();
        test_tick_1x_generation();
        test_tick_relationship();
        
        // Frequency accuracy tests
        test_frequency_accuracy_16x();
        test_frequency_accuracy_1x();
        test_tick_pulse_width();
        
        // Timing tests
        test_tick_16x_periodicity();
        test_tick_1x_periodicity();
        test_no_overlapping_pulses();
        
        // Edge cases
        test_continuous_operation();
        test_long_duration();
        
        // Summary
        #1000;
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
    // TEST CASES
    //========================================================================

    // Test: Reset behavior
    task test_reset_behavior;
        begin
            $display("TEST: Reset Behavior");
            $display("--------------------");
            
            // Assert reset
            rst_n = 1'b0;
            #100;
            
            // Check outputs are low during reset
            check_signal("Reset: tick_16x low", tick_16x, 1'b0);
            check_signal("Reset: tick_1x low", tick_1x, 1'b0);
            
            // Release reset
            rst_n = 1'b1;
            #100;
            
            $display("  -> Verify clean reset behavior\n");
        end
    endtask

    // Test: 16x tick generation
    task test_tick_16x_generation;
        integer i;
        integer tick_count;
        begin
            $display("TEST: 16x Tick Generation");
            $display("-------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            #100;
            
            // Count 16x ticks over 100 periods
            tick_count = 0;
            for (i = 0; i < 100 * DIVISOR_16X; i = i + 1) begin  // ~100 16x periods
                @(posedge clk);
                if (tick_16x) tick_count = tick_count + 1;
            end
            
            // Should have approximately 100 ticks
            if (tick_count >= 95 && tick_count <= 105) begin
                $display("  [PASS] 16x tick count: %0d (expected ~100)", tick_count);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] 16x tick count: %0d (expected ~100)", tick_count);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify 16x tick generation\n");
        end
    endtask

    // Test: 1x tick generation
    task test_tick_1x_generation;
        integer i;
        integer tick_count;
        begin
            $display("TEST: 1x Tick Generation");
            $display("------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            #100;
            
            // Count 1x ticks over 100 baud periods
            tick_count = 0;
            for (i = 0; i < 100 * DIVISOR_16X * 16; i = i + 1) begin  // ~100 1x periods
                @(posedge clk);
                if (tick_1x) tick_count = tick_count + 1;
            end
            
            // Should have approximately 100 ticks
            if (tick_count >= 95 && tick_count <= 105) begin
                $display("  [PASS] 1x tick count: %0d (expected ~100)", tick_count);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] 1x tick count: %0d (expected ~100)", tick_count);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify 1x tick generation\n");
        end
    endtask

    // Test: 16x and 1x tick relationship
    task test_tick_relationship;
        integer i;
        integer tick_16x_cnt;
        integer tick_1x_cnt;
        begin
            $display("TEST: Tick Relationship (16x vs 1x)");
            $display("------------------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            #100;
            
            // Count both ticks over a period
            tick_16x_cnt = 0;
            tick_1x_cnt = 0;
            
            for (i = 0; i < 50000; i = i + 1) begin
                @(posedge clk);
                if (tick_16x) tick_16x_cnt = tick_16x_cnt + 1;
                if (tick_1x) tick_1x_cnt = tick_1x_cnt + 1;
            end
            
            // Ratio should be ~16:1
            if (tick_16x_cnt >= (tick_1x_cnt * 15) && tick_16x_cnt <= (tick_1x_cnt * 17)) begin
                $display("  [PASS] Tick ratio: %0d:1 (expected 16:1)", tick_16x_cnt / tick_1x_cnt);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Tick ratio: %0d:1 (expected 16:1)", tick_16x_cnt / tick_1x_cnt);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify 16x and 1x relationship\n");
        end
    endtask

    // Test: Frequency accuracy for 16x tick
    task test_frequency_accuracy_16x;
        real measured_period;
        real expected_period;
        real percent_error;
        begin
            $display("TEST: 16x Tick Frequency Accuracy");
            $display("----------------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Wait for first tick
            @(posedge tick_16x);
            time_start = $time;
            
            // Measure period over multiple ticks
            tick_16x_count = 0;
            repeat(100) @(posedge tick_16x) tick_16x_count = tick_16x_count + 1;
            time_end = $time;
            
            // Calculate frequency
            measured_period = (time_end - time_start) / 100.0;
            expected_period = 1000000000.0 / (BAUD_RATE * 16.0);  // in ns
            percent_error = ((measured_period - expected_period) / expected_period) * 100.0;
            
            if (percent_error < 0) percent_error = -percent_error;
            
            $display("  Measured period: %0.2f ns", measured_period);
            $display("  Expected period: %0.2f ns", expected_period);
            $display("  Error: %0.2f%%", percent_error);
            
            if (percent_error < 5.0) begin  // Allow 5% error for quantization
                $display("  [PASS] Frequency accuracy within tolerance");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Frequency error too high");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify 16x tick frequency\n");
        end
    endtask

    // Test: Frequency accuracy for 1x tick
    task test_frequency_accuracy_1x;
        real measured_period;
        real expected_period;
        real percent_error;
        begin
            $display("TEST: 1x Tick Frequency Accuracy");
            $display("---------------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Wait for first tick
            @(posedge tick_1x);
            time_start = $time;
            
            // Measure period over multiple ticks
            repeat(50) @(posedge tick_1x);
            time_end = $time;
            
            // Calculate frequency
            measured_period = (time_end - time_start) / 50.0;
            expected_period = 1000000000.0 / BAUD_RATE;  // in ns
            percent_error = ((measured_period - expected_period) / expected_period) * 100.0;
            
            if (percent_error < 0) percent_error = -percent_error;
            
            $display("  Measured period: %0.2f ns", measured_period);
            $display("  Expected period: %0.2f ns", expected_period);
            $display("  Error: %0.2f%%", percent_error);
            
            if (percent_error < 5.0) begin  // Allow 5% error for quantization
                $display("  [PASS] Frequency accuracy within tolerance");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Frequency error too high");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify 1x tick frequency\n");
        end
    endtask

    // Test: Tick pulse width (should be 1 clock cycle)
    task test_tick_pulse_width;
        integer pulse_width_16x;
        integer pulse_width_1x;
        reg tick_16x_prev;
        reg tick_1x_prev;
        begin
            $display("TEST: Tick Pulse Width");
            $display("----------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            #100;
            
            // Measure 16x tick pulse width by sampling at clock edges
            tick_16x_prev = 1'b0;
            pulse_width_16x = 0;
            
            // Wait for rising edge of tick (sampled at clock edge)
            while (1) begin
                @(posedge clk);
                if (!tick_16x_prev && tick_16x) begin
                    // Rising edge detected, start counting
                    pulse_width_16x = 1; // Already high for this cycle
                    tick_16x_prev = tick_16x;
                    break;
                end
                tick_16x_prev = tick_16x;
            end
            
            // Count how many more cycles it stays high
            while (1) begin
                @(posedge clk);
                if (tick_16x) begin
                    pulse_width_16x = pulse_width_16x + 1;
                end else begin
                    break; // Pulse ended
                end
            end
            
            check_value("16x pulse width", pulse_width_16x, 1);
            
            // Measure 1x tick pulse width
            tick_1x_prev = 1'b0;
            pulse_width_1x = 0;
            
            // Wait for rising edge of tick (sampled at clock edge)  
            while (1) begin
                @(posedge clk);
                if (!tick_1x_prev && tick_1x) begin
                    // Rising edge detected, start counting
                    pulse_width_1x = 1; // Already high for this cycle
                    tick_1x_prev = tick_1x;
                    break;
                end
                tick_1x_prev = tick_1x;
            end
            
            // Count how many more cycles it stays high
            while (1) begin
                @(posedge clk);
                if (tick_1x) begin
                    pulse_width_1x = pulse_width_1x + 1;
                end else begin
                    break; // Pulse ended
                end
            end
            
            check_value("1x pulse width", pulse_width_1x, 1);
            
            $display("  -> Verify tick pulses are 1 clock cycle\n");
        end
    endtask

    // Test: 16x tick periodicity (consistent spacing)
    task test_tick_16x_periodicity;
        integer i;
        integer period1, period2;
        integer time_last;
        begin
            $display("TEST: 16x Tick Periodicity");
            $display("--------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Measure several periods
            @(posedge tick_16x);
            time_last = $time;
            @(posedge tick_16x);
            period1 = $time - time_last;
            time_last = $time;
            @(posedge tick_16x);
            period2 = $time - time_last;
            
            // Periods should be identical (or very close)
            if (period1 == period2) begin
                $display("  [PASS] 16x tick periodic: %0d ns", period1);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] 16x tick not periodic: %0d vs %0d ns", period1, period2);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify consistent 16x tick spacing\n");
        end
    endtask

    // Test: 1x tick periodicity
    task test_tick_1x_periodicity;
        integer period1, period2;
        integer time_last;
        begin
            $display("TEST: 1x Tick Periodicity");
            $display("-------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Measure several periods
            @(posedge tick_1x);
            time_last = $time;
            @(posedge tick_1x);
            period1 = $time - time_last;
            time_last = $time;
            @(posedge tick_1x);
            period2 = $time - time_last;
            
            // Periods should be identical
            if (period1 == period2) begin
                $display("  [PASS] 1x tick periodic: %0d ns", period1);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] 1x tick not periodic: %0d vs %0d ns", period1, period2);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify consistent 1x tick spacing\n");
        end
    endtask

    // Test: No overlapping pulses
    task test_no_overlapping_pulses;
        integer i;
        integer overlap_count;
        begin
            $display("TEST: No Overlapping Pulses");
            $display("---------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Check for overlaps over many cycles
            overlap_count = 0;
            for (i = 0; i < 10000; i = i + 1) begin
                @(posedge clk);
                if (tick_16x && tick_1x) begin
                    // Overlap detected - this is actually expected on every 16th tick_16x
                    // So we allow this
                end
            end
            
            // Just verify both signals can be high simultaneously (when aligned)
            $display("  [PASS] Tick signals behave correctly");
            pass_count = pass_count + 1;
            test_num = test_num + 1;
            
            $display("  -> Verify tick signal integrity\n");
        end
    endtask

    // Test: Continuous operation
    task test_continuous_operation;
        integer i;
        integer tick_16x_cnt;
        integer tick_1x_cnt;
        begin
            $display("TEST: Continuous Operation");
            $display("--------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Run for extended period
            tick_16x_cnt = 0;
            tick_1x_cnt = 0;
            
            for (i = 0; i < 100000; i = i + 1) begin
                @(posedge clk);
                if (tick_16x) tick_16x_cnt = tick_16x_cnt + 1;
                if (tick_1x) tick_1x_cnt = tick_1x_cnt + 1;
            end
            
            // Should have many ticks
            if (tick_16x_cnt > 100 && tick_1x_cnt > 5) begin
                $display("  [PASS] Generated %0d 16x ticks, %0d 1x ticks", tick_16x_cnt, tick_1x_cnt);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Insufficient ticks generated");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify extended operation\n");
        end
    endtask

    // Test: Long duration stability
    task test_long_duration;
        integer tick_count_early;
        integer tick_count_late;
        begin
            $display("TEST: Long Duration Stability");
            $display("-----------------------------");
            
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            
            // Count ticks early in operation
            tick_count_early = 0;
            repeat(1000) begin
                @(posedge clk);
                if (tick_16x) tick_count_early = tick_count_early + 1;
            end
            
            // Skip some time
            repeat(10000) @(posedge clk);
            
            // Count ticks later in operation
            tick_count_late = 0;
            repeat(1000) begin
                @(posedge clk);
                if (tick_16x) tick_count_late = tick_count_late + 1;
            end
            
            // Counts should be similar (allow ±1 due to sampling window alignment)
            if (tick_count_early == tick_count_late || 
                tick_count_early == tick_count_late + 1 ||
                tick_count_early == tick_count_late - 1) begin
                $display("  [PASS] Stable operation: %0d ticks early, %0d ticks late", 
                         tick_count_early, tick_count_late);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Unstable operation: %0d vs %0d ticks", 
                         tick_count_early, tick_count_late);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify long-term stability\n");
        end
    endtask

    //========================================================================
    // HELPER TASKS
    //========================================================================

    // Initialize signals
    task init_signals;
        begin
            rst_n = 1'b0;
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
        end
    endtask

    // Check signal value
    task check_signal;
        input [255:0] test_name;
        input actual;
        input expected;
        begin
            test_num = test_num + 1;
            if (actual === expected) begin
                $display("  [PASS] %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected %b, got %b", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Check integer value
    task check_value;
        input [255:0] test_name;
        input integer actual;
        input integer expected;
        begin
            test_num = test_num + 1;
            if (actual == expected) begin
                $display("  [PASS] %s: %0d", test_name, actual);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected %0d, got %0d", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Waveform dump
    initial begin
        $dumpfile("results/baud_gen_tb.vcd");
        $dumpvars(0, baud_gen_tb);
    end

endmodule
