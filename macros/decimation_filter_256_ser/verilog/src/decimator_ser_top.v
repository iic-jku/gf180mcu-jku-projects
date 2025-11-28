// Michael Koefinger
// 26.11.2025
// 8-Stage Half-Band Filter Decimator using Saramaki HBFs' with a serial output (shift register)

`include "./synchronizer.v"
`include "./dec_top.v"
`include "./dec_serializer_22b.v"

module decimator_ser_top(
    input wire      clk,
    input wire      rst_b,
    input wire      data_i,
    output wire     data_o,        // Serial Data Stream
    output wire     frame_sync     // High while data is being transmitted
);
    /* verilator lint_off UNUSEDSIGNAL */
    wire data_i_sync_1;
    /* verilator lint_on UNUSEDSIGNAL */
    wire data_i_sync_2;
    wire [21:0] filter_o;
    wire valid_strobe;

    synchronizer #(.N_STAGES(3), .DATA_W(1)) u_sync_2 (
        .clk        (clk),
        .rst_b      (rst_b),
        .sync_i     (data_i),
        .sync_o_1   (data_i_sync_1),
        .sync_o_2   (data_i_sync_2)
    );

    decimator_top u_dec_256_22b (
        .clk_fs         (clk),
        .rst_b          (rst_b),
        .data_in        (data_i_sync_2),  
        .data_out       (filter_o),
        .valid_strobe   (valid_strobe)
    );

    dec_serializer_22b u_ser_22b (
        .clk            (clk),
        .rst_b          (rst_b),
        .valid_strobe   (valid_strobe),
        .data_i         (filter_o),  
        .data_o         (data_o),
        .frame_sync     (frame_sync)
    );
    
endmodule
