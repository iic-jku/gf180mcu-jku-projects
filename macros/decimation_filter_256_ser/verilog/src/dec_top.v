// Michael Koefinger
// 18.11.2025
// 8-Stage Half-Band Filter Decimator using Saramaki HBFs'


// ***************************************************************
// 1. CSD Multiplier Modules
// ***************************************************************

module csd_mult_f11 #(
    parameter DATA_W = 32
)(
    input wire signed [DATA_W-1:0] data_in, 
    output wire signed [DATA_W-1:0] data_out 
);
    localparam SHIFT_MAX = 9;
    // Calculate internal width needed to avoid overflow during shift (Input + Shift + Guard)
    localparam SUM_W = DATA_W + SHIFT_MAX + 1;
    
    // 1. Sign-extend input to full internal width
    wire signed [SUM_W-1:0] data_wide = {{(SUM_W-DATA_W){data_in[DATA_W-1]}}, data_in};
    
    // 2. Perform CSD Shifts and Adds: (x<<9) - (x<<5) + (x)
    wire signed [SUM_W-1:0] sum = (data_wide <<< 9) - (data_wide <<< 5) + data_wide;
    
    // 3. Rounding (Round-Half-Up)
    // Create a strictly sized constant to satisfy linting tools
    wire signed [SUM_W-1:0] rnd_const = {{(SUM_W-1){1'b0}}, 1'b1}; 
    wire signed [SUM_W-1:0] rnd = sum + (rnd_const <<< (SHIFT_MAX - 1));
    
    /* verilator lint_off UNUSEDSIGNAL */
    // 4. Final division (Arithmetic Right Shift)
    wire signed [SUM_W-1:0] rnd_shifted = rnd >>> SHIFT_MAX;
    /* verilator lint_on UNUSEDSIGNAL */
    
    // 5. Explicitly select the lower bits to match output width
    assign data_out = rnd_shifted[DATA_W-1:0];

endmodule

module csd_mult_f12 #(
    parameter DATA_W = 32
)(
    input wire signed [DATA_W-1:0] data_in,
    output wire signed [DATA_W-1:0] data_out
);
    localparam SHIFT_MAX = 8;
    localparam SUM_W = DATA_W + SHIFT_MAX + 1;
    wire signed [SUM_W-1:0] data_wide = {{(SUM_W-DATA_W){data_in[DATA_W-1]}}, data_in};
    wire signed [SUM_W-1:0] sum = -((data_wide <<< 7) + (data_wide <<< 5) + data_wide);
    wire signed [SUM_W-1:0] rnd_const = {{(SUM_W-1){1'b0}}, 1'b1}; 
    wire signed [SUM_W-1:0] rnd = sum + (rnd_const <<< (SHIFT_MAX - 1));
    /* verilator lint_off UNUSEDSIGNAL */
    wire signed [SUM_W-1:0] rnd_shifted = rnd >>> SHIFT_MAX;
    /* verilator lint_on UNUSEDSIGNAL */
    assign data_out = rnd_shifted[DATA_W-1:0];
endmodule

module csd_mult_f13 #(
    parameter DATA_W = 32
)(
    input wire signed [DATA_W-1:0] data_in, 
    output wire signed [DATA_W-1:0] data_out
);
    localparam SHIFT_MAX = 9;
    localparam SUM_W = DATA_W + SHIFT_MAX + 1;
    wire signed [SUM_W-1:0] data_wide = {{(SUM_W-DATA_W){data_in[DATA_W-1]}}, data_in};
    wire signed [SUM_W-1:0] sum = (data_wide <<< 7) - (data_wide <<< 5) + data_wide;
    wire signed [SUM_W-1:0] rnd_const = {{(SUM_W-1){1'b0}}, 1'b1}; 
    wire signed [SUM_W-1:0] rnd = sum + (rnd_const <<< (SHIFT_MAX - 1));
    /* verilator lint_off UNUSEDSIGNAL */
    wire signed [SUM_W-1:0] rnd_shifted = rnd >>> SHIFT_MAX;
    /* verilator lint_on UNUSEDSIGNAL */
    assign data_out = rnd_shifted[DATA_W-1:0];
endmodule

module csd_mult_f21 #(
    parameter DATA_W = 32
)(
    input wire signed [DATA_W-1:0] data_in,
    output wire signed [DATA_W-1:0] data_out
);
    localparam SHIFT_MAX = 12;
    localparam SUM_W = DATA_W + SHIFT_MAX + 1;
    wire signed [SUM_W-1:0] data_wide = {{(SUM_W-DATA_W){data_in[DATA_W-1]}}, data_in};
    wire signed [SUM_W-1:0] sum = (data_wide <<< 11) + (data_wide <<< 8) + data_wide;
    wire signed [SUM_W-1:0] rnd_const = {{(SUM_W-1){1'b0}}, 1'b1}; 
    wire signed [SUM_W-1:0] rnd = sum + (rnd_const <<< (SHIFT_MAX - 1));
    /* verilator lint_off UNUSEDSIGNAL */
    wire signed [SUM_W-1:0] rnd_shifted = rnd >>> SHIFT_MAX;
    /* verilator lint_on UNUSEDSIGNAL */
    assign data_out = rnd_shifted[DATA_W-1:0];
endmodule

module csd_mult_f22 #(
    parameter DATA_W = 32
)(
    input wire signed [DATA_W-1:0] data_in,
    output wire signed [DATA_W-1:0] data_out
);
    localparam SHIFT_MAX = 14;
    localparam SUM_W = DATA_W + SHIFT_MAX + 1;
    wire signed [SUM_W-1:0] data_wide = {{(SUM_W-DATA_W){data_in[DATA_W-1]}}, data_in};
    wire signed [SUM_W-1:0] sum = data_wide - (data_wide <<< 10) - (data_wide <<< 6);
    wire signed [SUM_W-1:0] rnd_const = {{(SUM_W-1){1'b0}}, 1'b1}; 
    wire signed [SUM_W-1:0] rnd = sum + (rnd_const <<< (SHIFT_MAX - 1));
    /* verilator lint_off UNUSEDSIGNAL */
    wire signed [SUM_W-1:0] rnd_shifted = rnd >>> SHIFT_MAX;
    /* verilator lint_on UNUSEDSIGNAL */
    assign data_out = rnd_shifted[DATA_W-1:0];
endmodule
// ***************************************************************
// 2. Subfilter F2
// ***************************************************************

module sub_filter #(
    parameter DATA_W  = 32 
)(
    input  wire clk_fs, rst_b, ce_in,
    input  wire signed [DATA_W-1:0] data_in,
    output wire signed [DATA_W-1:0] data_out
);
    wire signed [DATA_W-1:0] data_in_x_f21, data_in_x_f22;
    reg signed [DATA_W-1:0] delay_reg [2:0];

    csd_mult_f21 #(.DATA_W(DATA_W)) u_csd_f21 (.data_in(data_in), .data_out(data_in_x_f21)); 
    csd_mult_f22 #(.DATA_W(DATA_W)) u_csd_f22 (.data_in(data_in), .data_out(data_in_x_f22));

    always @(posedge clk_fs) begin
        if (!rst_b) begin
            delay_reg[0] <= {DATA_W{1'b0}};
            delay_reg[1] <= {DATA_W{1'b0}};
            delay_reg[2] <= {DATA_W{1'b0}};
        end 
        else if (ce_in) begin
            // if data_in_x_f22 and delay_reg have different bit width, a sign extension must be performed
            // since both are DATA_W (0) evals to a empty bit vector {}
            // delay_reg[0] <= {{(DATA_W-DATA_W){data_in_x_f22[DATA_W-1]}}, data_in_x_f22};
            delay_reg[0] <= data_in_x_f22;
            delay_reg[1] <= data_in_x_f21 + delay_reg[0];
            delay_reg[2] <= data_in_x_f21 + delay_reg[1];
        end 
    end
    assign data_out = delay_reg[2] + data_in_x_f22;
endmodule

// ***************************************************************
// 3. Delay Module
// ***************************************************************

module delay_N #(
    parameter DATA_W = 32, 
    parameter N = 3
)(
    input wire clk_fs, 
    input wire rst_b,
    input wire ce_in, 
    input wire signed [DATA_W-1:0] data_in, 
    output wire signed [DATA_W-1:0] data_out   
);
    localparam TOTAL_WIDTH = DATA_W * N;
    localparam SHIFT_SLICE_START = DATA_W;
    reg signed [TOTAL_WIDTH-1:0] shift_reg;
    assign data_out = shift_reg[DATA_W-1:0];

    generate
        if (N == 1) begin : single_cycle_delay
            always @(posedge clk_fs) if (!rst_b) shift_reg <= 0; else if (ce_in) shift_reg <= data_in;
        end else begin : multi_cycle_delay
            always @(posedge clk_fs) if (!rst_b) shift_reg <= 0; else if (ce_in) shift_reg <= {data_in, shift_reg[TOTAL_WIDTH-1 : SHIFT_SLICE_START]};
        end
    endgenerate
endmodule

// ***************************************************************
// 4. Single HBF Stage
// ***************************************************************

module hbf_filter_saramaki #(
    parameter DATA_W = 16
) (
    input  wire              clk_fs,    
    input  wire              rst_b,
    input  wire              ce_samp,   
    input  wire              ce_proc,   
    input  wire signed [DATA_W-1:0] data_in,   
    output wire signed [DATA_W-1:0] data_out   
);

    // Internal signals are ALL (DATA_W)
    wire signed [DATA_W-1:0] q0, q1, q2, q3, q4; 
    wire signed [DATA_W-1:0] q5, q6;
    wire signed [DATA_W-1:0] q5_d, q6_d;
    wire signed [DATA_W-1:0] data_out_wide;
    
    // CSD Outputs are now DATA_W wide
    wire signed [DATA_W-1:0] q0_x_f1, q2_x_f2, q4_x_f3;
    
    // Input regs are DATA_W wide
    reg signed [DATA_W-1:0] data_in_e_reg, data_in_o_reg;
    wire signed [DATA_W-1:0] data_in_o_scaled;
    wire signed [DATA_W-1:0] data_in_o_scaled_d;
    
    // Input Commutator
    always @(posedge clk_fs) begin
        if (!rst_b) begin
            data_in_e_reg <= 0;
            data_in_o_reg <= 0;
        end else begin
            if (ce_samp) data_in_e_reg <= data_in;
            if (ce_proc) data_in_o_reg <= data_in;
        end
    end
    
    assign data_in_o_scaled = (data_in_o_reg + 1) >>> 1;
    
    // Delay N=1
    delay_N #(.DATA_W(DATA_W), .N(1)) u_delay_1 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc),
        .data_in(data_in_o_scaled), .data_out(data_in_o_scaled_d)
    );

    // Subfilter Chain    
    sub_filter #(.DATA_W(DATA_W)) u_F2_0 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(data_in_e_reg), .data_out(q0));
    sub_filter #(.DATA_W(DATA_W)) u_F2_1 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q0), .data_out(q1));
    sub_filter #(.DATA_W(DATA_W)) u_F2_2 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q1), .data_out(q2));
    sub_filter #(.DATA_W(DATA_W)) u_F2_3 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q2), .data_out(q3));
    sub_filter #(.DATA_W(DATA_W)) u_F2_4 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q3), .data_out(q4));

    // Main Taps
    csd_mult_f11 #(.DATA_W(DATA_W)) u_csd_f11 (.data_in(q0), .data_out(q0_x_f1));
    csd_mult_f12 #(.DATA_W(DATA_W)) u_csd_f12 (.data_in(q2), .data_out(q2_x_f2));
    csd_mult_f13 #(.DATA_W(DATA_W)) u_csd_f13 (.data_in(q4), .data_out(q4_x_f3));

    delay_N #(.DATA_W(DATA_W), .N(3)) u_delay_31 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q5), .data_out(q5_d));
    delay_N #(.DATA_W(DATA_W), .N(3)) u_delay_32 (.clk_fs(clk_fs), .rst_b(rst_b), .ce_in(ce_proc), .data_in(q6), .data_out(q6_d));

    // Additions
    assign q5 = data_in_o_scaled_d + q0_x_f1; 
    assign q6 = q5_d + q2_x_f2;
    assign data_out_wide = q6_d + q4_x_f3;
    
    assign data_out = data_out_wide;
endmodule

// ***************************************************************
// 5. CE Generator: generate sample and process enable signals 
// ***************************************************************

module ce_generator (
    input wire clk_fs,
    input wire rst_b,
    output wire [7:0] ce_proc, 
    output wire [7:0] ce_samp
);
    reg [7:0] cnt; 
    always @(posedge clk_fs) begin
        if (!rst_b) cnt <= 0; 
        else cnt <= cnt + 1;
    end

    // Retimed logic
    assign ce_samp[0] = ~cnt[0];
    assign ce_proc[0] = cnt[0];      
    assign ce_samp[1] = cnt[1] & ~cnt[0];
    assign ce_proc[1] = ~cnt[1] & ~cnt[0];     
    assign ce_samp[2] = cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_proc[2] = ~cnt[2] & ~cnt[1] & ~cnt[0]; 
    assign ce_proc[3] = ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_samp[3] = cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_proc[4] = ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_samp[4] = cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_proc[5] = ~cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_samp[5] = cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_proc[6] = ~cnt[6] & ~cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_samp[6] = cnt[6] & ~cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_proc[7] = ~cnt[7] & ~cnt[6] & ~cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
    assign ce_samp[7] = cnt[7] & ~cnt[6] & ~cnt[5] & ~cnt[4] & ~cnt[3] & ~cnt[2] & ~cnt[1] & ~cnt[0];
endmodule

// ***************************************************************
// 6. Top Level
// ***************************************************************

module decimator_256 #(
    parameter DATA_W = 16,
    parameter ACC_W = 19
)(
    input wire clk_fs, 
    input wire rst_b, 
    input wire signed [DATA_W-1:0] data_in, 
    output wire signed [DATA_W-1:0] data_out,
    output wire valid_strobe
);

    localparam signed [ACC_W-1:0] DATA_MAX = (1 <<< (DATA_W-1)) - 1;
    localparam signed [ACC_W-1:0] DATA_MIN = -(1 <<< (DATA_W-1));

    function signed [DATA_W-1:0] saturate;
        input signed [ACC_W-1:0] val;
        begin
            if (val > DATA_MAX) 
                // Verilog automatically truncates bits to fit the function return width
                saturate = DATA_MAX[DATA_W-1:0]; 
            else if (val < DATA_MIN) 
                saturate = DATA_MIN[DATA_W-1:0]; 
            else 
                saturate = val[DATA_W-1:0];
        end
    endfunction

    wire [7:0] ce_proc, ce_samp;
    wire signed [ACC_W-1:0] data_path [0:8]; 

    ce_generator u_ce_gen (.clk_fs(clk_fs), .rst_b(rst_b), .ce_proc(ce_proc), .ce_samp(ce_samp));
    
    assign data_path[0] = {{(ACC_W-DATA_W){data_in[DATA_W-1]}}, data_in};

    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) begin : hbf_chain
            hbf_filter_saramaki #(.DATA_W(ACC_W)) u_hbf_stage (
                .clk_fs    (clk_fs),
                .rst_b     (rst_b),
                .ce_samp   (ce_samp[i]),
                .ce_proc   (ce_proc[i]),
                .data_in   (data_path[i]),  
                .data_out  (data_path[i+1]) 
            );
        end
    endgenerate

    // Final Output Saturation happens ONLY here
    assign data_out = saturate(data_path[8]); 
    assign valid_strobe = ce_proc[7];
endmodule

module decimator_top (
    input wire clk_fs, 
    input wire rst_b, 
    input wire data_in, 
    output wire signed [21:0] data_out,
    output wire valid_strobe
);
    localparam DATA_W = 22;
    localparam ACC_W = DATA_W+3;

    wire signed [DATA_W-1:0] data_in_wide = {{(2){~data_in}}, {(DATA_W-2){data_in}}};

    decimator_256 #(.DATA_W(DATA_W), .ACC_W(ACC_W)) u_dec_256 (
        .clk_fs    (clk_fs),
        .rst_b     (rst_b),
        .data_in   (data_in_wide),  
        .data_out  (data_out),
        .valid_strobe(valid_strobe)
    );
endmodule
