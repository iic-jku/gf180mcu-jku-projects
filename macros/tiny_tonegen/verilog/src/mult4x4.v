module mult4x4 (
    input [3:0] a,
    input [3:0] b,
    output wire[7:0] y
);
    
    wire [3:0] and0 = b[0] ? a : 4'd0;
    wire [3:0] and1 = b[1] ? a : 4'd0;
    wire [3:0] and2 = b[2] ? a : 4'd0;
    wire [3:0] and3 = b[3] ? a : 4'd0;

    wire [7:0] p0 = {4'd0, and0};
    wire [7:0] p1 = {3'd0, and1, 1'b0};
    wire [7:0] p2 = {2'd0, and2, 2'b00};
    wire [7:0] p3 = {1'd0, and3, 3'b000};

    assign y = ((p0 + p1) + (p2 + p3));

endmodule