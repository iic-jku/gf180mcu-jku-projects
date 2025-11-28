module mixer (
    input clk,
    input rst,
    input waveA,                // Channel A
    // input waveB,                // Channel B
    input noise,                // LFSR-Input

    input[3:0] volumeA,         // Volume for Channel A
    // input[3:0] volumeB,         // Volume for Channel B
    input[3:0] volumeNoise,     // Volume for Noise

    // input[3:0] envA,            // Envelope for Channel A
    // input[3:0] envB,            // Envelope for Channel B

    input enableA,              // Enable Channel A
    // input enableB,              // Enable Channel B
    input enableNoise,          // Enable Noise-Channel

    output reg [7:0] mixout          // Mixer output for PWM
);
    
    reg [7:0] multA, multB;
    reg [4:0] a_val, b_val, n_val;
    reg [5:0] sum;

    reg started = 0;

    always @(posedge(clk) or posedge rst) begin
        if (rst) begin
            multA <= 8'd0;
            // multB <= 8'd0;
            a_val <= 5'd0;
            // b_val <= 5'd0;
            n_val <= 5'd0;
            sum <= 6'd0;
            mixout <= 8'd0;
            started <= 1'b0;

        end else begin

            if (!started) begin
                started <= 1'b1;
                mixout <= 8'd0;
            end else begin
                multA <= volumeA; //* envA;
                // multB <= volumeB * envB;

                a_val <= (enableA && waveA) ? multA[7:3] : 5'd0;
                // b_val <= (enableB && waveB) ? multB[7:3] : 5'd0;
                n_val <= (enableNoise && noise) ? {volumeNoise, 1'b0} : 5'd0;

                // sum <= a_val + b_val + n_val;
                sum <= a_val + n_val;
                mixout <= {sum, 2'b00};
            end
        end
    end
    
endmodule