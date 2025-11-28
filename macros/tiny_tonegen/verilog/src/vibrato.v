module vibrato (
    input clk,
    input rst,
    input enable,
    input [3:0] depth,          // Modulation depth
    input [7:0] speed,          // Modulation speed
    output reg[3:0] vibrato_o   // Output for finished vibrato offset
);
    reg[7:0] div = 0;
    reg dir = 0;            // 0 -> higher, 1 -> lower
    reg[3:0] val = 0;

    always @(posedge(clk) or posedge(rst)) begin
        if (rst) begin
            val <= 0;
            div <= 0;
            dir <= 0;
            vibrato_o <= 0;
        end else begin
            if (!enable) begin
                val <= 0;
                div <= 0;
                dir <= 0;
                vibrato_o <= 0;
            end else begin
                // Divide clk for vibrato-speed
                div <= div + 1;
                if (div == speed) begin
                    div <= 0;

                    if (!dir) begin
                        if (val < depth) begin
                            val <= val + 1;
                        end else begin
                            dir <= 1;
                        end
                    end else begin
                        if (val > 0) begin
                            val <= val - 1;
                        end else begin
                            dir <= 0;
                        end
                    end

                    vibrato_o <= val;

                end
            end
        end
    end
endmodule