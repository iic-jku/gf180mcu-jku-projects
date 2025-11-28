module clock_scale (
    input en,
    input clk,
    input rst,
    input [11:0] scale_factor,
    output reg clk_out
);
    reg[11:0] counter = 0;
    reg[11:0] next_counter = 11'b1;
    reg clk_val = 0;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            counter <= 0;
            clk_out <= 0;
        end else if (en) begin
            if (counter >= scale_factor) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1;
            end
        end else begin
            counter <= 0;
            clk_out <= 0;
        end
    end    
endmodule