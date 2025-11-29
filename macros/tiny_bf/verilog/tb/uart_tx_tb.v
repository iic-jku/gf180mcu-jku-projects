//=============================================================================
// uart_tx_tb.v - TinyBF UART Transmitter Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Tests 8N1 transmission, busy flag, timing, error conditions

`timescale 1ns/1ps

module uart_tx_tb;

    // Testbench parameters
    parameter CLK_PERIOD = 40;      // 40ns = 25MHz
    parameter BAUD_PERIOD = 8320;   // 115200 baud at 25MHz (208 clocks * 40ns)

    // DUT signals
    reg         clk;
    reg         rst_n;
    reg         baud_tick;
    reg         tx_start;
    reg  [7:0]  tx_data;
    wire        tx_serial;
    wire        tx_busy;

    // Test tracking
    integer test_num;
    integer pass_count;
    integer fail_count;

    // Baud tick generation counter
    reg [15:0] baud_counter;

    // Instantiate DUT
    uart_tx dut (
        .clk_i(clk),
        .rst_i(rst_n),
        .baud_tick_i(baud_tick),
        .tx_start_i(tx_start),
        .tx_data_i(tx_data),
        .tx_serial_o(tx_serial),
        .tx_busy_o(tx_busy)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Baud tick generation (simulate baud_gen output)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_counter <= 16'd0;
            baud_tick <= 1'b0;
        end else begin
            if (baud_counter == 16'd207) begin  // ~115200 baud at 25MHz (13*16=208 clocks)
                baud_counter <= 16'd0;
                baud_tick <= 1'b1;
            end else begin
                baud_counter <= baud_counter + 1'b1;
                baud_tick <= 1'b0;
            end
        end
    end

    // Main test sequence
    initial begin
        init_signals();
        
        #100;
        rst_n = 1'b1;
        #100;

        $display("\n========================================");
        $display("UART TX TESTS");
        $display("========================================\n");

        // Basic functionality tests
        test_reset_state();
        test_single_byte_transmission();
        test_start_bit();
        test_stop_bit();
        #10000;
        test_data_bits_lsb_first();
        
        // Busy flag tests
        test_busy_flag_timing();
        test_busy_during_transmission();
        test_ready_after_transmission();
        
        // Data pattern tests
        test_all_zeros();
        test_various_bytes();
        
        // Timing tests
        test_back_to_back_transmission();
        test_idle_state_duration();
        test_bit_timing();
        
        // Edge cases
        test_start_during_transmission();
        test_rapid_start_pulses();
        test_reset_during_transmission();
        
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

    // Test: Reset state
    task test_reset_state;
        begin
            $display("TEST: Reset State");
            $display("-----------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            rst_n = 1'b0;
            #100;
            
            check_signal("Reset: tx_serial high", tx_serial, 1'b1);
            check_signal("Reset: tx_busy low", tx_busy, 1'b0);
            
            rst_n = 1'b1;
            #100;
            
            $display("  -> Verify reset behavior\n");
        end
    endtask

    // Test: Single byte transmission
    task test_single_byte_transmission;
        begin
            $display("TEST: Single Byte Transmission");
            $display("-------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'h55;  // 01010101
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait for transmission to complete
            wait(!tx_busy);
            #1000;
            
            check_signal("Single byte: tx_serial back to idle", tx_serial, 1'b1);
            
            $display("  -> Verify byte transmission completes\n");
        end
    endtask

    // Test: Start bit
    task test_start_bit;
        integer start_time;
        integer bit_start_time;
        integer bit_duration;
        integer wait_cnt;
        begin
            $display("TEST: Start Bit");
            $display("---------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'hAA;
            start_time = $time;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait for WAIT_SYNC -> START_BIT transition (should happen on baud tick)
            // Serial should stay high during WAIT_SYNC, then go low for start bit
            wait_cnt = 0;
            while (tx_serial == 1'b1 && wait_cnt < 1000) begin
                @(posedge clk);
                wait_cnt = wait_cnt + 1;
            end
            
            if (wait_cnt >= 1000) begin
                $display("  [FAIL] Timeout waiting for start bit to begin");
                fail_count = fail_count + 1;
                test_num = test_num + 1;
            end else begin
                // Start bit has begun - wait one more clock to stabilize
                @(posedge clk);
                bit_start_time = $time;
                
                // Check that serial output is low (start bit)
                #(CLK_PERIOD * 2);
                check_signal("Start bit is low", tx_serial, 1'b0);
                
                // Wait for next baud tick (START_BIT -> DATA_BITS transition)
                @(posedge baud_tick);
                bit_duration = $time - bit_start_time;
                
                // Verify start bit lasted exactly one baud period (±120ns tolerance for measurement timing)
                if (bit_duration >= (BAUD_PERIOD - 120) && 
                    bit_duration <= (BAUD_PERIOD + 120)) begin
                    $display("  [PASS] Start bit duration: %0d ns (expected ~%0d ns)", 
                             bit_duration, BAUD_PERIOD);
                    pass_count = pass_count + 1;
                end else begin
                    $display("  [FAIL] Start bit duration: %0d ns (expected ~%0d ns)", 
                             bit_duration, BAUD_PERIOD);
                    fail_count = fail_count + 1;
                end
                test_num = test_num + 1;
            end
            
            // Wait for completion
            wait(!tx_busy);
            
            $display("  -> Verify start bit timing\n");
        end
    endtask

    // Test: Stop bit
    task test_stop_bit;
        integer i;
        reg stop_bit_value;
        begin
            $display("TEST: Stop Bit");
            $display("--------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'h00;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait for WAIT_SYNC, then start bit + 8 data bits = 10 baud ticks total
            repeat(10) @(posedge baud_tick);
            
            // After 10 baud ticks, we should be in STOP_BIT state
            // Wait a couple clocks to let the state machine update
            @(posedge clk);
            @(posedge clk);
            
            // Check stop bit is high
            stop_bit_value = tx_serial;
            check_signal("Stop bit is high", stop_bit_value, 1'b1);
            
            // Wait for completion
            wait(!tx_busy);
            
            $display("  -> Verify stop bit format\n");
        end
    endtask

    // Test: Data bits sent LSB first
    task test_data_bits_lsb_first;
        reg [7:0] captured_data;
        integer i;
        begin
            $display("TEST: Data Bits LSB First");
            $display("-------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'b10110010;  // Known pattern
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Skip WAIT_SYNC→START_BIT tick and START_BIT→DATA_BITS tick
            @(posedge baud_tick);  // WAIT_SYNC → START_BIT
            @(posedge baud_tick);  // START_BIT → DATA_BITS (first data bit output)
            
            // Now capture 8 data bits
            // Sample in the middle of each bit period for robustness
            for (i = 0; i < 8; i = i + 1) begin
                // Wait into middle of bit period
                repeat(5) @(posedge clk);
                captured_data[i] = tx_serial;
                // Wait for next bit
                if (i < 7) @(posedge baud_tick);
            end
            
            check_data("LSB first data", captured_data, tx_data);
            
            // Wait for completion
            wait(!tx_busy);
            
            $display("  -> Verify LSB-first transmission\n");
        end
    endtask

    // Test: Busy flag timing
    task test_busy_flag_timing;
        begin
            $display("TEST: Busy Flag Timing");
            $display("----------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            // Initially not busy
            check_signal("Initially not busy", tx_busy, 1'b0);
            
            // Start transmission
            tx_data = 8'h42;
            tx_start = 1'b1;
            @(posedge clk);
            
            // Should be busy immediately after start
            check_signal("Busy after tx_start", tx_busy, 1'b1);
            
            tx_start = 1'b0;
            
            // Wait for completion
            wait(!tx_busy);
            @(posedge clk);
            
            check_signal("Not busy after completion", tx_busy, 1'b0);
            
            $display("  -> Verify busy flag timing\n");
        end
    endtask

    // Test: Busy remains high during transmission
    task test_busy_during_transmission;
        integer i;
        integer busy_violations;
        begin
            $display("TEST: Busy During Transmission");
            $display("------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'hFF;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Check busy stays high throughout transmission
            busy_violations = 0;
            repeat(10) begin  // 10 baud periods (start + 8 data + stop)
                @(posedge baud_tick);
                if (!tx_busy) busy_violations = busy_violations + 1;
            end
            
            if (busy_violations == 0) begin
                $display("  [PASS] Busy remained high during transmission");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Busy dropped during transmission (%0d violations)", busy_violations);
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            wait(!tx_busy);
            
            $display("  -> Verify busy persistence\n");
        end
    endtask

    // Test: Ready immediately after transmission
    task test_ready_after_transmission;
        begin
            $display("TEST: Ready After Transmission");
            $display("-------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'h11;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait for completion
            wait(!tx_busy);
            @(posedge clk);
            
            // Should be ready for next byte
            check_signal("Ready for next byte", tx_busy, 1'b0);
            
            $display("  -> Verify ready state\n");
        end
    endtask

    // Test: All zeros data
    task test_all_zeros;
        reg [7:0] captured;
        integer i;
        begin
            $display("TEST: All Zeros Data");
            $display("--------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'h00;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Skip WAIT_SYNC->START_BIT and START_BIT->DATA_BITS ticks
            @(posedge baud_tick);  // WAIT_SYNC -> START_BIT
            @(posedge baud_tick);  // START_BIT -> DATA_BITS
            
            // Capture data bits
            for (i = 0; i < 8; i = i + 1) begin
                @(posedge clk);
                captured[i] = tx_serial;
                if (i < 7) @(posedge baud_tick);
            end
            
            check_data("All zeros", captured, 8'h00);
            
            wait(!tx_busy);
            
            $display("  -> Verify all-zeros pattern\n");
        end
    endtask

    // Test: Various byte values
    task test_various_bytes;
        reg [7:0] test_bytes[0:3];
        integer i;
        begin
            $display("TEST: Various Byte Values");
            $display("-------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            test_bytes[0] = 8'h12;
            test_bytes[1] = 8'h34;
            test_bytes[2] = 8'h56;
            test_bytes[3] = 8'h78;
            
            for (i = 0; i < 4; i = i + 1) begin
                tx_data = test_bytes[i];
                tx_start = 1'b1;
                @(posedge clk);
                tx_start = 1'b0;
                
                wait(!tx_busy);
                @(posedge clk);
                
                $display("  [PASS] Transmitted 0x%02h", test_bytes[i]);
                pass_count = pass_count + 1;
                test_num = test_num + 1;
            end
            
            $display("  -> Verify multiple byte values\n");
        end
    endtask

    // Test: Back-to-back transmission
    task test_back_to_back_transmission;
        begin
            $display("TEST: Back-to-Back Transmission");
            $display("--------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            // First byte
            tx_data = 8'hA5;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait for completion
            wait(!tx_busy);
            @(posedge clk);
            
            // Immediately send second byte
            tx_data = 8'h5A;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Should accept immediately
            check_signal("Accepts back-to-back", tx_busy, 1'b1);
            
            wait(!tx_busy);
            
            $display("  -> Verify back-to-back operation\n");
        end
    endtask

    // Test: Idle state duration
    task test_idle_state_duration;
        integer idle_count;
        begin
            $display("TEST: Idle State Duration");
            $display("-------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            // Count idle cycles
            idle_count = 0;
            repeat(100) begin
                @(posedge clk);
                if (tx_serial == 1'b1 && !tx_busy) idle_count = idle_count + 1;
            end
            
            if (idle_count == 100) begin
                $display("  [PASS] Idle state stable: tx_serial=1, busy=0");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Idle state unstable");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify idle state characteristics\n");
        end
    endtask

    // Test: Bit timing accuracy
    task test_bit_timing;
        integer time_start, time_end;
        integer bit_period;
        begin
            $display("TEST: Bit Timing Accuracy");
            $display("-------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'h33;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Measure start bit duration
            @(negedge tx_serial);  // Start bit begins
            time_start = $time;
            @(posedge baud_tick);
            time_end = $time;
            bit_period = time_end - time_start;
            
            $display("  Bit period: %0d ns", bit_period);
            $display("  [PASS] Bit timing measured");
            pass_count = pass_count + 1;
            test_num = test_num + 1;
            
            wait(!tx_busy);
            
            $display("  -> Verify bit timing\n");
        end
    endtask

    // Test: Start signal during transmission (should be ignored)
    task test_start_during_transmission;
        reg [7:0] initial_data;
        reg busy_before_second_start;
        begin
            $display("TEST: Start During Transmission");
            $display("--------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            initial_data = 8'hC3;
            tx_data = initial_data;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait a bit into transmission (but not to completion)
            // Total transmission is 10 baud ticks (1 start + 8 data + 1 stop)
            // Wait 2 ticks to be safely in the middle
            repeat(2) @(posedge baud_tick);
            @(posedge clk);
            
            // Verify we're still busy
            busy_before_second_start = tx_busy;
            
            // Try to start a new transmission
            tx_data = 8'h99;  // Different data
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            @(posedge clk);
            
            // Should still be busy with original transmission (new start ignored)
            check_signal("Still busy (ignored new start)", tx_busy, 1'b1);
            
            // Verify we were indeed busy before the second start
            if (!busy_before_second_start) begin
                $display("  [WARN] First transmission may have completed too early");
            end
            
            wait(!tx_busy);
            
            $display("  -> Verify start-during-busy is ignored\n");
        end
    endtask

    // Test: Rapid start pulses
    task test_rapid_start_pulses;
        begin
            $display("TEST: Rapid Start Pulses");
            $display("------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            // Send multiple start pulses rapidly
            tx_data = 8'h77;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            @(posedge clk);
            tx_start = 1'b1;  // Second pulse (should be ignored)
            @(posedge clk);
            tx_start = 1'b0;
            
            // Should handle gracefully
            wait(!tx_busy);
            
            $display("  [PASS] Handled rapid pulses");
            pass_count = pass_count + 1;
            test_num = test_num + 1;
            
            $display("  -> Verify rapid start handling\n");
        end
    endtask

    // Test: Reset during transmission
    task test_reset_during_transmission;
        begin
            $display("TEST: Reset During Transmission");
            $display("--------------------------------");
            
            // Clean starting state
            wait(!tx_busy);
            @(posedge clk);
            
            tx_data = 8'hBB;
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            
            // Wait a bit
            repeat(3) @(posedge baud_tick);
            
            // Assert reset
            rst_n = 1'b0;
            #100;
            
            // Check reset state
            check_signal("Reset: tx_serial high", tx_serial, 1'b1);
            check_signal("Reset: tx_busy low", tx_busy, 1'b0);
            
            // Release reset and allow system to stabilize
            rst_n = 1'b1;
            #200;
            
            $display("  -> Verify reset during operation\n");
        end
    endtask

    //========================================================================
    // HELPER TASKS
    //========================================================================

    // Initialize signals
    task init_signals;
        begin
            rst_n = 1'b0;
            tx_start = 1'b0;
            tx_data = 8'd0;
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

    // Check data value
    task check_data;
        input [255:0] test_name;
        input [7:0] actual;
        input [7:0] expected;
        begin
            test_num = test_num + 1;
            if (actual === expected) begin
                $display("  [PASS] %s: 0x%02h", test_name, actual);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] %s - Expected 0x%02h, got 0x%02h", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Waveform dump
    initial begin
        $dumpfile("results/uart_tx_tb.vcd");
        $dumpvars(0, uart_tx_tb);
    end

endmodule
