// Michael Koefinger
// 26.11.2025
// Synchronizer

module synchronizer #(
    parameter N_STAGES = 3,
    parameter DATA_W = 1
)(
    input wire clk,
    input wire rst_b,
    input wire [DATA_W-1:0] sync_i,
    output wire [DATA_W-1:0] sync_o_1,
    output wire [DATA_W-1:0] sync_o_2
);
    reg [DATA_W-1:0] sync [N_STAGES-1:0];
    integer i;

    always @(posedge clk) begin
        if (!rst_b) begin
            for (i = 0; i < N_STAGES ; i++) begin
                sync[i] <= 0;
            end
            
        end else begin
            sync[0] <= sync_i;  
            for (i = 1; i < N_STAGES ; i++) begin
                sync[i] <= sync[i-1];
            end
        end
    end

    assign sync_o_1 = sync[N_STAGES-1];
    assign sync_o_2 = sync[N_STAGES-2];

endmodule
