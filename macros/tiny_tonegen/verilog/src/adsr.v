module adsr (
    input clk_i,
    input enable_i,                 // adsr envelope generator active
    input [3:0] attack_i,           // attack
    input [3:0] decay_i,            // decay
    input [3:0] sustain_i,          // sustain
    input [3:0] release_i,          // release
    output reg [3:0] level_o        // output-level

);

parameter IDLE = 2'b00;
parameter ATTACK = 2'b01;
parameter DECAY = 2'b10;
parameter RELEASE = 2'b11;

reg[1:0] state = IDLE;

reg [3:0] timer = 0;

always @(posedge clk_i) begin
    case (state)
        IDLE: begin
            if (enable_i) state <= ATTACK;
            level_o <= 0;
        end

        ATTACK: begin
            // slowly raise volume to maximum
            timer <= timer + 1;
            if (timer >= attack_i) begin
                timer <= 0;
                if (level_o < 15) 
                    level_o <= level_o + 1;
                else
                    state <= DECAY;
            end
        end

        DECAY: begin
            // gradually lower volume until it reaches sustain_i
            timer <= timer + 1;
            if (timer >= decay_i) begin
                timer <= 0;
                if (level_o > sustain_i)
                    level_o <= level_o - 1;
            end
            if (!enable_i) state <= RELEASE;
        end

        RELEASE : begin
            // gradually decrease volume to 0
            timer <= timer + 1;
            if (timer >= release_i) begin
                timer <= 0;
                if (level_o > 0)
                    level_o <= level_o -1;
                else 
                    state <= IDLE;
            end
        end

        default: ;
    endcase
end
    
endmodule