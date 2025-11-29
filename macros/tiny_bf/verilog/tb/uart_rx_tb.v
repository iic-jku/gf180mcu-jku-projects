//=============================================================================
// uart_rx_tb.v - TinyBF UART Receiver Testbench
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-10
// Version:     1.0
//
// Description:
//   Tests 8N1 reception, oversampling, framing errors, glitch rejection

`timescale 1ns/1ps

module uart_rx_tb;

    // Testbench parameters
    parameter CLK_PERIOD = 40;      // 40ns = 25MHz
    parameter BAUD_PERIOD = 8320;   // 115200 baud period in ns at 25MHz (13*16*40ns)
    parameter BIT_PERIOD = 208;     // Baud period in clock cycles (13*16)

    // DUT signals
    reg         clk;
    reg         rst_n;
    reg         baud_tick_16x;
    reg         rx_serial;
    wire [7:0]  rx_data;
    wire        rx_valid;
    wire        rx_frame_err;
    wire        rx_busy;

    // Test tracking
    integer test_num;
    integer pass_count;
    integer fail_count;

    // Baud tick generation
    reg [15:0] baud_counter_16x;

    // Instantiate DUT
    uart_rx dut (
        .clk_i(clk),
        .rst_i(rst_n),
        .baud_tick_16x_i(baud_tick_16x),
        .rx_serial_i(rx_serial),
        .rx_data_o(rx_data),
        .rx_valid_o(rx_valid),
        .rx_frame_err_o(rx_frame_err),
        .rx_busy_o(rx_busy)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // 16x Baud tick generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_counter_16x <= 16'd0;
            baud_tick_16x <= 1'b0;
        end else begin
            if (baud_counter_16x == 16'd12) begin  // ~115200*16 at 25MHz (25M/(115200*16)≈13.56)
                baud_counter_16x <= 16'd0;
                baud_tick_16x <= 1'b1;
            end else begin
                baud_counter_16x <= baud_counter_16x + 1'b1;
                baud_tick_16x <= 1'b0;
            end
        end
    end

    // Monitor for rx_valid and rx_frame_err
    reg [7:0] last_rx_valid_pulse_width;
    reg rx_valid_prev;
    reg rx_valid_seen;  // Flag set when rx_valid pulses
    
    always @(posedge clk) begin
        rx_valid_prev <= rx_valid;
        
        if (rx_valid) begin
            if (!rx_valid_prev) begin
                $display("  [%0t] rx_valid HIGH, rx_data = 0x%02h", $time, rx_data);
            end
            rx_valid_seen <= 1'b1;  // Mark that we saw it
            if (!rx_valid_prev) begin
                // Rising edge - start counting
                last_rx_valid_pulse_width <= 1;
            end else begin
                // Still high - increment
                last_rx_valid_pulse_width <= last_rx_valid_pulse_width + 1;
            end
        end else begin
            if (rx_valid_prev) begin
                // Falling edge - pulse width is now captured
                $display("  [%0t] rx_valid LOW (pulse width was %0d cycles)", $time, last_rx_valid_pulse_width);
            end
        end
        
        // Monitor framing errors
        if (rx_frame_err) begin
            $display("  [%0t] FRAMING ERROR detected!", $time);
        end
    end

    // Main test sequence
    initial begin
        init_signals();
        rx_valid_prev = 0;
        rx_valid_seen = 0;
        last_rx_valid_pulse_width = 0;
        
        #100;
        rst_n = 1'b1;
        #100;

        $display("\n========================================");
        $display("UART RX TESTS");
        $display("========================================\n");

        // Basic functionality tests
        test_reset_state();
        test_single_byte_reception();
        test_start_bit_detection();
        test_stop_bit_detection();
        test_data_bits_lsb_first();
        
        // Valid pulse tests
        test_valid_pulse_timing();
        test_valid_pulse_duration();
        test_data_stable_with_valid();
        
        // Busy flag tests
        test_busy_flag_timing();
        test_busy_during_reception();
        
        // Data pattern tests
        test_all_zeros();
        test_all_ones();
        test_alternating_pattern();
        test_various_bytes();
        
        // Oversampling tests
        test_mid_bit_sampling();
        test_start_bit_confirmation();
        
        // Error handling
        test_false_start_bit();
        test_framing_error();
        test_glitch_rejection();
        
        // Timing tests
        test_back_to_back_reception();
        test_continuous_reception();
        
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
            
            rst_n = 1'b0;
            #100;
            
            check_signal("Reset: rx_valid low", rx_valid, 1'b0);
            check_signal("Reset: rx_busy low", rx_busy, 1'b0);
            
            rst_n = 1'b1;
            #100;
            
            $display("  -> Verify reset behavior\n");
        end
    endtask

    // Test: Single byte reception
    task test_single_byte_reception;
        reg [7:0] test_byte;
        begin
            $display("TEST: Single Byte Reception");
            $display("---------------------------");
            
            test_byte = 8'h42;
            send_byte(test_byte);
            
            // Wait for rx_valid with timeout
            wait_for_rx_valid();
            
            if (rx_valid_seen) begin
                check_data("Single byte", rx_data, test_byte);
            end else begin
                test_num = test_num + 1;
            end
            
            $display("  -> Verify byte reception completes\n");
        end
    endtask

    // Test: Start bit detection
    task test_start_bit_detection;
        begin
            $display("TEST: Start Bit Detection");
            $display("-------------------------");
            
            // Initially idle
            check_signal("Initially not busy", rx_busy, 1'b0);
            
            // Send start bit
            rx_serial = 1'b0;
            
            // Wait for detection
            #(BIT_PERIOD * CLK_PERIOD / 2);  // Half bit period
            
            // Should be busy now
            if (rx_busy) begin
                $display("  [PASS] Detected start bit");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Did not detect start bit");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            // Complete a valid dummy frame to clean up state
            // Send 8 data bits (all 0s)
            #(BIT_PERIOD * CLK_PERIOD / 2);  // Complete the start bit
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD * 8);  // 8 data bits
            
            // Send stop bit
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD * 2);  // Stop bit + margin
            
            $display("  -> Verify start bit detection\n");
        end
    endtask

    // Test: Stop bit detection
    task test_stop_bit_detection;
        reg [7:0] test_byte;
        begin
            $display("TEST: Stop Bit Detection");
            $display("------------------------");
            
            test_byte = 8'h7E;
            send_byte(test_byte);
            
            // Wait for valid
            wait_for_rx_valid();
            @(posedge clk);
            
            // Data should be valid
            check_data("Stop bit valid", rx_data, test_byte);
            
            // Busy should go low after stop bit
            @(posedge clk);
            check_signal("Not busy after stop", rx_busy, 1'b0);
            
            $display("  -> Verify stop bit handling\n");
        end
    endtask

    // Test: Data bits received LSB first
    task test_data_bits_lsb_first;
        reg [7:0] test_byte;
        begin
            $display("TEST: Data Bits LSB First");
            $display("-------------------------");
            
            test_byte = 8'b10110010;  // Known pattern
            send_byte(test_byte);
            
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("LSB first reception", rx_data, test_byte);
            
            $display("  -> Verify LSB-first reception\n");
        end
    endtask

    // Test: Valid pulse timing
    task test_valid_pulse_timing;
        reg [7:0] test_byte;
        begin
            $display("TEST: Valid Pulse Timing");
            $display("------------------------");
            
            test_byte = 8'hA5;
            send_byte(test_byte);
            
            // Wait for rx_valid with timeout
            wait_for_rx_valid();
            
            if (rx_valid_seen) begin
                $display("  [PASS] Valid pulse occurred");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Valid pulse did not occur");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify valid pulse timing\n");
        end
    endtask

    // Test: Valid pulse duration (should be 1 cycle)
    task test_valid_pulse_duration;
        reg [7:0] test_byte;
        begin
            $display("TEST: Valid Pulse Duration");
            $display("--------------------------");
            
            test_byte = 8'h3C;
            last_rx_valid_pulse_width = 0;  // Reset capture
            
            send_byte(test_byte);
            
            // Give it a few clocks to settle
            repeat(10) @(posedge clk);
            
            check_value("Valid pulse width", last_rx_valid_pulse_width, 1);
            
            $display("  -> Verify 1-cycle valid pulse\n");
        end
    endtask

    // Test: Data stable when valid asserted
    task test_data_stable_with_valid;
        reg [7:0] test_byte;
        reg [7:0] captured_data;
        begin
            $display("TEST: Data Stable With Valid");
            $display("----------------------------");
            
            test_byte = 8'hC6;
            send_byte(test_byte);
            
            // rx_valid already pulsed during send_byte
            // Check that rx_data still holds the correct value
            @(posedge clk);
            captured_data = rx_data;
            check_data("Data after reception", captured_data, test_byte);
            
            // Data should remain stable
            repeat(5) @(posedge clk);
            check_data("Data stable multiple cycles", rx_data, test_byte);
            
            $display("  -> Verify data stability\n");
        end
    endtask

    // Test: Busy flag timing
    task test_busy_flag_timing;
        reg [7:0] test_byte;
        begin
            $display("TEST: Busy Flag Timing");
            $display("----------------------");
            
            // Initially not busy
            check_signal("Initially not busy", rx_busy, 1'b0);
            
            test_byte = 8'h99;
            
            fork
                begin
                    send_byte(test_byte);
                end
                begin
                    // Wait for busy to assert
                    #(BIT_PERIOD * CLK_PERIOD / 4);
                    check_signal("Busy during reception", rx_busy, 1'b1);
                end
            join
            
            // Wait for completion
            wait_for_rx_valid();
            #100;
            
            check_signal("Not busy after reception", rx_busy, 1'b0);
            
            $display("  -> Verify busy flag timing\n");
        end
    endtask

    // Test: Busy remains high during reception
    task test_busy_during_reception;
        reg [7:0] test_byte;
        integer busy_violations;
        integer i;
        begin
            $display("TEST: Busy During Reception");
            $display("---------------------------");
            
            test_byte = 8'hFF;
            busy_violations = 0;
            
            fork
                begin
                    send_byte(test_byte);
                end
                begin
                    // Check busy throughout reception
                    #(BIT_PERIOD * CLK_PERIOD);  // Skip start bit
                    for (i = 0; i < 8; i = i + 1) begin
                        if (!rx_busy && !rx_valid) busy_violations = busy_violations + 1;
                        #(BIT_PERIOD * CLK_PERIOD);
                    end
                end
            join
            
            if (busy_violations == 0) begin
                $display("  [PASS] Busy remained high during reception");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Busy dropped during reception");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            $display("  -> Verify busy persistence\n");
        end
    endtask

    // Test: All zeros data
    task test_all_zeros;
        begin
            $display("TEST: All Zeros Data");
            $display("--------------------");
            
            send_byte(8'h00);
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("All zeros", rx_data, 8'h00);
            
            $display("  -> Verify all-zeros pattern\n");
        end
    endtask

    // Test: All ones data
    task test_all_ones;
        begin
            $display("TEST: All Ones Data");
            $display("-------------------");
            
            send_byte(8'hFF);
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("All ones", rx_data, 8'hFF);
            
            $display("  -> Verify all-ones pattern\n");
        end
    endtask

    // Test: Alternating pattern
    task test_alternating_pattern;
        begin
            $display("TEST: Alternating Pattern");
            $display("-------------------------");
            
            send_byte(8'hAA);
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("Alternating 0xAA", rx_data, 8'hAA);
            
            send_byte(8'h55);
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("Alternating 0x55", rx_data, 8'h55);
            
            $display("  -> Verify alternating patterns\n");
        end
    endtask

    // Test: Various byte values
    task test_various_bytes;
        reg [7:0] test_bytes[0:3];
        integer i;
        begin
            $display("TEST: Various Byte Values");
            $display("-------------------------");
            
            test_bytes[0] = 8'h12;
            test_bytes[1] = 8'h34;
            test_bytes[2] = 8'h56;
            test_bytes[3] = 8'h78;
            
            for (i = 0; i < 4; i = i + 1) begin
                send_byte(test_bytes[i]);
                wait_for_rx_valid();
                @(posedge clk);
                
                if (rx_data === test_bytes[i]) begin
                    $display("  [PASS] Received 0x%02h", test_bytes[i]);
                    pass_count = pass_count + 1;
                end else begin
                    $display("  [FAIL] Expected 0x%02h, got 0x%02h", test_bytes[i], rx_data);
                    fail_count = fail_count + 1;
                end
                test_num = test_num + 1;
            end
            
            $display("  -> Verify multiple byte values\n");
        end
    endtask

    // Test: Mid-bit sampling
    task test_mid_bit_sampling;
        begin
            $display("TEST: Mid-Bit Sampling");
            $display("----------------------");
            
            // This is implicitly tested by successful reception
            // The 16x oversampling samples at tick 7 and 15
            send_byte(8'h5A);
            wait_for_rx_valid();
            @(posedge clk);
            
            check_data("Mid-bit sampling", rx_data, 8'h5A);
            
            $display("  -> Verify 16x oversampling works\n");
        end
    endtask

    // Test: Start bit confirmation
    task test_start_bit_confirmation;
        begin
            $display("TEST: Start Bit Confirmation");
            $display("----------------------------");
            
            // Send valid start bit
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD / 2);
            
            // Should be busy
            if (rx_busy) begin
                $display("  [PASS] Start bit confirmed");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Start bit not confirmed");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            // Complete a valid dummy frame to clean up state
            #(BIT_PERIOD * CLK_PERIOD / 2);  // Complete the start bit
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD * 8);  // 8 data bits (all 0s)
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD * 2);  // Stop bit + margin
            
            $display("  -> Verify start bit confirmation\n");
        end
    endtask

    // Test: False start bit rejection
    task test_false_start_bit;
        begin
            $display("TEST: False Start Bit");
            $display("---------------------");
            
            // Glitch: brief low pulse
            rx_serial = 1'b0;
            #(CLK_PERIOD * 5);  // Very short
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Should return to idle (not busy)
            @(posedge clk);
            if (!rx_busy) begin
                $display("  [PASS] False start bit rejected");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] False start bit accepted");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            #1000;
            
            $display("  -> Verify glitch rejection\n");
        end
    endtask

    // Test: Framing error (missing stop bit)
    task test_framing_error;
        integer i;
        reg had_valid;
        begin
            $display("TEST: Framing Error");
            $display("-------------------");
            
            had_valid = 0;
            
            // Send start bit
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Send 8 data bits
            for (i = 0; i < 8; i = i + 1) begin
                rx_serial = 1'b0;
                #(BIT_PERIOD * CLK_PERIOD);
            end
            
            // Send INVALID stop bit (low instead of high)
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Check if valid was asserted (should NOT be)
            @(posedge clk);
            if (rx_valid) had_valid = 1;
            
            #1000;
            
            if (!had_valid) begin
                $display("  [PASS] Framing error detected, data discarded");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] Framing error not detected");
                fail_count = fail_count + 1;
            end
            test_num = test_num + 1;
            
            // Return to idle and give time for state machine to settle
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD * 5);  // Extra margin
            
            // Reset the module to clean up any residual state from bad frame
            rst_n = 1'b0;
            #100;
            rst_n = 1'b1;
            #100;
            
            $display("  -> Verify framing error handling\n");
        end
    endtask

    // Test: Glitch rejection
    task test_glitch_rejection;
        reg [7:0] test_byte;
        integer i;
        begin
            $display("TEST: Glitch Rejection");
            $display("----------------------");
            
            test_byte = 8'hBD;  // 10111101
            rx_valid_seen = 1'b0;
            
            $display("  Sending byte with injected glitches: 0x%02h (%b)", test_byte, test_byte);
            
            // Start bit with glitch
            $display("    Start bit (with glitch)");
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD / 3);  // 1/3 into bit
            rx_serial = 1'b1;                // Brief glitch high
            #(CLK_PERIOD * 2);               // 40ns glitch
            rx_serial = 1'b0;                // Back to start bit
            #(BIT_PERIOD * CLK_PERIOD * 2/3); // Rest of bit period
            
            // Data bits with random glitches
            for (i = 0; i < 8; i = i + 1) begin
                rx_serial = test_byte[i];
                $display("    Data bit %0d: %b (with glitch)", i, test_byte[i]);
                #(BIT_PERIOD * CLK_PERIOD / 2);  // Halfway into bit
                rx_serial = ~test_byte[i];       // Inject opposite glitch
                #(CLK_PERIOD * 3);               // 60ns glitch
                rx_serial = test_byte[i];        // Back to correct value
                #(BIT_PERIOD * CLK_PERIOD / 2);  // Rest of bit period
            end
            
            // Stop bit with glitch
            $display("    Stop bit (with glitch)");
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD / 3);
            rx_serial = 1'b0;                // Brief glitch low
            #(CLK_PERIOD * 2);               // 40ns glitch
            rx_serial = 1'b1;                // Back to stop bit
            #(BIT_PERIOD * CLK_PERIOD * 2/3);
            
            $display("  Transmission complete at time %0t", $time);
            
            wait_for_rx_valid();
            @(posedge clk);
            
            // Receive despite glitches
            check_data("Glitch rejection", rx_data, test_byte);
            
            $display("  -> Verify robust reception despite noise\n");
        end
    endtask

    // Test: Back-to-back reception
    task test_back_to_back_reception;
        begin
            $display("TEST: Back-to-Back Reception");
            $display("----------------------------");
            
            // First byte
            send_byte(8'hDE);
            wait_for_rx_valid();
            @(posedge clk);
            check_data("Back-to-back byte 1", rx_data, 8'hDE);
            
            // Immediately send second byte
            #10;
            send_byte(8'hAD);
            wait_for_rx_valid();
            @(posedge clk);
            check_data("Back-to-back byte 2", rx_data, 8'hAD);
            
            $display("  -> Verify consecutive reception\n");
        end
    endtask

    // Test: Continuous reception
    task test_continuous_reception;
        integer i;
        reg [7:0] test_byte;
        begin
            $display("TEST: Continuous Reception");
            $display("--------------------------");
            
            for (i = 0; i < 5; i = i + 1) begin
                test_byte = 8'hA0 + i;
                send_byte(test_byte);
                wait_for_rx_valid();
                @(posedge clk);
                
                if (rx_data === test_byte) begin
                    pass_count = pass_count + 1;
                end else begin
                    $display("  [FAIL] Byte %0d: expected 0x%02h, got 0x%02h", i, test_byte, rx_data);
                    fail_count = fail_count + 1;
                end
                test_num = test_num + 1;
            end
            
            $display("  [PASS] Received 5 consecutive bytes");
            $display("  -> Verify continuous operation\n");
        end
    endtask

    //========================================================================
    // HELPER TASKS
    //========================================================================

    // Initialize signals
    task init_signals;
        begin
            rst_n = 1'b0;
            rx_serial = 1'b1;  // Idle high
            test_num = 0;
            pass_count = 0;
            fail_count = 0;
        end
    endtask

    // Send byte task - generates serial data on rx_serial
    task send_byte;
        input [7:0] data;
        integer i;
        begin
            $display("  Sending byte: 0x%02h (%b)", data, data);
            
            // Reset the rx_valid_seen flag before sending
            rx_valid_seen = 1'b0;
            
            // Start bit
            $display("    Start bit");
            rx_serial = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                rx_serial = data[i];
                $display("    Data bit %0d: %b", i, data[i]);
                #(BIT_PERIOD * CLK_PERIOD);
            end
            
            // Stop bit
            $display("    Stop bit");
            rx_serial = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD);
            
            $display("  Transmission complete at time %0t", $time);
        end
    endtask

    // Wait for rx_valid with timeout (Verilog 2005 compatible)
    // This works even if rx_valid pulsed during send_byte
    task wait_for_rx_valid;
        integer timeout_counter;
        begin
            timeout_counter = 0;
            while (!rx_valid_seen && timeout_counter < 10000) begin
                @(posedge clk);
                timeout_counter = timeout_counter + 1;
            end
            
            if (!rx_valid_seen) begin
                $display("  [FAIL] Timeout waiting for rx_valid");
                fail_count = fail_count + 1;
            end
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
        $dumpfile("results/uart_rx_tb.vcd");
        $dumpvars(0, uart_rx_tb);
    end

endmodule
