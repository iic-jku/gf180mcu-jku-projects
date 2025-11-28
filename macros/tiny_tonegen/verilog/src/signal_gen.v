`include "./tonegen.v"
`include "./lfsr.v"
`include "./mixer.v"
// `include "./clock_scaler.v"
`include "./pwm8.v"
// `include "./vibrato.v"
// `include "./adsr.v"

module signal_generator (
    input clk,              // clock 
    input write_strobe,     // strobe that controls register updates
    input [2:0] address,    // addressbus
    input [4:0] data,       // databus
    input rst,              // reset
    
    output signal_out,      // output for the audio signal
    output[6:0] debug       // debug-outputs
);

    reg [11:0] periodA = 12'd200;
    reg [3:0] volA = 4'd8;
    reg [3:0] volN = 4'd3;
    
    reg enableA = 1;
    reg enableN = 1;

    wire noise;
    wire waveA;
    wire pwm;
    wire[7:0] mix_level;

    assign debug[0] = 0;
    assign debug[1] = 0;
    assign debug[2] = 0;
    assign debug[3] = 0;
    assign debug[4] = 0;
    assign debug[5] = 0;
    assign debug[6] = 0;
    
    // tonegen tA (.clk(clk), .period(periodA), .enable(enableA), .rst(rst), .wave(waveA));

    clock_scale tonegenA (.clk(clk), .rst(rst), .en(enableA), .scale_factor(periodA), .clk_out(waveA));

    pwm8 pwmGen (.clk(clk), .rst(rst), .pwm_o(pwm), .duty_cycle(mix_level));

    lfsr noise_gen (.clk(clk), .rst(rst), .en_step(enableN), .noise_out(noise)); 

    mixer mix (
        .clk(clk),
        .rst(rst),
        .waveA(waveA), 
        // .waveB(waveB), 
        .noise(noise), 
        .volumeA(volA), 
        // .volumeB(volB), 
        .volumeNoise(volN), 
        .enableA(enableA),
        // .enableB(enableB),
        .enableNoise(enableN),
        .mixout(mix_level)
        // .envA(envA)
        // .envB(envA)
    );
    
    assign signal_out = waveA;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            periodA = 12'd200;
            volA = 4'd8;
            // volN = 4'd33;
            
            // enableA = 1;
            enableN = 1;
            // enableVib = 1;
        
            // vib_depth = 4'd4;
            // vib_speed = 8'd50;
        end else begin
            if (write_strobe) begin
                case (address)
                    3'b000: periodA <= {periodA[11:5], data};
                    // 3'b001: periodB <= {periodB[11:5], data};
                    // 3'b010: volA <= data[3:0];
                    // 3'b011: volB <= data[3:0];
                    // 3'b100: volN <= data[3:0];
                    // 3'b101: {enableA, enableB, enableN} <= {data[2:0]};
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