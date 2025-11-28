// Michael Koefinger
// 26.11.2025
// Testbench for 8-Stage Half-Band Filter Decimator using Saramaki HBFs' and simple shift register as serial output

`timescale 1ns / 1ps

// `include "./synchronizer.v"
// `include "./dec_serializer_22b.v"
`include "./deserializer_22b.v"

module decimator_ser_top_tb;

    // --- Configuration ---
    localparam DATA_W = 22;       
    localparam ACC_W = 25;
    localparam CLK_PERIOD = 10;   
    localparam DECIMATION = 256;  

    reg clk;
    reg rst_b;
    reg data_in;
    wire data_out;
    wire frame_sync; 
    wire signed [21:0] parallel_out;
    wire data_valid;

    integer f_out;

    // --- DUT Instantiation ---
    decimator_ser_top uut (
        .clk(clk),
        .rst_b(rst_b),
        .data_i(data_in),
        .data_o(data_out),
        .frame_sync(frame_sync)
    );

    deserializer_22bit u_deser (
        .clk(clk),
        .rst_b(rst_b),
        .serial_in(data_out),
        .frame_sync_in(frame_sync),
        .parallel_out(parallel_out),
        .data_valid(data_valid)
    );


    // --- Clock Generation ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // --- Stimulus & Export ---
    initial begin
        $dumpfile("./decimator_ser_top_tb.vcd");
        $dumpvars;

        f_out = $fopen("./decimator_ser_top_step_response.txt", "w");
        if (f_out == 0) begin
            $display("Error: Could not open file.");
            $finish;
        end
        
        $display("Starting Simulation...");

        rst_b = 0;
        data_in = 1'b0;
        #(CLK_PERIOD * 10);
        
        rst_b = 1;
        #(CLK_PERIOD * 10);
        
        data_in = 1'b1;
        
        // Run Simulation
        repeat (75 * DECIMATION) @(posedge clk);

        $display("Simulation Complete.");
        $fclose(f_out);
        $finish;
    end

    // --- Data Writer ---
    always @(posedge clk) begin
        if (rst_b && data_valid) begin
            $fwrite(f_out, "%d\n", parallel_out);
        end
    end

endmodule