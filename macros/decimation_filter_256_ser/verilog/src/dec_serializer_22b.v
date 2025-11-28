// Michael Koefinger
// 26.11.2025
// Serializer for the 22-bit output decimator

module dec_serializer_22b (
    input  wire        clk,
    input  wire        rst_b,
    input  wire        valid_strobe, // Asynchronous input
    input  wire [21:0] data_i,
    output wire        data_o,
    output reg         frame_sync
);

    reg [21:0] shift_reg;
    reg [4:0]  bit_cnt;
    reg        active;

    wire valid_strobe_sync_1, valid_strobe_sync_2;

    synchronizer #(.N_STAGES(3), .DATA_W(1)) u_sync_1 (.clk(clk), .rst_b(rst_b), .sync_i(valid_strobe), .sync_o_1(valid_strobe_sync_1), .sync_o_2(valid_strobe_sync_2));

    // Detect Rising Edge using the synchronized signals
    // We compare Stage 2 (current) vs Stage 3 (previous)
    wire load_pulse = valid_strobe_sync_1 & (~valid_strobe_sync_2);

    // Output Logic
    assign data_o = active ? shift_reg[21] : 1'b0;

    always @(posedge clk) begin
        if (!rst_b) begin
            shift_reg  <= 22'd0;
            bit_cnt    <= 5'd0;
            active     <= 1'b0;
            frame_sync <= 1'b0;
        end else begin
            if (load_pulse) begin
                shift_reg  <= data_i;
                bit_cnt    <= 5'd21;
                active     <= 1'b1;
                frame_sync <= 1'b1;
            end 
            else if (active) begin
                shift_reg <= {shift_reg[20:0], 1'b0};
                if (bit_cnt == 5'd0) begin
                    active     <= 1'b0;
                    frame_sync <= 1'b0;
                end else begin
                    bit_cnt <= bit_cnt - 1'b1;
                end
            end
        end
    end

endmodule
