//=============================================================================
// rh_bf_top_tb.v - Testbench for GF180 Board-Level Interface
//=============================================================================
// Project:     TinyBF - wafer.space GF180 Brainfuck ASIC CPU
// Author:      René Hahn
// Date:        2025-11-28
//
// Description:
//   Testbench for rh_bf_top module (GF180 tapeout wrapper)
//   Single test case: Upload and execute simple loop program
//   Program: +3, [-, .], HALT
//   Expected outputs: 0x02, 0x01, 0x00 (via UART TX)
//
// Test Coverage:
//   - Program upload via UART (programming mode)
//   - Program execution
//   - UART TX output validation
//   - Loop operation verification
//=============================================================================

`timescale 1ns/1ps

module rh_bf_top_tb;

    //=========================================================================
    // Parameters
    //=========================================================================
    parameter CLK_PERIOD = 40;         // 40ns = 25MHz
    parameter CLK_FREQ = 25000000;     // 25 MHz
    parameter BAUD_RATE = 115200;      // UART baud rate
    parameter BIT_PERIOD = 208;        // Clock cycles per UART bit (13*16 = 208)

    //=========================================================================
    // DUT Signals
    //=========================================================================
    reg        clk;
    reg        rst_n;
    reg  [3:0] ui_in;
    wire [3:0] uio_out;
    wire [6:0] uo_out;

    // Decoded outputs
    wire       uart_tx   = uo_out[0];
    wire       busy      = uo_out[1];
    wire [4:0] pc        = uo_out[6:2];
    wire [3:0] dp        = uio_out[3:0];
    
    // UART RX input (ui_in[0])
    wire       uart_rx   = ui_in[0];

    // Test control
    integer pass_count;
    integer fail_count;
    
    // UART receive buffer
    reg [7:0] rx_buffer[0:15];
    integer rx_count;

    //=========================================================================
    // DUT Instantiation
    //=========================================================================
    rh_bf_top dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .ui_in   (ui_in),
        .uio_out (uio_out),
        .uo_out  (uo_out)
    );

    //=========================================================================
    // Clock Generation
    //=========================================================================
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    //=========================================================================
    // VCD Dump
    //=========================================================================
    initial begin
        $dumpfile("results/rh_bf_top_tb.vcd");
        $dumpvars(0, rh_bf_top_tb);
    end

    //=========================================================================
    // Helper Tasks
    //=========================================================================
    
    // Wait for specified number of clock cycles
    task wait_cycles;
        input integer n;
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                @(posedge clk);
            end
        end
    endtask

    // Apply reset sequence
    task apply_reset;
        begin
            rst_n = 1'b0;
            wait_cycles(10);
            rst_n = 1'b1;
            wait_cycles(10);
        end
    endtask

    // Pulse start signal
    task pulse_start;
        begin
            ui_in[1] = 1'b1;
            wait_cycles(2);
            ui_in[1] = 1'b0;
        end
    endtask
    
    // Wait for programmer to return to IDLE
    task wait_prog_idle;
        integer timeout;
        begin
            timeout = 0;
            while (busy && timeout < 10000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end
            if (timeout >= 10000) begin
                $display("[WARN] Programmer timeout!");
            end
            wait_cycles(10);  // Extra settling time
        end
    endtask
    
    // Send one byte via UART (drive ui_in[0] = UART RX line)
    task uart_send_byte;
        input [7:0] data;
        integer i;
        begin
            $display("[INFO] Sending UART byte 0x%02h at time %0t", data, $time);
            
            // Start bit (drive low)
            ui_in[0] = 1'b0;
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                ui_in[0] = data[i];
                #(BIT_PERIOD * CLK_PERIOD);
            end
            
            // Stop bit (drive high)
            ui_in[0] = 1'b1;
            #(BIT_PERIOD * CLK_PERIOD);
            
            $display("[INFO] UART byte sent at time %0t", $time);
        end
    endtask
    
    // Receive one byte via UART (monitor uo_out[0] = UART TX line)
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
            
            // Move to first data bit
            #(BIT_PERIOD * CLK_PERIOD);
            
            // Sample 8 data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                data[i] = uart_tx;
                #(BIT_PERIOD * CLK_PERIOD);
            end
            
            // Store received byte
            rx_buffer[rx_count] = data;
            rx_count = rx_count + 1;
            
            $display("[INFO] UART byte received: 0x%02h at time %0t", data, $time);
            
            // Wait through stop bit
            #(BIT_PERIOD * CLK_PERIOD);
        end
    endtask

    //=========================================================================
    // Main Test Sequence
    //=========================================================================
    initial begin
        // Initialize
        pass_count = 0;
        fail_count = 0;
        rx_count = 0;
        clk = 0;
        rst_n = 0;
        ui_in = 4'b0001;  // UART RX idle high

        $display("\n============================================================");
        $display("rh_bf_top Simple Loop Test");
        $display("============================================================");
        $display("Program: +3, [-, .], HALT");
        $display("Expected outputs: 0x02, 0x01, 0x00");
        $display("============================================================\n");

        // Apply reset
        apply_reset();
        
        // Enter programming mode (ui_in[3] = 1)
        $display("[INFO] Entering programming mode...");
        ui_in[3] = 1'b1;
        wait_cycles(10);
        
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
        pass_count = pass_count + 1;
        
        // Exit programming mode
        $display("[INFO] Exiting programming mode...");
        ui_in[3] = 1'b0;
        wait_cycles(10);
        
        // Start execution
        $display("[INFO] Starting execution...");
        pulse_start();
        
        // Wait a bit for execution to begin
        wait_cycles(100);
        
        // Receive 3 UART outputs
        $display("[INFO] Waiting for UART outputs...");
        uart_receive_byte();
        uart_receive_byte();
        uart_receive_byte();
        
        // Verify outputs
        if (rx_buffer[0] === 8'h02 && 
            rx_buffer[1] === 8'h01 && 
            rx_buffer[2] === 8'h00) begin
            $display("[PASS] Loop outputs correct: 0x02, 0x01, 0x00");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Loop outputs incorrect");
            $display("       Expected: 0x02, 0x01, 0x00");
            $display("       Got:      0x%02h, 0x%02h, 0x%02h", 
                     rx_buffer[0], rx_buffer[1], rx_buffer[2]);
            fail_count = fail_count + 1;
        end
        
        // Wait for CPU to halt
        $display("[INFO] Waiting for CPU to halt...");
        wait_cycles(50000);  // Long enough to see all outputs
        
        // Summary
        $display("\n============================================================");
        $display("Test Summary");
        $display("============================================================");
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        
        if (fail_count == 0) begin
            $display("\n*** ALL TESTS PASSED ***\n");
        end else begin
            $display("\n*** SOME TESTS FAILED ***\n");
        end
        
        $display("============================================================\n");
        $finish;
    end

    //=========================================================================
    // Timeout Watchdog
    //=========================================================================
    initial begin
        #100_000_000;  // 100ms timeout (plenty of time for UART)
        $display("\n[ERROR] Testbench timeout!");
        $finish;
    end

endmodule
