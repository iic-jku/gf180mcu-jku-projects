module tonegen (
    input clk, 
    input [11:0] period,
    input enable,
    input rst,
    output reg wave
);
    reg[11:0] cnt = 0;
    reg[11:0] next_cnt = 0;
    
    always@(posedge(clk)) begin
        if (!rst) begin
            cnt <= 0;
            wave <= 0;
        end else begin
            if (!enable) begin
                cnt <= period;
                wave <= 0;
            end else begin
                if (cnt == 0) begin
                    cnt <= period;
                    wave <= ~wave;
                end else begin
                    cnt <= cnt - 1;
                    wave <= wave;
                end
            end 
        end
    end

    always@(cnt) begin

    end


endmodule