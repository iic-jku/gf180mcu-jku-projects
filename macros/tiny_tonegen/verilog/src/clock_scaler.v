module clock_scale (
    input en,
    input clk,
    input rst,
    input [7:0] scale_factor,
    output reg clk_out
);
    reg[7:0] counter;

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
