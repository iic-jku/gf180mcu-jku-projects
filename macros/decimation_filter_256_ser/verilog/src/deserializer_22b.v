// Michael Koefinger
// 26.11.2025
// Deserializer

module deserializer_22bit (
    input  wire        clk,            // System Clock (65,536 Hz)
    input  wire        rst_b,          // Active Low Reset
    input  wire        serial_in,      // Serial Data Stream
    input  wire        frame_sync_in,  // Envelope signal (High during data)
    output reg signed [21:0] parallel_out,   // Reconstructed 22-bit data
    output reg         data_valid      // Pulse high when parallel_out is updated
);

    reg [21:0] shift_reg;
    reg        fs_d1;      // Delayed frame sync for edge detection
    reg [4:0]  bit_cnt;    // Counter to verify packet integrity

    // Detect Falling Edge of Frame Sync (End of transmission)
    wire fs_falling = (!frame_sync_in) & fs_d1;

    always @(posedge clk or negedge rst_b) begin
        if (!rst_b) begin
            shift_reg    <= 22'd0;
            parallel_out <= 22'd0;
            data_valid   <= 1'b0;
            fs_d1        <= 1'b0;
            bit_cnt      <= 5'd0;
        end else begin
            // Track previous state of Frame Sync
            fs_d1 <= frame_sync_in;
            data_valid <= 1'b0; // Default to 0 (pulse generation)

            if (frame_sync_in) begin
                // --- CAPTURE PHASE ---
                // Shift data in (Assuming MSB First)
                // New bit goes into LSB, existing bits move Left
                shift_reg <= {shift_reg[20:0], serial_in};
                
                // Count bits received
                bit_cnt <= bit_cnt + 1'b1;
            end
            else if (fs_falling) begin
                // --- LATCH PHASE ---
                // Only update output if we received exactly 22 bits.
                // This filters out noise glitches on the line.
                if (bit_cnt == 5'd22) begin
                    parallel_out <= shift_reg;
                    data_valid   <= 1'b1;
                end
                
                // Reset counter for next frame
                bit_cnt <= 5'd0;
            end
            else begin
                // Idle state: ensure counter is clear if we aren't in a frame
                bit_cnt <= 5'd0;
            end
        end
    end

endmodule
