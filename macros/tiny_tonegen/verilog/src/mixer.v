`ifndef SIM
`include "./mult4x4.v"
`endif

module mixer (
    input clk,
    input rst,
    input waveA,                // Channel A
    input noise,                // LFSR-Input

    input[3:0] volumeA,         // Volume for Channel A
    input[3:0] volumeNoise,     // Volume for Noise

    input[3:0] envA,            // Envelope for Channel A
    input enableA,              // Enable Channel A
    input enableNoise,          // Enable Noise-Channel

    output reg [7:0] mixout          // Mixer output for PWM
);
    
    wire [7:0] multA;
    reg [4:0] a_val, n_val;
    reg [5:0] sum;

    reg started = 0;

    mult4x4 mul (
        .a(volumeA),
        .b(envA),
        .y(multA)
    );

    always @(posedge(clk)) begin
        if (!rst) begin
            a_val <= 5'd0;
            n_val <= 5'd0;
            sum <= 6'd0;
            mixout <= 8'd0;
            started <= 1'b0;

        end else begin

            if (!started) begin
                started <= 1'b1;
                mixout <= 8'd0;
            end else begin
                a_val <= (enableA && waveA) ? multA[7:3] : 5'd0;
                n_val <= (enableNoise && noise) ? {volumeNoise, 1'b0} : 5'd0;
                sum <= a_val + n_val;
                mixout <= {sum, 2'b00};
            end
        end
    end
    
endmodule
