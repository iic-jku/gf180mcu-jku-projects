`include "./tonegen.v"
`include "./lfsr.v"
`include "./mixer.v"
`include "./pwm8.v"
`include "./vibrato.v"
`include "./adsr.v"

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
    // reg [11:0] periodB = 12'd300;
    reg [3:0] volA = 4'd8;
    // reg [3:0] volB = 4'd8;
    reg [3:0] volN = 4'd3;
    
    reg enableA = 1;
    // reg enableB = 0;
    reg enableN = 1;
    reg enableVib = 1;

    wire waveA;
    // wire waveB;
    wire noise;
    wire [7:0] mix_level;

    wire[3:0] envA;
    // wire[3:0] envB;

    wire [3:0] vibA;
    reg [3:0] vib_depth = 4'd4;
    reg [7:0] vib_speed;

    initial vib_speed = 8'd50;

    wire signal_raw;

    // assign debug[0] = (^waveA === 1'bx) ? 1'b0 : waveA;
    // assign debug[1] = (^waveB === 1'bx) ? 1'b0 : waveB;
    assign debug[0] = 0;
    assign debug[1] = 0;
    assign debug[2] = 0;
    assign debug[3] = 0;
    assign debug[4] = 0;
    assign debug[5] = 0;
    assign debug[6] = 0;
    
    tonegen tA (.clk(clk), .period(periodA + {8'b0, vibA}), .enable(enableA), .rst(rst), .wave(waveA));

    vibrato vibA_gen (.clk(clk), .rst(rst), .enable(enableVib), .depth(vib_depth), .speed(vib_speed), .vibrato_o(vibA));

    // tonegen tB (.clk(clk), .period(periodB), .enable(enableB), .rst(rst), .wave(waveB));

    adsr envA_gen (
        .clk_i(clk),
        .enable_i(enableA),
        .attack_i(4'd2), 
        .decay_i(4'd2),
        .sustain_i(4'd8),
        .release_i(4'd3),
        .level_o(envA)
    );

    // adsr envB_gen (
    //     .clk_i(clk),
    //     .enable_i(enableB),
    //     .attack_i(4'd2), 
    //     .decay_i(4'd2),
    //     .sustain_i(4'd8),
    //     .release_i(4'd3),
    //     .level_o(envB)
    // );

    lfsr n (.clk(clk), .rst(rst), .en_step(enableN), .noise_out(noise));

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
        .mixout(mix_level),
        .envA(envA)
        // .envB(envA)
    );

    pwm8 pwm (.clk(clk), .duty_cycle(mix_level), .pwm_o(signal_raw), .rst(rst));

    // assign signal_out = (^signal_raw === 1'bx) ? 1'b0 : signal_raw;
    assign signal_out = signal_raw;
    // assign signal_out = signal_raw;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            periodA = 12'd200;
            // periodB = 12'd300;
            volA = 4'd8;
            //volB = 4'd8;
            volN = 4'd3;
            
            enableA = 1;
            // enableB = 0;
            enableN = 1;
            enableVib = 1;
        
            vib_depth = 4'd4;
            vib_speed = 8'd50;
        end else begin
            if (write_strobe) begin
                case (address)
                    3'b000: periodA <= {periodA[11:5], data};
                    // 3'b001: periodB <= {periodB[11:5], data};
                    3'b010: volA <= data[3:0];
                    // 3'b011: volB <= data[3:0];
                    3'b100: volN <= data[3:0];
                    // 3'b101: {enableA, enableB, enableN} <= {data[2:0]};
                    3'b101: {enableA, enableN} <= {data[1:0]};
                    3'b110: begin
                        enableVib <= data[0];
                        vib_depth <= data[4:1];
                    end
                    default: ;
                endcase
            end
        end
    end

endmodule