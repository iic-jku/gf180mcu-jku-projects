/* Automatically generated from https://wokwi.com/projects/448606094166973441 */

// Online Generator: https://wokwi.com/api/projects/448606094166973441/verilog

`default_nettype none

// verilator lint_off UNUSEDSIGNAL
// verilator lint_off PINCONNECTEMPTY

module tiny_stack(
  // VDD / VSS
  `ifdef USE_POWER_PINS
  inout  wire VDD,
  inout  wire VSS,
  `endif
  
  // Inputs
  input clk,
  input rst_n,
  input  wire [4:0] ui_wokwi_in,
  
  // Outputs
  output wire [7:0] uo_wokwi_out
);
  wire net1 = clk;
  wire net2 = rst_n;
  wire net3 = ui_wokwi_in[0];
  wire net4 = ui_wokwi_in[1];
  wire net5 = ui_wokwi_in[2];
  wire net6 = ui_wokwi_in[3];
  wire net7 = ui_wokwi_in[4];
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
  wire net18 = 1'b0;
  wire net19 = 1'b1;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54;
  wire net55;
  wire net56;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64;
  wire net65;
  wire net66;
  wire net67;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;
  wire net75;
  wire net76;
  wire net77;
  wire net78;
  wire net79;
  wire net80;
  wire net81;
  wire net82;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97;
  wire net98;
  wire net99;
  wire net100;
  wire net101;
  wire net102;
  wire net103;
  wire net104;
  wire net105;
  wire net106 = 1'b0;
  wire net107;
  wire net108;
  wire net109;
  wire net110;
  wire net111;
  wire net112;
  wire net113;
  wire net114;
  wire net115;
  wire net116;
  wire net117 = 1'b1;
  wire net118;
  wire net119;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124;
  wire net125;
  wire net126;
  wire net127;
  wire net128;
  wire net129;
  wire net130;
  wire net131;
  wire net132;
  wire net133;
  wire net134;
  wire net135;
  wire net136;
  wire net137;
  wire net138;
  wire net139;
  wire net140;
  wire net141;
  wire net142;
  wire net143;
  wire net144;
  wire net145;
  wire net146;
  wire net147;
  wire net148;
  wire net149;
  wire net150;
  wire net151;
  wire net152;
  wire net153;
  wire net154;
  wire net155;
  wire net156;
  wire net157;
  wire net158;
  wire net159;
  wire net160;
  wire net161;
  wire net162;
  wire net163;
  wire net164;
  wire net165;
  wire net166;

  assign uo_wokwi_out[0] = net8;
  assign uo_wokwi_out[1] = net9;
  assign uo_wokwi_out[2] = net10;
  assign uo_wokwi_out[3] = net11;
  assign uo_wokwi_out[4] = net12;
  assign uo_wokwi_out[5] = net13;
  assign uo_wokwi_out[6] = net14;
  assign uo_wokwi_out[7] = net15;

  and_cell and3 (
    .a (net20),
    .b (net21),
    .out (net22)
  );
  and_cell and4 (
    .a (net23),
    .b (net22),
    .out (net24)
  );
  not_cell not4 (
    .in (net25),
    .out (net21)
  );
  not_cell not5 (
    .in (net26),
    .out (net20)
  );
  not_cell not6 (
    .in (net27),
    .out (net23)
  );
  and_cell and5 (
    .a (net26),
    .b (net25),
    .out (net28)
  );
  and_cell and6 (
    .a (net27),
    .b (net28),
    .out (net29)
  );
  and_cell and7 (
    .a (net26),
    .b (net30),
    .out (net31)
  );
  and_cell and8 (
    .a (net27),
    .b (net31),
    .out (net32)
  );
  not_cell not10 (
    .in (net25),
    .out (net30)
  );
  dffr_cell flop4 (
    .d (net33),
    .clk (net34),
    .r (net35),
    .q (net25),
    .notq (net33)
  );
  dffr_cell flop1 (
    .d (net36),
    .clk (net25),
    .r (net35),
    .q (net26),
    .notq (net36)
  );
  dffr_cell flop2 (
    .d (net37),
    .clk (net26),
    .r (net35),
    .q (net27),
    .notq (net37)
  );
  not_cell not7 (
    .in (net2),
    .out (net38)
  );
  or_cell or1 (
    .a (net38),
    .b (net39),
    .out (net35)
  );
  and_cell and9 (
    .a (net40),
    .b (net25),
    .out (net41)
  );
  and_cell and10 (
    .a (net27),
    .b (net41),
    .out (net42)
  );
  not_cell not9 (
    .in (net26),
    .out (net40)
  );
  and_cell and11 (
    .a (net43),
    .b (net44),
    .out (net45)
  );
  and_cell and12 (
    .a (net27),
    .b (net45),
    .out (net46)
  );
  and_cell and13 (
    .a (net26),
    .b (net25),
    .out (net47)
  );
  and_cell and14 (
    .a (net48),
    .b (net47),
    .out (net49)
  );
  not_cell not17 (
    .in (net27),
    .out (net48)
  );
  and_cell and15 (
    .a (net26),
    .b (net50),
    .out (net51)
  );
  and_cell and16 (
    .a (net52),
    .b (net51),
    .out (net53)
  );
  not_cell not18 (
    .in (net25),
    .out (net50)
  );
  not_cell not20 (
    .in (net27),
    .out (net52)
  );
  and_cell and17 (
    .a (net54),
    .b (net25),
    .out (net55)
  );
  and_cell and18 (
    .a (net56),
    .b (net55),
    .out (net57)
  );
  not_cell not22 (
    .in (net26),
    .out (net54)
  );
  not_cell not23 (
    .in (net27),
    .out (net56)
  );
  not_cell not8 (
    .in (net25),
    .out (net44)
  );
  not_cell not11 (
    .in (net26),
    .out (net43)
  );
  and_cell and2 (
    .a (net57),
    .b (net58),
    .out (net59)
  );
  not_cell not1 (
    .in (net59),
    .out (net60)
  );
  dffr_cell flop3 (
    .d (net61),
    .clk (net60),
    .r (net24),
    .q (net62),
    .notq (net61)
  );
  not_cell not2 (
    .in (net34),
    .out (net58)
  );
  and_cell and19 (
    .a (net63),
    .b (net58),
    .out (net64)
  );
  and_cell and20 (
    .a (net53),
    .b (net64),
    .out (net65)
  );
  not_cell not3 (
    .in (net65),
    .out (net66)
  );
  dffr_cell flop5 (
    .d (net67),
    .clk (net66),
    .r (net24),
    .q (net68),
    .notq (net67)
  );
  and_cell and21 (
    .a (net69),
    .b (net58),
    .out (net70)
  );
  and_cell and22 (
    .a (net49),
    .b (net70),
    .out (net71)
  );
  not_cell not12 (
    .in (net71),
    .out (net72)
  );
  dffr_cell flop6 (
    .d (net73),
    .clk (net72),
    .r (net24),
    .q (net74),
    .notq (net73)
  );
  and_cell and23 (
    .a (net75),
    .b (net58),
    .out (net76)
  );
  and_cell and24 (
    .a (net46),
    .b (net76),
    .out (net77)
  );
  not_cell not13 (
    .in (net77),
    .out (net78)
  );
  dffr_cell flop7 (
    .d (net79),
    .clk (net78),
    .r (net24),
    .q (net80),
    .notq (net79)
  );
  and_cell and25 (
    .a (net81),
    .b (net58),
    .out (net82)
  );
  and_cell and26 (
    .a (net42),
    .b (net82),
    .out (net83)
  );
  not_cell not14 (
    .in (net83),
    .out (net84)
  );
  dffr_cell flop8 (
    .d (net85),
    .clk (net84),
    .r (net24),
    .q (net86),
    .notq (net85)
  );
  and_cell and27 (
    .a (net87),
    .b (net58),
    .out (net88)
  );
  and_cell and28 (
    .a (net32),
    .b (net88),
    .out (net89)
  );
  not_cell not15 (
    .in (net89),
    .out (net90)
  );
  dffr_cell flop9 (
    .d (net91),
    .clk (net90),
    .r (net24),
    .q (net92),
    .notq (net91)
  );
  and_cell and29 (
    .a (net93),
    .b (net58),
    .out (net94)
  );
  and_cell and30 (
    .a (net29),
    .b (net94),
    .out (net95)
  );
  not_cell not16 (
    .in (net95),
    .out (net96)
  );
  dffr_cell flop10 (
    .d (net97),
    .clk (net96),
    .r (net24),
    .q (net98),
    .notq (net97)
  );
  and_cell and31 (
    .a (net99),
    .b (net58),
    .out (net100)
  );
  and_cell and32 (
    .a (net24),
    .b (net100),
    .out (net101)
  );
  not_cell not19 (
    .in (net101),
    .out (net102)
  );
  dffr_cell flop11 (
    .d (net103),
    .clk (net102),
    .r (net104),
    .q (net105),
    .notq (net103)
  );
  dffsr_cell flop12 (
    .d (net5),
    .clk (net5),
    .s (net107),
    .r (net108),
    .q (net109),
    .notq ()
  );
  dffsr_cell flop13 (
    .d (net5),
    .clk (net5),
    .s (net110),
    .r (net108),
    .q (net99),
    .notq ()
  );
  dffsr_cell flop14 (
    .d (net5),
    .clk (net5),
    .s (net111),
    .r (net108),
    .q (net93),
    .notq ()
  );
  dffsr_cell flop15 (
    .d (net5),
    .clk (net5),
    .s (net112),
    .r (net108),
    .q (net87),
    .notq ()
  );
  dffsr_cell flop16 (
    .d (net5),
    .clk (net5),
    .s (net113),
    .r (net108),
    .q (net81),
    .notq ()
  );
  dffsr_cell flop17 (
    .d (net5),
    .clk (net5),
    .s (net114),
    .r (net108),
    .q (net75),
    .notq ()
  );
  dffsr_cell flop18 (
    .d (net5),
    .clk (net5),
    .s (net115),
    .r (net108),
    .q (net69),
    .notq ()
  );
  dffsr_cell flop19 (
    .d (net5),
    .clk (net5),
    .s (net116),
    .r (net108),
    .q (net63),
    .notq ()
  );
  or_cell or9 (
    .a (net63),
    .b (net57),
    .out (net15)
  );
  or_cell or2 (
    .a (net69),
    .b (net53),
    .out (net14)
  );
  or_cell or3 (
    .a (net75),
    .b (net49),
    .out (net13)
  );
  or_cell or4 (
    .a (net81),
    .b (net46),
    .out (net12)
  );
  or_cell or5 (
    .a (net87),
    .b (net42),
    .out (net11)
  );
  or_cell or6 (
    .a (net93),
    .b (net32),
    .out (net10)
  );
  or_cell or7 (
    .a (net99),
    .b (net29),
    .out (net9)
  );
  or_cell or8 (
    .a (net109),
    .b (net24),
    .out (net8)
  );
  and_cell and35 (
    .a (net118),
    .b (net24),
    .out (net107)
  );
  and_cell and36 (
    .a (net7),
    .b (net9),
    .out (net118)
  );
  and_cell and37 (
    .a (net119),
    .b (net29),
    .out (net110)
  );
  and_cell and38 (
    .a (net7),
    .b (net10),
    .out (net119)
  );
  and_cell and39 (
    .a (net120),
    .b (net32),
    .out (net111)
  );
  and_cell and40 (
    .a (net7),
    .b (net11),
    .out (net120)
  );
  and_cell and41 (
    .a (net121),
    .b (net42),
    .out (net112)
  );
  and_cell and42 (
    .a (net7),
    .b (net12),
    .out (net121)
  );
  and_cell and43 (
    .a (net122),
    .b (net46),
    .out (net113)
  );
  and_cell and44 (
    .a (net7),
    .b (net13),
    .out (net122)
  );
  and_cell and45 (
    .a (net123),
    .b (net49),
    .out (net114)
  );
  and_cell and46 (
    .a (net7),
    .b (net14),
    .out (net123)
  );
  and_cell and47 (
    .a (net124),
    .b (net53),
    .out (net115)
  );
  and_cell and48 (
    .a (net7),
    .b (net15),
    .out (net124)
  );
  and_cell and49 (
    .a (net7),
    .b (net57),
    .out (net116)
  );
  or_cell or10 (
    .a (net125),
    .b (net107),
    .out (net126)
  );
  or_cell or11 (
    .a (net127),
    .b (net110),
    .out (net125)
  );
  or_cell or12 (
    .a (net128),
    .b (net111),
    .out (net127)
  );
  or_cell or13 (
    .a (net129),
    .b (net112),
    .out (net128)
  );
  or_cell or14 (
    .a (net130),
    .b (net113),
    .out (net129)
  );
  or_cell or15 (
    .a (net131),
    .b (net114),
    .out (net130)
  );
  or_cell or16 (
    .a (net116),
    .b (net115),
    .out (net131)
  );
  not_cell not21 (
    .in (net126),
    .out (net132)
  );
  and_cell and33 (
    .a (net132),
    .b (net7),
    .out (net133)
  );
  or_cell or17 (
    .a (net134),
    .b (net133),
    .out (net104)
  );
  or_cell or18 (
    .a (net99),
    .b (net104),
    .out (net108)
  );
  and_cell and34 (
    .a (net3),
    .b (net135),
    .out (net136)
  );
  dffr_cell flop21 (
    .d (net137),
    .clk (net1),
    .r (net4),
    .q (net138),
    .notq (net137)
  );
  dffr_cell flop22 (
    .d (net139),
    .clk (net138),
    .r (net4),
    .q (net140),
    .notq (net139)
  );
  dffr_cell flop23 (
    .d (net141),
    .clk (net140),
    .r (net4),
    .q (net142),
    .notq (net141)
  );
  dffr_cell flop24 (
    .d (net143),
    .clk (net142),
    .r (net4),
    .q (net144),
    .notq (net143)
  );
  dffr_cell flop25 (
    .d (net145),
    .clk (net144),
    .r (net4),
    .q (net146),
    .notq (net145)
  );
  dffr_cell flop26 (
    .d (net147),
    .clk (net146),
    .r (net4),
    .q (net148),
    .notq (net147)
  );
  dffr_cell flop27 (
    .d (net149),
    .clk (net148),
    .r (net4),
    .q (net150),
    .notq (net149)
  );
  dffr_cell flop28 (
    .d (net151),
    .clk (net150),
    .r (net4),
    .q (net152),
    .notq (net151)
  );
  dffr_cell flop29 (
    .d (net153),
    .clk (net152),
    .r (net4),
    .q (net154),
    .notq (net153)
  );
  dffr_cell flop30 (
    .d (net155),
    .clk (net154),
    .r (net4),
    .q (net156),
    .notq (net155)
  );
  dffr_cell flop31 (
    .d (net157),
    .clk (net156),
    .r (net4),
    .q (net158),
    .notq (net157)
  );
  and_cell and1 (
    .a (net158),
    .b (net159),
    .out (net160)
  );
  dff_cell flop20 (
    .d (net159),
    .clk (net6),
    .q (net135),
    .notq (net159)
  );
  or_cell or19 (
    .a (net62),
    .b (net68),
    .out (net161)
  );
  or_cell or20 (
    .a (net161),
    .b (net74),
    .out (net162)
  );
  or_cell or21 (
    .a (net162),
    .b (net80),
    .out (net163)
  );
  or_cell or22 (
    .a (net163),
    .b (net86),
    .out (net164)
  );
  or_cell or23 (
    .a (net164),
    .b (net92),
    .out (net165)
  );
  or_cell or24 (
    .a (net165),
    .b (net98),
    .out (net166)
  );
  or_cell or25 (
    .a (net166),
    .b (net105),
    .out (net39)
  );
  or_cell or26 (
    .a (net38),
    .b (net38),
    .out (net134)
  );
  or_cell or27 (
    .a (net160),
    .b (net136),
    .out (net34)
  );
endmodule
