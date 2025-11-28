// Noise generator using linear feedback shift registers

module lfsr (
    input clk,              // Clock-Input
    input rst,              // Reset-Input
    input en_step,          // Enable Step -> Enable shifting of register
    output reg noise_out        // Output of noise-bit
);
    reg[15:0] noise_reg;    // 16-bit shift-register
    reg feedback;           // feedback value

    initial noise_reg = 16'hACE1;   // often used seed for lfsr-based noise

    always @(posedge(clk)) begin
        if (rst) begin
            noise_reg <= 16'hACE1;
        end else if (en_step) begin
            // Feedback-Value for feedbackpolynmoial x^16 + x^15 + x^13 + x^4 + 1
            feedback <= noise_reg[15] ^ noise_reg[15] ^ noise_reg[13] ^ noise_reg[4] ^ 1;
            // Shift noise-register by one and insert feedack-value
            noise_reg <= {noise_reg[14:0], feedback};
        end 
        // Use LSB as noise-bit
        noise_out <= noise_reg[0];
    end
endmodule