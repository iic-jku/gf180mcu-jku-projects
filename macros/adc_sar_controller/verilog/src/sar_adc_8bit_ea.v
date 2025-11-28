module sar_adc_spi_oversampling
  (input  clk,
   input  reset_n,
   input  start,
   input  comp_in,
   output [7:0] dac_bits,
   output spi_miso,
   output spi_sclk,
   output done);
  reg [2:0] st;
  reg [7:0] result_reg;
  reg [7:0] trial_reg;
  reg [2:0] bit_idx;
  reg [1:0] wait_cnt;
  reg [3:0] shift_idx;
  reg sclk_int;
  reg comp_meta;
  reg comp_sync;
  reg [11:0] accum;
  reg [2:0] osr_cnt;
  wire [7:0] n15;
  wire n24;
  wire [2:0] n27;
  wire [7:0] n29;
  wire [7:0] n31;
  wire [2:0] n33;
  wire [1:0] n35;
  wire n37;
  wire n42;
  wire [31:0] n43;
  wire n45;
  wire [31:0] n46;
  wire [31:0] n48;
  wire [1:0] n49;
  wire [2:0] n51;
  wire [1:0] n52;
  wire n54;
  wire [7:0] n61;
  wire n66;
  wire [31:0] n67;
  wire n69;
  wire [11:0] n70;
  wire [11:0] n71;
  wire [31:0] n72;
  wire n74;
  wire [30:0] n75;
  wire [30:0] n77;
  wire [11:0] n78;
  wire [7:0] n79;
  wire [31:0] n80;
  wire [31:0] n82;
  wire [2:0] n83;
  wire [2:0] n86;
  wire [7:0] n87;
  wire [2:0] n89;
  wire [3:0] n91;
  wire n93;
  wire [11:0] n95;
  wire [2:0] n97;
  wire [31:0] n98;
  wire [31:0] n100;
  wire [2:0] n101;
  wire [2:0] n103;
  wire n104;
  wire [2:0] n105;
  wire n106;
  wire n107;
  wire [11:0] n108;
  wire [2:0] n109;
  wire n111;
  wire n112;
  wire [2:0] n113;
  wire [31:0] n116;
  wire n118;
  wire [31:0] n119;
  wire [31:0] n121;
  wire [3:0] n122;
  wire n125;
  wire [2:0] n127;
  wire [3:0] n128;
  wire n129;
  wire n131;
  wire n132;
  wire [3:0] n133;
  wire n135;
  wire [5:0] n136;
  reg n138;
  reg n141;
  reg [2:0] n146;
  reg [7:0] n148;
  reg [7:0] n150;
  reg [2:0] n152;
  reg [1:0] n155;
  reg [3:0] n157;
  reg n159;
  reg [11:0] n161;
  reg [2:0] n163;
  reg n198;
  reg n199;
  reg [2:0] n200;
  reg [7:0] n201;
  reg [7:0] n202;
  reg [2:0] n203;
  reg [1:0] n204;
  reg [3:0] n205;
  reg n206;
  reg n207;
  reg n208;
  reg [11:0] n209;
  reg [2:0] n210;
  wire n211;
  wire n212;
  wire n213;
  wire n214;
  wire n215;
  wire n216;
  wire n217;
  wire n218;
  wire n219;
  wire n220;
  wire n221;
  wire n222;
  wire n223;
  wire n224;
  wire n225;
  wire n226;
  wire n227;
  wire n228;
  wire n229;
  wire n230;
  wire n231;
  wire n232;
  wire n233;
  wire n234;
  wire n235;
  wire n236;
  wire n237;
  wire n238;
  wire n239;
  wire n240;
  wire n241;
  wire n242;
  wire n243;
  wire n244;
  wire [7:0] n245;
  wire n246;
  wire n247;
  wire n248;
  wire n249;
  wire n250;
  wire n251;
  wire n252;
  wire n253;
  wire n254;
  wire n255;
  wire n256;
  wire n257;
  wire n258;
  wire n259;
  wire n260;
  wire n261;
  wire n262;
  wire n263;
  wire n264;
  wire n265;
  wire n266;
  wire n267;
  wire n268;
  wire n269;
  wire n270;
  wire n271;
  wire n272;
  wire n273;
  wire n274;
  wire n275;
  wire n276;
  wire n277;
  wire n278;
  wire n279;
  wire [7:0] n280;
  wire n281;
  wire n282;
  wire n283;
  wire n284;
  wire n285;
  wire n286;
  wire n287;
  wire n288;
  wire n289;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire n296;
  wire n297;
  wire n298;
  wire n299;
  wire n300;
  wire n301;
  wire n302;
  wire n303;
  wire n304;
  wire n305;
  wire n306;
  wire n307;
  wire n308;
  wire n309;
  wire n310;
  wire n311;
  wire n312;
  wire n313;
  wire n314;
  wire [7:0] n315;
  wire n316;
  wire n317;
  wire n318;
  wire n319;
  wire n320;
  wire n321;
  wire n322;
  wire n323;
  wire n324;
  wire n325;
  wire n326;
  wire n327;
  wire n328;
  wire n329;
  wire n330;
  wire n331;
  wire n332;
  wire n333;
  wire n334;
  wire n335;
  wire n336;
  wire n337;
  wire n338;
  wire n339;
  wire n340;
  wire n341;
  wire n342;
  wire n343;
  wire n344;
  wire n345;
  wire n346;
  wire n347;
  wire n348;
  wire n349;
  wire [7:0] n350;
  wire n351;
  assign dac_bits = n15; //(module output)
  assign spi_miso = n198; //(module output)
  assign spi_sclk = sclk_int; //(module output)
  assign done = n199; //(module output)
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:70:16  */
  always @*
    st = n200; // (isignal)
  initial
    st = 3'b000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:73:16  */
  always @*
    result_reg = n201; // (isignal)
  initial
    result_reg = 8'b00000000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:74:16  */
  always @*
    trial_reg = n202; // (isignal)
  initial
    trial_reg = 8'b00000000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:75:16  */
  always @*
    bit_idx = n203; // (isignal)
  initial
    bit_idx = 3'b111;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:76:16  */
  always @*
    wait_cnt = n204; // (isignal)
  initial
    wait_cnt = 2'b00;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:77:16  */
  always @*
    shift_idx = n205; // (isignal)
  initial
    shift_idx = 4'b0000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:78:16  */
  always @*
    sclk_int = n206; // (isignal)
  initial
    sclk_int = 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:81:16  */
  always @*
    comp_meta = n207; // (isignal)
  initial
    comp_meta = 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:81:27  */
  always @*
    comp_sync = n208; // (isignal)
  initial
    comp_sync = 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:84:16  */
  always @*
    accum = n209; // (isignal)
  initial
    accum = 12'b000000000000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:85:16  */
  always @*
    osr_cnt = n210; // (isignal)
  initial
    osr_cnt = 3'b000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:88:43  */
  assign n15 = result_reg | trial_reg;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:110:16  */
  assign n24 = ~reset_n;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:133:11  */
  assign n27 = start ? 3'b001 : st;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:133:11  */
  assign n29 = start ? 8'b00000000 : result_reg;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:133:11  */
  assign n31 = start ? 8'b00000000 : trial_reg;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:133:11  */
  assign n33 = start ? 3'b111 : bit_idx;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:133:11  */
  assign n35 = start ? 2'b00 : wait_cnt;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:132:9  */
  assign n37 = st == 3'b000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:144:9  */
  assign n42 = st == 3'b001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:153:23  */
  assign n43 = {30'b0, wait_cnt};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:153:23  */
  assign n45 = n43 == 32'b00000000000000000000000000000010;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:156:34  */
  assign n46 = {30'b0, wait_cnt};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:156:34  */
  assign n48 = n46 + 32'b00000000000000000000000000000001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:156:25  */
  assign n49 = n48[1:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:153:11  */
  assign n51 = n45 ? 3'b011 : st;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:153:11  */
  assign n52 = n45 ? wait_cnt : n49;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:152:9  */
  assign n54 = st == 3'b010;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:163:11  */
  assign n61 = comp_sync ? n280 : n315;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:162:9  */
  assign n66 = st == 3'b011;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:22  */
  assign n67 = {29'b0, bit_idx};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:22  */
  assign n69 = n67 == 32'b00000000000000000000000000000000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:177:30  */
  assign n70 = {4'b0, result_reg};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:177:28  */
  assign n71 = accum + n70;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:24  */
  assign n72 = {29'b0, osr_cnt};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:24  */
  assign n74 = n72 == 32'b00000000000000000000000000000011;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:180:42  */
  assign n75 = {19'b0, accum};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:180:42  */
  assign n77 = n75 / 31'b0000000000000000000000000000100; // udiv
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:180:42  */
  assign n78 = n77[11:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:180:29  */
  assign n79 = n78[7:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:187:34  */
  assign n80 = {29'b0, osr_cnt};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:187:34  */
  assign n82 = n80 + 32'b00000000000000000000000000000001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:187:26  */
  assign n83 = n82[2:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:13  */
  assign n86 = n74 ? 3'b101 : 3'b001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n87 = n104 ? n79 : result_reg;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:13  */
  assign n89 = n74 ? bit_idx : 3'b111;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n91 = n106 ? 4'b0111 : shift_idx;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n93 = n107 ? 1'b0 : sclk_int;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:13  */
  assign n95 = n74 ? 12'b000000000000 : n71;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:178:13  */
  assign n97 = n74 ? 3'b000 : n83;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:192:32  */
  assign n98 = {29'b0, bit_idx};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:192:32  */
  assign n100 = n98 - 32'b00000000000000000000000000000001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:192:24  */
  assign n101 = n100[2:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n103 = n69 ? n86 : 3'b001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n104 = n74 & n69;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n105 = n69 ? n89 : n101;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n106 = n74 & n69;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n107 = n74 & n69;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n108 = n69 ? n95 : accum;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:175:11  */
  assign n109 = n69 ? n97 : osr_cnt;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:174:9  */
  assign n111 = st == 3'b100;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:200:23  */
  assign n112 = ~sclk_int;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:202:46  */
  assign n113 = shift_idx[2:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:203:26  */
  assign n116 = {28'b0, shift_idx};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:203:26  */
  assign n118 = n116 == 32'b00000000000000000000000000000000;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:207:38  */
  assign n119 = {28'b0, shift_idx};  //  uext
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:207:38  */
  assign n121 = n119 - 32'b00000000000000000000000000000001;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:207:28  */
  assign n122 = n121[3:0];  // trunc
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:203:13  */
  assign n125 = n118 ? 1'b1 : 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:201:11  */
  assign n127 = n132 ? 3'b000 : st;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:203:13  */
  assign n128 = n118 ? shift_idx : n122;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:201:11  */
  assign n129 = sclk_int ? n351 : n198;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:201:11  */
  assign n131 = sclk_int ? n125 : 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:201:11  */
  assign n132 = n118 & sclk_int;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:201:11  */
  assign n133 = sclk_int ? n128 : shift_idx;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:199:9  */
  assign n135 = st == 3'b101;
  assign n136 = {n135, n111, n66, n54, n42, n37};
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n138 = n129;
      6'b010000: n138 = n198;
      6'b001000: n138 = n198;
      6'b000100: n138 = n198;
      6'b000010: n138 = n198;
      6'b000001: n138 = n198;
      default: n138 = 1'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n141 = n131;
      6'b010000: n141 = 1'b0;
      6'b001000: n141 = 1'b0;
      6'b000100: n141 = 1'b0;
      6'b000010: n141 = 1'b0;
      6'b000001: n141 = 1'b0;
      default: n141 = 1'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n146 = n127;
      6'b010000: n146 = n103;
      6'b001000: n146 = 3'b100;
      6'b000100: n146 = n51;
      6'b000010: n146 = 3'b010;
      6'b000001: n146 = n27;
      default: n146 = 3'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n148 = result_reg;
      6'b010000: n148 = n87;
      6'b001000: n148 = n61;
      6'b000100: n148 = result_reg;
      6'b000010: n148 = result_reg;
      6'b000001: n148 = n29;
      default: n148 = 8'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n150 = trial_reg;
      6'b010000: n150 = trial_reg;
      6'b001000: n150 = n350;
      6'b000100: n150 = trial_reg;
      6'b000010: n150 = n245;
      6'b000001: n150 = n31;
      default: n150 = 8'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n152 = bit_idx;
      6'b010000: n152 = n105;
      6'b001000: n152 = bit_idx;
      6'b000100: n152 = bit_idx;
      6'b000010: n152 = bit_idx;
      6'b000001: n152 = n33;
      default: n152 = 3'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n155 = wait_cnt;
      6'b010000: n155 = wait_cnt;
      6'b001000: n155 = wait_cnt;
      6'b000100: n155 = n52;
      6'b000010: n155 = 2'b00;
      6'b000001: n155 = n35;
      default: n155 = 2'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n157 = n133;
      6'b010000: n157 = n91;
      6'b001000: n157 = shift_idx;
      6'b000100: n157 = shift_idx;
      6'b000010: n157 = shift_idx;
      6'b000001: n157 = shift_idx;
      default: n157 = 4'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n159 = n112;
      6'b010000: n159 = n93;
      6'b001000: n159 = sclk_int;
      6'b000100: n159 = sclk_int;
      6'b000010: n159 = sclk_int;
      6'b000001: n159 = sclk_int;
      default: n159 = 1'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n161 = accum;
      6'b010000: n161 = n108;
      6'b001000: n161 = accum;
      6'b000100: n161 = accum;
      6'b000010: n161 = accum;
      6'b000001: n161 = accum;
      default: n161 = 12'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:126:7  */
  always @*
    case (n136)
      6'b100000: n163 = osr_cnt;
      6'b010000: n163 = n109;
      6'b001000: n163 = osr_cnt;
      6'b000100: n163 = osr_cnt;
      6'b000010: n163 = osr_cnt;
      6'b000001: n163 = osr_cnt;
      default: n163 = 3'bX;
    endcase
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n198 <= 1'b0;
    else
      n198 <= n138;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n199 <= 1'b0;
    else
      n199 <= n141;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n200 <= 3'b000;
    else
      n200 <= n146;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n201 <= 8'b00000000;
    else
      n201 <= n148;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n202 <= 8'b00000000;
    else
      n202 <= n150;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n203 <= 3'b111;
    else
      n203 <= n152;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n204 <= 2'b00;
    else
      n204 <= n155;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n205 <= 4'b0000;
    else
      n205 <= n157;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n206 <= 1'b0;
    else
      n206 <= n159;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:99:5  */
  always @(posedge clk)
    n207 <= comp_in;
  initial
    n207 = 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:99:5  */
  always @(posedge clk)
    n208 <= comp_meta;
  initial
    n208 = 1'b0;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n209 <= 12'b000000000000;
    else
      n209 <= n161;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:123:5  */
  always @(posedge clk or posedge n24)
    if (n24)
      n210 <= 3'b000;
    else
      n210 <= n163;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n211 = bit_idx[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n212 = ~n211;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n213 = bit_idx[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n214 = ~n213;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n215 = n212 & n214;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n216 = n212 & n213;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n217 = n211 & n214;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n218 = n211 & n213;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n219 = bit_idx[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n220 = ~n219;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n221 = n215 & n220;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n222 = n215 & n219;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n223 = n216 & n220;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n224 = n216 & n219;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n225 = n217 & n220;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n226 = n217 & n219;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n227 = n218 & n220;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n228 = n218 & n219;
  assign n229 = trial_reg[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n230 = n221 ? 1'b1 : n229;
  assign n231 = trial_reg[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n232 = n222 ? 1'b1 : n231;
  assign n233 = trial_reg[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n234 = n223 ? 1'b1 : n233;
  assign n235 = trial_reg[3]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n236 = n224 ? 1'b1 : n235;
  assign n237 = trial_reg[4]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n238 = n225 ? 1'b1 : n237;
  assign n239 = trial_reg[5]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n240 = n226 ? 1'b1 : n239;
  assign n241 = trial_reg[6]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n242 = n227 ? 1'b1 : n241;
  assign n243 = trial_reg[7]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:145:11  */
  assign n244 = n228 ? 1'b1 : n243;
  assign n245 = {n244, n242, n240, n238, n236, n234, n232, n230};
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n246 = bit_idx[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n247 = ~n246;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n248 = bit_idx[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n249 = ~n248;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n250 = n247 & n249;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n251 = n247 & n248;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n252 = n246 & n249;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n253 = n246 & n248;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n254 = bit_idx[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n255 = ~n254;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n256 = n250 & n255;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n257 = n250 & n254;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n258 = n251 & n255;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n259 = n251 & n254;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n260 = n252 & n255;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n261 = n252 & n254;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n262 = n253 & n255;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n263 = n253 & n254;
  assign n264 = result_reg[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n265 = n256 ? 1'b1 : n264;
  assign n266 = result_reg[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n267 = n257 ? 1'b1 : n266;
  assign n268 = result_reg[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n269 = n258 ? 1'b1 : n268;
  assign n270 = result_reg[3]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n271 = n259 ? 1'b1 : n270;
  assign n272 = result_reg[4]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n273 = n260 ? 1'b1 : n272;
  assign n274 = result_reg[5]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n275 = n261 ? 1'b1 : n274;
  assign n276 = result_reg[6]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n277 = n262 ? 1'b1 : n276;
  assign n278 = result_reg[7]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:164:13  */
  assign n279 = n263 ? 1'b1 : n278;
  assign n280 = {n279, n277, n275, n273, n271, n269, n267, n265};
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n281 = bit_idx[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n282 = ~n281;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n283 = bit_idx[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n284 = ~n283;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n285 = n282 & n284;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n286 = n282 & n283;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n287 = n281 & n284;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n288 = n281 & n283;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n289 = bit_idx[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n290 = ~n289;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n291 = n285 & n290;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n292 = n285 & n289;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n293 = n286 & n290;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n294 = n286 & n289;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n295 = n287 & n290;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n296 = n287 & n289;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n297 = n288 & n290;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n298 = n288 & n289;
  assign n299 = result_reg[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n300 = n291 ? 1'b0 : n299;
  assign n301 = result_reg[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n302 = n292 ? 1'b0 : n301;
  assign n303 = result_reg[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n304 = n293 ? 1'b0 : n303;
  assign n305 = result_reg[3]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n306 = n294 ? 1'b0 : n305;
  assign n307 = result_reg[4]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n308 = n295 ? 1'b0 : n307;
  assign n309 = result_reg[5]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n310 = n296 ? 1'b0 : n309;
  assign n311 = result_reg[6]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n312 = n297 ? 1'b0 : n311;
  assign n313 = result_reg[7]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:166:13  */
  assign n314 = n298 ? 1'b0 : n313;
  assign n315 = {n314, n312, n310, n308, n306, n304, n302, n300};
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n316 = bit_idx[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n317 = ~n316;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n318 = bit_idx[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n319 = ~n318;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n320 = n317 & n319;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n321 = n317 & n318;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n322 = n316 & n319;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n323 = n316 & n318;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n324 = bit_idx[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n325 = ~n324;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n326 = n320 & n325;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n327 = n320 & n324;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n328 = n321 & n325;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n329 = n321 & n324;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n330 = n322 & n325;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n331 = n322 & n324;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n332 = n323 & n325;
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n333 = n323 & n324;
  assign n334 = trial_reg[0]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n335 = n326 ? 1'b0 : n334;
  assign n336 = trial_reg[1]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n337 = n327 ? 1'b0 : n336;
  assign n338 = trial_reg[2]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n339 = n328 ? 1'b0 : n338;
  assign n340 = trial_reg[3]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n341 = n329 ? 1'b0 : n340;
  assign n342 = trial_reg[4]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n343 = n330 ? 1'b0 : n342;
  assign n344 = trial_reg[5]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n345 = n331 ? 1'b0 : n344;
  assign n346 = trial_reg[6]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n347 = n332 ? 1'b0 : n346;
  assign n348 = trial_reg[7]; // extract
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:168:11  */
  assign n349 = n333 ? 1'b0 : n348;
  assign n350 = {n349, n347, n345, n343, n341, n339, n337, n335};
  /* ../../vhdl/src/sar_adc_8bit_ea.vhd:202:46  */
  assign n351 = result_reg[n113 * 1 +: 1]; //(Bmux)
endmodule

