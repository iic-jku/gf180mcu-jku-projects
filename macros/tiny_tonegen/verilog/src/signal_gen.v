`ifndef SIM
`include "./adsr.v"
`include "./pwm8.v"
`include "./lfsr.v"
`include "./mixer.v"
`endif

module signal_generator (
    input clk,              // clock 
    input write_strobe,     // strobe that controls register updates
    input [2:0] address,    // addressbus
    input [4:0] data,       // databus
    input rst,              // reset
    
    output signal_out       // output for the audio signal
);

    reg [7:0] periodA = 8'd200;
    reg [3:0] volA = 4'd8;
    reg [3:0] volN = 4'd3;
    
    reg enableA = 1;
    reg enableN = 1;

    wire noise;
    wire waveA;
    wire pwm;
    wire[3:0] envA;
    wire[7:0] mix_level;
    
    adsr envA_gen (
        .clk_i(clk),
        .enable_i(enableA),
        .attack_i(4'd2),
        .decay_i(4'd2),
        .sustain_i(4'd8),
        .release_i(4'd3),
        .level_o(envA)
    );

    clock_scale tonegenA (.clk(clk), .rst(rst), .en(enableA), .scale_factor(periodA), .clk_out(waveA));

    pwm8 pwmGen (.clk(clk), .rst(rst), .pwm_o(pwm), .duty_cycle(mix_level));

    lfsr noise_gen (.clk(clk), .rst(rst), .en_step(enableN), .noise_out(noise)); 

    mixer mix (
        .clk(clk),
        .rst(rst),
        .waveA(waveA), 
        .noise(noise), 
        .volumeA(volA), 
        .volumeNoise(volN), 
        .enableA(enableA),
        .enableNoise(enableN),
        .mixout(mix_level),
        .envA(envA)
    );
    
    assign signal_out = pwm;

    always @(posedge clk) begin
        if (!rst) begin
            periodA = 8'd200;
            volA = 4'd8;
            volN = 4'd3;
            enableN = 1;
        end else begin
            if (write_strobe) begin
                case (address)
                    3'b000: periodA <= {data, periodA[2:0]};
                    3'b010: volA <= data[3:0];
                    3'b100: volN <= data[3:0];
                    3'b101: {enableA, enableN} <= {data[1:0]};
                    // 3'b110: begin
                    //     enableVib <= data[0];
                    //     vib_depth <= data[4:1];
                    // end
                    default: ;
                endcase
            end
        end
    end
endmodule
