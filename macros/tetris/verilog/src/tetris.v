module digit_renderer
  (input  clk,
   input  rst,
   input  [10:0] x,
   input  [10:0] y,
   input  [10:0] x_start,
   input  [10:0] y_start,
   input  [3:0] digit,
   output pixel_on);
  wire [10:0] x_r;
  wire [10:0] y_r;
  wire [10:0] x_start_r;
  wire [10:0] y_start_r;
  wire [3:0] digit_r;
  wire pixel_on_comb;
  wire [10:0] n5693;
  wire [10:0] n5695;
  wire [10:0] n5697;
  wire [10:0] n5699;
  wire [3:0] n5701;
  wire [30:0] n5720;
  wire [31:0] n5721;
  wire [30:0] n5722;
  wire [31:0] n5723;
  wire [31:0] n5724;
  wire [30:0] n5725;
  wire [31:0] n5726;
  wire [30:0] n5727;
  wire [31:0] n5728;
  wire [31:0] n5729;
  wire n5731;
  wire n5733;
  wire n5734;
  wire n5736;
  wire n5737;
  wire n5739;
  wire n5740;
  wire [30:0] n5741;
  wire [31:0] n5742;
  wire n5744;
  wire n5746;
  wire n5748;
  wire n5750;
  wire n5752;
  wire n5754;
  wire n5756;
  wire n5758;
  wire n5760;
  wire n5762;
  wire [9:0] n5763;
  reg n5773;
  reg n5784;
  reg n5796;
  reg n5806;
  reg n5813;
  reg n5822;
  reg n5832;
  wire n5835;
  wire n5837;
  wire n5838;
  wire n5840;
  wire n5841;
  wire n5843;
  wire n5844;
  wire n5847;
  wire n5849;
  wire n5851;
  wire n5853;
  wire n5854;
  wire n5856;
  wire n5857;
  wire n5859;
  wire n5860;
  wire n5862;
  wire n5863;
  wire n5865;
  wire n5867;
  wire n5868;
  wire n5870;
  wire n5871;
  wire n5873;
  wire n5874;
  wire n5876;
  wire n5877;
  wire n5879;
  wire n5881;
  wire n5882;
  wire n5884;
  wire n5885;
  wire n5887;
  wire n5888;
  wire n5890;
  wire n5891;
  wire n5893;
  wire n5895;
  wire n5896;
  wire n5898;
  wire n5899;
  wire n5901;
  wire n5902;
  wire n5904;
  wire n5905;
  wire n5907;
  wire n5909;
  wire n5910;
  wire n5912;
  wire n5913;
  wire n5915;
  wire n5916;
  wire n5918;
  wire n5919;
  wire n5921;
  wire n5923;
  wire n5924;
  wire n5926;
  wire n5927;
  wire n5929;
  wire n5930;
  wire n5932;
  wire n5933;
  wire n5935;
  wire n5952;
  reg n5955;
  reg [10:0] n5956;
  reg [10:0] n5957;
  reg [10:0] n5958;
  reg [10:0] n5959;
  reg [3:0] n5960;
  assign pixel_on = n5955; //(module output)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:28:12  */
  assign x_r = n5956; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:28:17  */
  assign y_r = n5957; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:29:12  */
  assign x_start_r = n5958; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:30:12  */
  assign y_start_r = n5959; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:31:12  */
  assign digit_r = n5960; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:34:12  */
  assign pixel_on_comb = n5935; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:44:13  */
  assign n5693 = rst ? 11'b00000000000 : x;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:44:13  */
  assign n5695 = rst ? 11'b00000000000 : y;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:44:13  */
  assign n5697 = rst ? 11'b00000000000 : x_start;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:44:13  */
  assign n5699 = rst ? 11'b00000000000 : y_start;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:44:13  */
  assign n5701 = rst ? 4'b0000 : digit;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:74:15  */
  assign n5720 = {20'b0, x_r};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:74:31  */
  assign n5721 = {1'b0, n5720};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:74:33  */
  assign n5722 = {20'b0, x_start_r};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:74:31  */
  assign n5723 = {1'b0, n5722};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:74:31  */
  assign n5724 = n5721 - n5723;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:75:15  */
  assign n5725 = {20'b0, y_r};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:75:31  */
  assign n5726 = {1'b0, n5725};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:75:33  */
  assign n5727 = {20'b0, y_start_r};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:75:31  */
  assign n5728 = {1'b0, n5727};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:75:31  */
  assign n5729 = n5726 - n5728;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:16  */
  assign n5731 = $signed(n5724) >= $signed(32'b00000000000000000000000000000000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:30  */
  assign n5733 = $signed(n5724) < $signed(32'b00000000000000000000000000011110);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:22  */
  assign n5734 = n5733 & n5731;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:43  */
  assign n5736 = $signed(n5729) >= $signed(32'b00000000000000000000000000000000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:35  */
  assign n5737 = n5736 & n5734;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:57  */
  assign n5739 = $signed(n5729) < $signed(32'b00000000000000000000000000101000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:49  */
  assign n5740 = n5739 & n5737;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:81:22  */
  assign n5741 = {27'b0, digit_r};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:81:13  */
  assign n5742 = {1'b0, n5741};  //  uext
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:89:17  */
  assign n5744 = n5742 == 32'b00000000000000000000000000000000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:91:17  */
  assign n5746 = n5742 == 32'b00000000000000000000000000000001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:93:17  */
  assign n5748 = n5742 == 32'b00000000000000000000000000000010;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:95:17  */
  assign n5750 = n5742 == 32'b00000000000000000000000000000011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:97:17  */
  assign n5752 = n5742 == 32'b00000000000000000000000000000100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:99:17  */
  assign n5754 = n5742 == 32'b00000000000000000000000000000101;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:101:17  */
  assign n5756 = n5742 == 32'b00000000000000000000000000000110;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:103:17  */
  assign n5758 = n5742 == 32'b00000000000000000000000000000111;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:105:17  */
  assign n5760 = n5742 == 32'b00000000000000000000000000001000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:107:17  */
  assign n5762 = n5742 == 32'b00000000000000000000000000001001;
  assign n5763 = {n5762, n5760, n5758, n5756, n5754, n5752, n5750, n5748, n5746, n5744};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5773 = 1'b1;
      10'b0100000000: n5773 = 1'b1;
      10'b0010000000: n5773 = 1'b1;
      10'b0001000000: n5773 = 1'b1;
      10'b0000100000: n5773 = 1'b1;
      10'b0000010000: n5773 = 1'b0;
      10'b0000001000: n5773 = 1'b1;
      10'b0000000100: n5773 = 1'b1;
      10'b0000000010: n5773 = 1'b0;
      10'b0000000001: n5773 = 1'b1;
      default: n5773 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5784 = 1'b1;
      10'b0100000000: n5784 = 1'b1;
      10'b0010000000: n5784 = 1'b1;
      10'b0001000000: n5784 = 1'b0;
      10'b0000100000: n5784 = 1'b0;
      10'b0000010000: n5784 = 1'b1;
      10'b0000001000: n5784 = 1'b1;
      10'b0000000100: n5784 = 1'b1;
      10'b0000000010: n5784 = 1'b1;
      10'b0000000001: n5784 = 1'b1;
      default: n5784 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5796 = 1'b1;
      10'b0100000000: n5796 = 1'b1;
      10'b0010000000: n5796 = 1'b1;
      10'b0001000000: n5796 = 1'b1;
      10'b0000100000: n5796 = 1'b1;
      10'b0000010000: n5796 = 1'b1;
      10'b0000001000: n5796 = 1'b1;
      10'b0000000100: n5796 = 1'b0;
      10'b0000000010: n5796 = 1'b1;
      10'b0000000001: n5796 = 1'b1;
      default: n5796 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5806 = 1'b1;
      10'b0100000000: n5806 = 1'b1;
      10'b0010000000: n5806 = 1'b0;
      10'b0001000000: n5806 = 1'b1;
      10'b0000100000: n5806 = 1'b1;
      10'b0000010000: n5806 = 1'b0;
      10'b0000001000: n5806 = 1'b1;
      10'b0000000100: n5806 = 1'b1;
      10'b0000000010: n5806 = 1'b0;
      10'b0000000001: n5806 = 1'b1;
      default: n5806 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5813 = 1'b0;
      10'b0100000000: n5813 = 1'b1;
      10'b0010000000: n5813 = 1'b0;
      10'b0001000000: n5813 = 1'b1;
      10'b0000100000: n5813 = 1'b0;
      10'b0000010000: n5813 = 1'b0;
      10'b0000001000: n5813 = 1'b0;
      10'b0000000100: n5813 = 1'b1;
      10'b0000000010: n5813 = 1'b0;
      10'b0000000001: n5813 = 1'b1;
      default: n5813 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5822 = 1'b1;
      10'b0100000000: n5822 = 1'b1;
      10'b0010000000: n5822 = 1'b0;
      10'b0001000000: n5822 = 1'b1;
      10'b0000100000: n5822 = 1'b1;
      10'b0000010000: n5822 = 1'b1;
      10'b0000001000: n5822 = 1'b0;
      10'b0000000100: n5822 = 1'b0;
      10'b0000000010: n5822 = 1'b0;
      10'b0000000001: n5822 = 1'b1;
      default: n5822 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:88:13  */
  always @*
    case (n5763)
      10'b1000000000: n5832 = 1'b1;
      10'b0100000000: n5832 = 1'b1;
      10'b0010000000: n5832 = 1'b0;
      10'b0001000000: n5832 = 1'b1;
      10'b0000100000: n5832 = 1'b1;
      10'b0000010000: n5832 = 1'b1;
      10'b0000001000: n5832 = 1'b1;
      10'b0000000100: n5832 = 1'b1;
      10'b0000000010: n5832 = 1'b0;
      10'b0000000001: n5832 = 1'b0;
      default: n5832 = 1'b0;
    endcase
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:115:24  */
  assign n5835 = $signed(n5729) >= $signed(32'b00000000000000000000000000000000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:115:38  */
  assign n5837 = $signed(n5729) < $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:115:30  */
  assign n5838 = n5837 & n5835;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:116:24  */
  assign n5840 = $signed(n5724) >= $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:115:44  */
  assign n5841 = n5840 & n5838;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:116:39  */
  assign n5843 = $signed(n5724) < $signed(32'b00000000000000000000000000011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:116:31  */
  assign n5844 = n5843 & n5841;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:115:17  */
  assign n5847 = n5844 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:114:13  */
  assign n5849 = n5773 ? n5847 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:123:24  */
  assign n5851 = $signed(n5729) >= $signed(32'b00000000000000000000000000010010);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:123:49  */
  assign n5853 = $signed(n5729) < $signed(32'b00000000000000000000000000010110);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:123:41  */
  assign n5854 = n5853 & n5851;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:124:24  */
  assign n5856 = $signed(n5724) >= $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:123:65  */
  assign n5857 = n5856 & n5854;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:124:39  */
  assign n5859 = $signed(n5724) < $signed(32'b00000000000000000000000000011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:124:31  */
  assign n5860 = n5859 & n5857;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:122:13  */
  assign n5862 = n5863 ? 1'b1 : n5849;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:122:13  */
  assign n5863 = n5860 & n5832;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:131:24  */
  assign n5865 = $signed(n5729) >= $signed(32'b00000000000000000000000000100011);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:131:41  */
  assign n5867 = $signed(n5729) < $signed(32'b00000000000000000000000000101000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:131:33  */
  assign n5868 = n5867 & n5865;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:132:24  */
  assign n5870 = $signed(n5724) >= $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:131:46  */
  assign n5871 = n5870 & n5868;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:132:39  */
  assign n5873 = $signed(n5724) < $signed(32'b00000000000000000000000000011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:132:31  */
  assign n5874 = n5873 & n5871;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:130:13  */
  assign n5876 = n5877 ? 1'b1 : n5862;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:130:13  */
  assign n5877 = n5874 & n5806;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:139:24  */
  assign n5879 = $signed(n5724) >= $signed(32'b00000000000000000000000000000000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:139:38  */
  assign n5881 = $signed(n5724) < $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:139:30  */
  assign n5882 = n5881 & n5879;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:140:24  */
  assign n5884 = $signed(n5729) >= $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:139:44  */
  assign n5885 = n5884 & n5882;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:140:39  */
  assign n5887 = $signed(n5729) < $signed(32'b00000000000000000000000000010100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:140:31  */
  assign n5888 = n5887 & n5885;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:138:13  */
  assign n5890 = n5891 ? 1'b1 : n5876;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:138:13  */
  assign n5891 = n5888 & n5822;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:147:24  */
  assign n5893 = $signed(n5724) >= $signed(32'b00000000000000000000000000000000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:147:38  */
  assign n5895 = $signed(n5724) < $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:147:30  */
  assign n5896 = n5895 & n5893;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:148:24  */
  assign n5898 = $signed(n5729) >= $signed(32'b00000000000000000000000000010100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:147:44  */
  assign n5899 = n5898 & n5896;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:148:40  */
  assign n5901 = $signed(n5729) < $signed(32'b00000000000000000000000000100011);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:148:32  */
  assign n5902 = n5901 & n5899;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:146:13  */
  assign n5904 = n5905 ? 1'b1 : n5890;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:146:13  */
  assign n5905 = n5902 & n5813;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:155:24  */
  assign n5907 = $signed(n5724) >= $signed(32'b00000000000000000000000000011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:155:41  */
  assign n5909 = $signed(n5724) < $signed(32'b00000000000000000000000000011110);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:155:33  */
  assign n5910 = n5909 & n5907;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:156:24  */
  assign n5912 = $signed(n5729) >= $signed(32'b00000000000000000000000000000101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:155:46  */
  assign n5913 = n5912 & n5910;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:156:39  */
  assign n5915 = $signed(n5729) < $signed(32'b00000000000000000000000000010100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:156:31  */
  assign n5916 = n5915 & n5913;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:154:13  */
  assign n5918 = n5919 ? 1'b1 : n5904;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:154:13  */
  assign n5919 = n5916 & n5784;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:163:24  */
  assign n5921 = $signed(n5724) >= $signed(32'b00000000000000000000000000011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:163:41  */
  assign n5923 = $signed(n5724) < $signed(32'b00000000000000000000000000011110);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:163:33  */
  assign n5924 = n5923 & n5921;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:164:24  */
  assign n5926 = $signed(n5729) >= $signed(32'b00000000000000000000000000010100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:163:46  */
  assign n5927 = n5926 & n5924;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:164:40  */
  assign n5929 = $signed(n5729) < $signed(32'b00000000000000000000000000100011);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:164:32  */
  assign n5930 = n5929 & n5927;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:162:13  */
  assign n5932 = n5933 ? 1'b1 : n5918;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:162:13  */
  assign n5933 = n5930 & n5796;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:78:9  */
  assign n5935 = n5740 ? n5932 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:181:13  */
  assign n5952 = rst ? 1'b0 : pixel_on_comb;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:180:9  */
  always @(posedge clk)
    n5955 <= n5952;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:43:9  */
  always @(posedge clk)
    n5956 <= n5693;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:43:9  */
  always @(posedge clk)
    n5957 <= n5695;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:43:9  */
  always @(posedge clk)
    n5958 <= n5697;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:43:9  */
  always @(posedge clk)
    n5959 <= n5699;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/digit_renderer_ea.vhd:43:9  */
  always @(posedge clk)
    n5960 <= n5701;
endmodule

module bin2bcd
  (input  [15:0] binary_i,
   output [3:0] ones_o,
   output [3:0] tens_o,
   output [3:0] hundreds_o,
   output [3:0] thousands_o,
   output [3:0] tenthousands_o);
  localparam [19:0] n4677 = 20'b00000000000000000000;
  wire [3:0] n4678;
  wire n4680;
  localparam [19:0] n4681 = 20'b00000000000000000000;
  wire [3:0] n4682;
  wire [3:0] n4684;
  wire [3:0] n4686;
  localparam [19:0] n4687 = 20'b00000000000000000000;
  wire [15:0] n4688;
  wire [19:0] n4689;
  wire [3:0] n4690;
  wire n4692;
  wire [19:0] n4693;
  wire [3:0] n4694;
  wire [3:0] n4696;
  wire [3:0] n4697;
  wire [3:0] n4698;
  wire [11:0] n4699;
  wire [19:0] n4700;
  wire [3:0] n4701;
  wire n4703;
  wire [19:0] n4704;
  wire [3:0] n4705;
  wire [3:0] n4707;
  wire [3:0] n4708;
  wire [3:0] n4709;
  wire [7:0] n4710;
  wire [19:0] n4711;
  wire [3:0] n4712;
  wire n4714;
  wire [19:0] n4715;
  wire [3:0] n4716;
  wire [3:0] n4718;
  wire [3:0] n4719;
  wire [3:0] n4720;
  wire [3:0] n4721;
  wire [19:0] n4722;
  wire [3:0] n4723;
  wire n4725;
  wire [19:0] n4726;
  wire [3:0] n4727;
  wire [3:0] n4729;
  wire [3:0] n4730;
  wire [19:0] n4731;
  wire [18:0] n4732;
  wire n4733;
  wire [19:0] n4734;
  wire [14:0] n4735;
  wire [15:0] n4737;
  wire [3:0] n4743;
  wire n4745;
  wire [3:0] n4746;
  wire [3:0] n4748;
  wire [3:0] n4749;
  wire [3:0] n4750;
  wire [15:0] n4751;
  wire [19:0] n4752;
  wire [3:0] n4753;
  wire n4755;
  wire [19:0] n4756;
  wire [3:0] n4757;
  wire [3:0] n4759;
  wire [3:0] n4760;
  wire [3:0] n4761;
  wire [11:0] n4762;
  wire [19:0] n4763;
  wire [3:0] n4764;
  wire n4766;
  wire [19:0] n4767;
  wire [3:0] n4768;
  wire [3:0] n4770;
  wire [3:0] n4771;
  wire [3:0] n4772;
  wire [7:0] n4773;
  wire [19:0] n4774;
  wire [3:0] n4775;
  wire n4777;
  wire [19:0] n4778;
  wire [3:0] n4779;
  wire [3:0] n4781;
  wire [3:0] n4782;
  wire [3:0] n4783;
  wire [3:0] n4784;
  wire [19:0] n4785;
  wire [3:0] n4786;
  wire n4788;
  wire [19:0] n4789;
  wire [3:0] n4790;
  wire [3:0] n4792;
  wire [3:0] n4793;
  wire [19:0] n4794;
  wire [18:0] n4795;
  wire n4796;
  wire [19:0] n4797;
  wire [14:0] n4798;
  wire [15:0] n4800;
  wire [3:0] n4806;
  wire n4808;
  wire [3:0] n4809;
  wire [3:0] n4811;
  wire [3:0] n4812;
  wire [3:0] n4813;
  wire [15:0] n4814;
  wire [19:0] n4815;
  wire [3:0] n4816;
  wire n4818;
  wire [19:0] n4819;
  wire [3:0] n4820;
  wire [3:0] n4822;
  wire [3:0] n4823;
  wire [3:0] n4824;
  wire [11:0] n4825;
  wire [19:0] n4826;
  wire [3:0] n4827;
  wire n4829;
  wire [19:0] n4830;
  wire [3:0] n4831;
  wire [3:0] n4833;
  wire [3:0] n4834;
  wire [3:0] n4835;
  wire [7:0] n4836;
  wire [19:0] n4837;
  wire [3:0] n4838;
  wire n4840;
  wire [19:0] n4841;
  wire [3:0] n4842;
  wire [3:0] n4844;
  wire [3:0] n4845;
  wire [3:0] n4846;
  wire [3:0] n4847;
  wire [19:0] n4848;
  wire [3:0] n4849;
  wire n4851;
  wire [19:0] n4852;
  wire [3:0] n4853;
  wire [3:0] n4855;
  wire [3:0] n4856;
  wire [19:0] n4857;
  wire [18:0] n4858;
  wire n4859;
  wire [19:0] n4860;
  wire [14:0] n4861;
  wire [15:0] n4863;
  wire [3:0] n4869;
  wire n4871;
  wire [3:0] n4872;
  wire [3:0] n4874;
  wire [3:0] n4875;
  wire [3:0] n4876;
  wire [15:0] n4877;
  wire [19:0] n4878;
  wire [3:0] n4879;
  wire n4881;
  wire [19:0] n4882;
  wire [3:0] n4883;
  wire [3:0] n4885;
  wire [3:0] n4886;
  wire [3:0] n4887;
  wire [11:0] n4888;
  wire [19:0] n4889;
  wire [3:0] n4890;
  wire n4892;
  wire [19:0] n4893;
  wire [3:0] n4894;
  wire [3:0] n4896;
  wire [3:0] n4897;
  wire [3:0] n4898;
  wire [7:0] n4899;
  wire [19:0] n4900;
  wire [3:0] n4901;
  wire n4903;
  wire [19:0] n4904;
  wire [3:0] n4905;
  wire [3:0] n4907;
  wire [3:0] n4908;
  wire [3:0] n4909;
  wire [3:0] n4910;
  wire [19:0] n4911;
  wire [3:0] n4912;
  wire n4914;
  wire [19:0] n4915;
  wire [3:0] n4916;
  wire [3:0] n4918;
  wire [3:0] n4919;
  wire [19:0] n4920;
  wire [18:0] n4921;
  wire n4922;
  wire [19:0] n4923;
  wire [14:0] n4924;
  wire [15:0] n4926;
  wire [3:0] n4932;
  wire n4934;
  wire [3:0] n4935;
  wire [3:0] n4937;
  wire [3:0] n4938;
  wire [3:0] n4939;
  wire [15:0] n4940;
  wire [19:0] n4941;
  wire [3:0] n4942;
  wire n4944;
  wire [19:0] n4945;
  wire [3:0] n4946;
  wire [3:0] n4948;
  wire [3:0] n4949;
  wire [3:0] n4950;
  wire [11:0] n4951;
  wire [19:0] n4952;
  wire [3:0] n4953;
  wire n4955;
  wire [19:0] n4956;
  wire [3:0] n4957;
  wire [3:0] n4959;
  wire [3:0] n4960;
  wire [3:0] n4961;
  wire [7:0] n4962;
  wire [19:0] n4963;
  wire [3:0] n4964;
  wire n4966;
  wire [19:0] n4967;
  wire [3:0] n4968;
  wire [3:0] n4970;
  wire [3:0] n4971;
  wire [3:0] n4972;
  wire [3:0] n4973;
  wire [19:0] n4974;
  wire [3:0] n4975;
  wire n4977;
  wire [19:0] n4978;
  wire [3:0] n4979;
  wire [3:0] n4981;
  wire [3:0] n4982;
  wire [19:0] n4983;
  wire [18:0] n4984;
  wire n4985;
  wire [19:0] n4986;
  wire [14:0] n4987;
  wire [15:0] n4989;
  wire [3:0] n4995;
  wire n4997;
  wire [3:0] n4998;
  wire [3:0] n5000;
  wire [3:0] n5001;
  wire [3:0] n5002;
  wire [15:0] n5003;
  wire [19:0] n5004;
  wire [3:0] n5005;
  wire n5007;
  wire [19:0] n5008;
  wire [3:0] n5009;
  wire [3:0] n5011;
  wire [3:0] n5012;
  wire [3:0] n5013;
  wire [11:0] n5014;
  wire [19:0] n5015;
  wire [3:0] n5016;
  wire n5018;
  wire [19:0] n5019;
  wire [3:0] n5020;
  wire [3:0] n5022;
  wire [3:0] n5023;
  wire [3:0] n5024;
  wire [7:0] n5025;
  wire [19:0] n5026;
  wire [3:0] n5027;
  wire n5029;
  wire [19:0] n5030;
  wire [3:0] n5031;
  wire [3:0] n5033;
  wire [3:0] n5034;
  wire [3:0] n5035;
  wire [3:0] n5036;
  wire [19:0] n5037;
  wire [3:0] n5038;
  wire n5040;
  wire [19:0] n5041;
  wire [3:0] n5042;
  wire [3:0] n5044;
  wire [3:0] n5045;
  wire [19:0] n5046;
  wire [18:0] n5047;
  wire n5048;
  wire [19:0] n5049;
  wire [14:0] n5050;
  wire [15:0] n5052;
  wire [3:0] n5058;
  wire n5060;
  wire [3:0] n5061;
  wire [3:0] n5063;
  wire [3:0] n5064;
  wire [3:0] n5065;
  wire [15:0] n5066;
  wire [19:0] n5067;
  wire [3:0] n5068;
  wire n5070;
  wire [19:0] n5071;
  wire [3:0] n5072;
  wire [3:0] n5074;
  wire [3:0] n5075;
  wire [3:0] n5076;
  wire [11:0] n5077;
  wire [19:0] n5078;
  wire [3:0] n5079;
  wire n5081;
  wire [19:0] n5082;
  wire [3:0] n5083;
  wire [3:0] n5085;
  wire [3:0] n5086;
  wire [3:0] n5087;
  wire [7:0] n5088;
  wire [19:0] n5089;
  wire [3:0] n5090;
  wire n5092;
  wire [19:0] n5093;
  wire [3:0] n5094;
  wire [3:0] n5096;
  wire [3:0] n5097;
  wire [3:0] n5098;
  wire [3:0] n5099;
  wire [19:0] n5100;
  wire [3:0] n5101;
  wire n5103;
  wire [19:0] n5104;
  wire [3:0] n5105;
  wire [3:0] n5107;
  wire [3:0] n5108;
  wire [19:0] n5109;
  wire [18:0] n5110;
  wire n5111;
  wire [19:0] n5112;
  wire [14:0] n5113;
  wire [15:0] n5115;
  wire [3:0] n5121;
  wire n5123;
  wire [3:0] n5124;
  wire [3:0] n5126;
  wire [3:0] n5127;
  wire [3:0] n5128;
  wire [15:0] n5129;
  wire [19:0] n5130;
  wire [3:0] n5131;
  wire n5133;
  wire [19:0] n5134;
  wire [3:0] n5135;
  wire [3:0] n5137;
  wire [3:0] n5138;
  wire [3:0] n5139;
  wire [11:0] n5140;
  wire [19:0] n5141;
  wire [3:0] n5142;
  wire n5144;
  wire [19:0] n5145;
  wire [3:0] n5146;
  wire [3:0] n5148;
  wire [3:0] n5149;
  wire [3:0] n5150;
  wire [7:0] n5151;
  wire [19:0] n5152;
  wire [3:0] n5153;
  wire n5155;
  wire [19:0] n5156;
  wire [3:0] n5157;
  wire [3:0] n5159;
  wire [3:0] n5160;
  wire [3:0] n5161;
  wire [3:0] n5162;
  wire [19:0] n5163;
  wire [3:0] n5164;
  wire n5166;
  wire [19:0] n5167;
  wire [3:0] n5168;
  wire [3:0] n5170;
  wire [3:0] n5171;
  wire [19:0] n5172;
  wire [18:0] n5173;
  wire n5174;
  wire [19:0] n5175;
  wire [14:0] n5176;
  wire [15:0] n5178;
  wire [3:0] n5184;
  wire n5186;
  wire [3:0] n5187;
  wire [3:0] n5189;
  wire [3:0] n5190;
  wire [3:0] n5191;
  wire [15:0] n5192;
  wire [19:0] n5193;
  wire [3:0] n5194;
  wire n5196;
  wire [19:0] n5197;
  wire [3:0] n5198;
  wire [3:0] n5200;
  wire [3:0] n5201;
  wire [3:0] n5202;
  wire [11:0] n5203;
  wire [19:0] n5204;
  wire [3:0] n5205;
  wire n5207;
  wire [19:0] n5208;
  wire [3:0] n5209;
  wire [3:0] n5211;
  wire [3:0] n5212;
  wire [3:0] n5213;
  wire [7:0] n5214;
  wire [19:0] n5215;
  wire [3:0] n5216;
  wire n5218;
  wire [19:0] n5219;
  wire [3:0] n5220;
  wire [3:0] n5222;
  wire [3:0] n5223;
  wire [3:0] n5224;
  wire [3:0] n5225;
  wire [19:0] n5226;
  wire [3:0] n5227;
  wire n5229;
  wire [19:0] n5230;
  wire [3:0] n5231;
  wire [3:0] n5233;
  wire [3:0] n5234;
  wire [19:0] n5235;
  wire [18:0] n5236;
  wire n5237;
  wire [19:0] n5238;
  wire [14:0] n5239;
  wire [15:0] n5241;
  wire [3:0] n5247;
  wire n5249;
  wire [3:0] n5250;
  wire [3:0] n5252;
  wire [3:0] n5253;
  wire [3:0] n5254;
  wire [15:0] n5255;
  wire [19:0] n5256;
  wire [3:0] n5257;
  wire n5259;
  wire [19:0] n5260;
  wire [3:0] n5261;
  wire [3:0] n5263;
  wire [3:0] n5264;
  wire [3:0] n5265;
  wire [11:0] n5266;
  wire [19:0] n5267;
  wire [3:0] n5268;
  wire n5270;
  wire [19:0] n5271;
  wire [3:0] n5272;
  wire [3:0] n5274;
  wire [3:0] n5275;
  wire [3:0] n5276;
  wire [7:0] n5277;
  wire [19:0] n5278;
  wire [3:0] n5279;
  wire n5281;
  wire [19:0] n5282;
  wire [3:0] n5283;
  wire [3:0] n5285;
  wire [3:0] n5286;
  wire [3:0] n5287;
  wire [3:0] n5288;
  wire [19:0] n5289;
  wire [3:0] n5290;
  wire n5292;
  wire [19:0] n5293;
  wire [3:0] n5294;
  wire [3:0] n5296;
  wire [3:0] n5297;
  wire [19:0] n5298;
  wire [18:0] n5299;
  wire n5300;
  wire [19:0] n5301;
  wire [14:0] n5302;
  wire [15:0] n5304;
  wire [3:0] n5310;
  wire n5312;
  wire [3:0] n5313;
  wire [3:0] n5315;
  wire [3:0] n5316;
  wire [3:0] n5317;
  wire [15:0] n5318;
  wire [19:0] n5319;
  wire [3:0] n5320;
  wire n5322;
  wire [19:0] n5323;
  wire [3:0] n5324;
  wire [3:0] n5326;
  wire [3:0] n5327;
  wire [3:0] n5328;
  wire [11:0] n5329;
  wire [19:0] n5330;
  wire [3:0] n5331;
  wire n5333;
  wire [19:0] n5334;
  wire [3:0] n5335;
  wire [3:0] n5337;
  wire [3:0] n5338;
  wire [3:0] n5339;
  wire [7:0] n5340;
  wire [19:0] n5341;
  wire [3:0] n5342;
  wire n5344;
  wire [19:0] n5345;
  wire [3:0] n5346;
  wire [3:0] n5348;
  wire [3:0] n5349;
  wire [3:0] n5350;
  wire [3:0] n5351;
  wire [19:0] n5352;
  wire [3:0] n5353;
  wire n5355;
  wire [19:0] n5356;
  wire [3:0] n5357;
  wire [3:0] n5359;
  wire [3:0] n5360;
  wire [19:0] n5361;
  wire [18:0] n5362;
  wire n5363;
  wire [19:0] n5364;
  wire [14:0] n5365;
  wire [15:0] n5367;
  wire [3:0] n5373;
  wire n5375;
  wire [3:0] n5376;
  wire [3:0] n5378;
  wire [3:0] n5379;
  wire [3:0] n5380;
  wire [15:0] n5381;
  wire [19:0] n5382;
  wire [3:0] n5383;
  wire n5385;
  wire [19:0] n5386;
  wire [3:0] n5387;
  wire [3:0] n5389;
  wire [3:0] n5390;
  wire [3:0] n5391;
  wire [11:0] n5392;
  wire [19:0] n5393;
  wire [3:0] n5394;
  wire n5396;
  wire [19:0] n5397;
  wire [3:0] n5398;
  wire [3:0] n5400;
  wire [3:0] n5401;
  wire [3:0] n5402;
  wire [7:0] n5403;
  wire [19:0] n5404;
  wire [3:0] n5405;
  wire n5407;
  wire [19:0] n5408;
  wire [3:0] n5409;
  wire [3:0] n5411;
  wire [3:0] n5412;
  wire [3:0] n5413;
  wire [3:0] n5414;
  wire [19:0] n5415;
  wire [3:0] n5416;
  wire n5418;
  wire [19:0] n5419;
  wire [3:0] n5420;
  wire [3:0] n5422;
  wire [3:0] n5423;
  wire [19:0] n5424;
  wire [18:0] n5425;
  wire n5426;
  wire [19:0] n5427;
  wire [14:0] n5428;
  wire [15:0] n5430;
  wire [3:0] n5436;
  wire n5438;
  wire [3:0] n5439;
  wire [3:0] n5441;
  wire [3:0] n5442;
  wire [3:0] n5443;
  wire [15:0] n5444;
  wire [19:0] n5445;
  wire [3:0] n5446;
  wire n5448;
  wire [19:0] n5449;
  wire [3:0] n5450;
  wire [3:0] n5452;
  wire [3:0] n5453;
  wire [3:0] n5454;
  wire [11:0] n5455;
  wire [19:0] n5456;
  wire [3:0] n5457;
  wire n5459;
  wire [19:0] n5460;
  wire [3:0] n5461;
  wire [3:0] n5463;
  wire [3:0] n5464;
  wire [3:0] n5465;
  wire [7:0] n5466;
  wire [19:0] n5467;
  wire [3:0] n5468;
  wire n5470;
  wire [19:0] n5471;
  wire [3:0] n5472;
  wire [3:0] n5474;
  wire [3:0] n5475;
  wire [3:0] n5476;
  wire [3:0] n5477;
  wire [19:0] n5478;
  wire [3:0] n5479;
  wire n5481;
  wire [19:0] n5482;
  wire [3:0] n5483;
  wire [3:0] n5485;
  wire [3:0] n5486;
  wire [19:0] n5487;
  wire [18:0] n5488;
  wire n5489;
  wire [19:0] n5490;
  wire [14:0] n5491;
  wire [15:0] n5493;
  wire [3:0] n5499;
  wire n5501;
  wire [3:0] n5502;
  wire [3:0] n5504;
  wire [3:0] n5505;
  wire [3:0] n5506;
  wire [15:0] n5507;
  wire [19:0] n5508;
  wire [3:0] n5509;
  wire n5511;
  wire [19:0] n5512;
  wire [3:0] n5513;
  wire [3:0] n5515;
  wire [3:0] n5516;
  wire [3:0] n5517;
  wire [11:0] n5518;
  wire [19:0] n5519;
  wire [3:0] n5520;
  wire n5522;
  wire [19:0] n5523;
  wire [3:0] n5524;
  wire [3:0] n5526;
  wire [3:0] n5527;
  wire [3:0] n5528;
  wire [7:0] n5529;
  wire [19:0] n5530;
  wire [3:0] n5531;
  wire n5533;
  wire [19:0] n5534;
  wire [3:0] n5535;
  wire [3:0] n5537;
  wire [3:0] n5538;
  wire [3:0] n5539;
  wire [3:0] n5540;
  wire [19:0] n5541;
  wire [3:0] n5542;
  wire n5544;
  wire [19:0] n5545;
  wire [3:0] n5546;
  wire [3:0] n5548;
  wire [3:0] n5549;
  wire [19:0] n5550;
  wire [18:0] n5551;
  wire n5552;
  wire [19:0] n5553;
  wire [14:0] n5554;
  wire [15:0] n5556;
  wire [3:0] n5562;
  wire n5564;
  wire [3:0] n5565;
  wire [3:0] n5567;
  wire [3:0] n5568;
  wire [3:0] n5569;
  wire [15:0] n5570;
  wire [19:0] n5571;
  wire [3:0] n5572;
  wire n5574;
  wire [19:0] n5575;
  wire [3:0] n5576;
  wire [3:0] n5578;
  wire [3:0] n5579;
  wire [3:0] n5580;
  wire [11:0] n5581;
  wire [19:0] n5582;
  wire [3:0] n5583;
  wire n5585;
  wire [19:0] n5586;
  wire [3:0] n5587;
  wire [3:0] n5589;
  wire [3:0] n5590;
  wire [3:0] n5591;
  wire [7:0] n5592;
  wire [19:0] n5593;
  wire [3:0] n5594;
  wire n5596;
  wire [19:0] n5597;
  wire [3:0] n5598;
  wire [3:0] n5600;
  wire [3:0] n5601;
  wire [3:0] n5602;
  wire [3:0] n5603;
  wire [19:0] n5604;
  wire [3:0] n5605;
  wire n5607;
  wire [19:0] n5608;
  wire [3:0] n5609;
  wire [3:0] n5611;
  wire [3:0] n5612;
  wire [19:0] n5613;
  wire [18:0] n5614;
  wire n5615;
  wire [19:0] n5616;
  wire [14:0] n5617;
  wire [15:0] n5619;
  wire [3:0] n5625;
  wire n5627;
  wire [3:0] n5628;
  wire [3:0] n5630;
  wire [3:0] n5631;
  wire [3:0] n5632;
  wire [15:0] n5633;
  wire [19:0] n5634;
  wire [3:0] n5635;
  wire n5637;
  wire [19:0] n5638;
  wire [3:0] n5639;
  wire [3:0] n5641;
  wire [3:0] n5642;
  wire [3:0] n5643;
  wire [11:0] n5644;
  wire [19:0] n5645;
  wire [3:0] n5646;
  wire n5648;
  wire [19:0] n5649;
  wire [3:0] n5650;
  wire [3:0] n5652;
  wire [3:0] n5653;
  wire [3:0] n5654;
  wire [7:0] n5655;
  wire [19:0] n5656;
  wire [3:0] n5657;
  wire n5659;
  wire [19:0] n5660;
  wire [3:0] n5661;
  wire [3:0] n5663;
  wire [3:0] n5664;
  wire [3:0] n5665;
  wire [3:0] n5666;
  wire [19:0] n5667;
  wire [3:0] n5668;
  wire n5670;
  wire [19:0] n5671;
  wire [3:0] n5672;
  wire [3:0] n5674;
  wire [3:0] n5675;
  wire [19:0] n5676;
  wire [18:0] n5677;
  wire n5678;
  wire [19:0] n5679;
  wire [3:0] n5683;
  wire [3:0] n5684;
  wire [3:0] n5685;
  wire [3:0] n5686;
  wire [3:0] n5687;
  assign ones_o = n5683; //(module output)
  assign tens_o = n5684; //(module output)
  assign hundreds_o = n5685; //(module output)
  assign thousands_o = n5686; //(module output)
  assign tenthousands_o = n5687; //(module output)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4678 = n4677[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4680 = $unsigned(n4678) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4682 = n4681[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n4684 = n4682 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n4686 = n4680 ? n4684 : 4'b0000;
  assign n4688 = n4687[19:4]; // extract
  assign n4689 = {n4688, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n4690 = n4689[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n4692 = $unsigned(n4690) > $unsigned(4'b0100);
  assign n4693 = {n4688, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n4694 = n4693[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n4696 = n4694 + 4'b0011;
  assign n4697 = n4687[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n4698 = n4692 ? n4696 : n4697;
  assign n4699 = n4687[19:8]; // extract
  assign n4700 = {n4699, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n4701 = n4700[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n4703 = $unsigned(n4701) > $unsigned(4'b0100);
  assign n4704 = {n4699, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n4705 = n4704[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n4707 = n4705 + 4'b0011;
  assign n4708 = n4687[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n4709 = n4703 ? n4707 : n4708;
  assign n4710 = n4687[19:12]; // extract
  assign n4711 = {n4710, n4709, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n4712 = n4711[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n4714 = $unsigned(n4712) > $unsigned(4'b0100);
  assign n4715 = {n4710, n4709, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n4716 = n4715[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n4718 = n4716 + 4'b0011;
  assign n4719 = n4687[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n4720 = n4714 ? n4718 : n4719;
  assign n4721 = n4687[19:16]; // extract
  assign n4722 = {n4721, n4720, n4709, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n4723 = n4722[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n4725 = $unsigned(n4723) > $unsigned(4'b0100);
  assign n4726 = {n4721, n4720, n4709, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n4727 = n4726[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n4729 = n4727 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n4730 = n4725 ? n4729 : n4721;
  assign n4731 = {n4730, n4720, n4709, n4698, n4686};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n4732 = n4731[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n4733 = binary_i[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n4734 = {n4732, n4733};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n4735 = binary_i[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n4737 = {n4735, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4743 = n4734[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4745 = $unsigned(n4743) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4746 = n4734[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n4748 = n4746 + 4'b0011;
  assign n4749 = n4734[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n4750 = n4745 ? n4748 : n4749;
  assign n4751 = n4734[19:4]; // extract
  assign n4752 = {n4751, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n4753 = n4752[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n4755 = $unsigned(n4753) > $unsigned(4'b0100);
  assign n4756 = {n4751, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n4757 = n4756[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n4759 = n4757 + 4'b0011;
  assign n4760 = n4734[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n4761 = n4755 ? n4759 : n4760;
  assign n4762 = n4734[19:8]; // extract
  assign n4763 = {n4762, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n4764 = n4763[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n4766 = $unsigned(n4764) > $unsigned(4'b0100);
  assign n4767 = {n4762, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n4768 = n4767[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n4770 = n4768 + 4'b0011;
  assign n4771 = n4734[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n4772 = n4766 ? n4770 : n4771;
  assign n4773 = n4734[19:12]; // extract
  assign n4774 = {n4773, n4772, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n4775 = n4774[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n4777 = $unsigned(n4775) > $unsigned(4'b0100);
  assign n4778 = {n4773, n4772, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n4779 = n4778[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n4781 = n4779 + 4'b0011;
  assign n4782 = n4734[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n4783 = n4777 ? n4781 : n4782;
  assign n4784 = n4734[19:16]; // extract
  assign n4785 = {n4784, n4783, n4772, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n4786 = n4785[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n4788 = $unsigned(n4786) > $unsigned(4'b0100);
  assign n4789 = {n4784, n4783, n4772, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n4790 = n4789[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n4792 = n4790 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n4793 = n4788 ? n4792 : n4784;
  assign n4794 = {n4793, n4783, n4772, n4761, n4750};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n4795 = n4794[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n4796 = n4737[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n4797 = {n4795, n4796};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n4798 = n4737[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n4800 = {n4798, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4806 = n4797[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4808 = $unsigned(n4806) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4809 = n4797[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n4811 = n4809 + 4'b0011;
  assign n4812 = n4797[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n4813 = n4808 ? n4811 : n4812;
  assign n4814 = n4797[19:4]; // extract
  assign n4815 = {n4814, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n4816 = n4815[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n4818 = $unsigned(n4816) > $unsigned(4'b0100);
  assign n4819 = {n4814, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n4820 = n4819[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n4822 = n4820 + 4'b0011;
  assign n4823 = n4797[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n4824 = n4818 ? n4822 : n4823;
  assign n4825 = n4797[19:8]; // extract
  assign n4826 = {n4825, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n4827 = n4826[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n4829 = $unsigned(n4827) > $unsigned(4'b0100);
  assign n4830 = {n4825, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n4831 = n4830[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n4833 = n4831 + 4'b0011;
  assign n4834 = n4797[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n4835 = n4829 ? n4833 : n4834;
  assign n4836 = n4797[19:12]; // extract
  assign n4837 = {n4836, n4835, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n4838 = n4837[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n4840 = $unsigned(n4838) > $unsigned(4'b0100);
  assign n4841 = {n4836, n4835, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n4842 = n4841[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n4844 = n4842 + 4'b0011;
  assign n4845 = n4797[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n4846 = n4840 ? n4844 : n4845;
  assign n4847 = n4797[19:16]; // extract
  assign n4848 = {n4847, n4846, n4835, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n4849 = n4848[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n4851 = $unsigned(n4849) > $unsigned(4'b0100);
  assign n4852 = {n4847, n4846, n4835, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n4853 = n4852[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n4855 = n4853 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n4856 = n4851 ? n4855 : n4847;
  assign n4857 = {n4856, n4846, n4835, n4824, n4813};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n4858 = n4857[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n4859 = n4800[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n4860 = {n4858, n4859};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n4861 = n4800[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n4863 = {n4861, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4869 = n4860[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4871 = $unsigned(n4869) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4872 = n4860[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n4874 = n4872 + 4'b0011;
  assign n4875 = n4860[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n4876 = n4871 ? n4874 : n4875;
  assign n4877 = n4860[19:4]; // extract
  assign n4878 = {n4877, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n4879 = n4878[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n4881 = $unsigned(n4879) > $unsigned(4'b0100);
  assign n4882 = {n4877, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n4883 = n4882[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n4885 = n4883 + 4'b0011;
  assign n4886 = n4860[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n4887 = n4881 ? n4885 : n4886;
  assign n4888 = n4860[19:8]; // extract
  assign n4889 = {n4888, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n4890 = n4889[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n4892 = $unsigned(n4890) > $unsigned(4'b0100);
  assign n4893 = {n4888, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n4894 = n4893[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n4896 = n4894 + 4'b0011;
  assign n4897 = n4860[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n4898 = n4892 ? n4896 : n4897;
  assign n4899 = n4860[19:12]; // extract
  assign n4900 = {n4899, n4898, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n4901 = n4900[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n4903 = $unsigned(n4901) > $unsigned(4'b0100);
  assign n4904 = {n4899, n4898, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n4905 = n4904[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n4907 = n4905 + 4'b0011;
  assign n4908 = n4860[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n4909 = n4903 ? n4907 : n4908;
  assign n4910 = n4860[19:16]; // extract
  assign n4911 = {n4910, n4909, n4898, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n4912 = n4911[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n4914 = $unsigned(n4912) > $unsigned(4'b0100);
  assign n4915 = {n4910, n4909, n4898, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n4916 = n4915[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n4918 = n4916 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n4919 = n4914 ? n4918 : n4910;
  assign n4920 = {n4919, n4909, n4898, n4887, n4876};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n4921 = n4920[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n4922 = n4863[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n4923 = {n4921, n4922};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n4924 = n4863[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n4926 = {n4924, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4932 = n4923[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4934 = $unsigned(n4932) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4935 = n4923[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n4937 = n4935 + 4'b0011;
  assign n4938 = n4923[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n4939 = n4934 ? n4937 : n4938;
  assign n4940 = n4923[19:4]; // extract
  assign n4941 = {n4940, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n4942 = n4941[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n4944 = $unsigned(n4942) > $unsigned(4'b0100);
  assign n4945 = {n4940, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n4946 = n4945[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n4948 = n4946 + 4'b0011;
  assign n4949 = n4923[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n4950 = n4944 ? n4948 : n4949;
  assign n4951 = n4923[19:8]; // extract
  assign n4952 = {n4951, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n4953 = n4952[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n4955 = $unsigned(n4953) > $unsigned(4'b0100);
  assign n4956 = {n4951, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n4957 = n4956[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n4959 = n4957 + 4'b0011;
  assign n4960 = n4923[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n4961 = n4955 ? n4959 : n4960;
  assign n4962 = n4923[19:12]; // extract
  assign n4963 = {n4962, n4961, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n4964 = n4963[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n4966 = $unsigned(n4964) > $unsigned(4'b0100);
  assign n4967 = {n4962, n4961, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n4968 = n4967[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n4970 = n4968 + 4'b0011;
  assign n4971 = n4923[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n4972 = n4966 ? n4970 : n4971;
  assign n4973 = n4923[19:16]; // extract
  assign n4974 = {n4973, n4972, n4961, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n4975 = n4974[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n4977 = $unsigned(n4975) > $unsigned(4'b0100);
  assign n4978 = {n4973, n4972, n4961, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n4979 = n4978[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n4981 = n4979 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n4982 = n4977 ? n4981 : n4973;
  assign n4983 = {n4982, n4972, n4961, n4950, n4939};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n4984 = n4983[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n4985 = n4926[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n4986 = {n4984, n4985};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n4987 = n4926[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n4989 = {n4987, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n4995 = n4986[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n4997 = $unsigned(n4995) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n4998 = n4986[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5000 = n4998 + 4'b0011;
  assign n5001 = n4986[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5002 = n4997 ? n5000 : n5001;
  assign n5003 = n4986[19:4]; // extract
  assign n5004 = {n5003, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5005 = n5004[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5007 = $unsigned(n5005) > $unsigned(4'b0100);
  assign n5008 = {n5003, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5009 = n5008[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5011 = n5009 + 4'b0011;
  assign n5012 = n4986[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5013 = n5007 ? n5011 : n5012;
  assign n5014 = n4986[19:8]; // extract
  assign n5015 = {n5014, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5016 = n5015[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5018 = $unsigned(n5016) > $unsigned(4'b0100);
  assign n5019 = {n5014, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5020 = n5019[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5022 = n5020 + 4'b0011;
  assign n5023 = n4986[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5024 = n5018 ? n5022 : n5023;
  assign n5025 = n4986[19:12]; // extract
  assign n5026 = {n5025, n5024, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5027 = n5026[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5029 = $unsigned(n5027) > $unsigned(4'b0100);
  assign n5030 = {n5025, n5024, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5031 = n5030[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5033 = n5031 + 4'b0011;
  assign n5034 = n4986[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5035 = n5029 ? n5033 : n5034;
  assign n5036 = n4986[19:16]; // extract
  assign n5037 = {n5036, n5035, n5024, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5038 = n5037[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5040 = $unsigned(n5038) > $unsigned(4'b0100);
  assign n5041 = {n5036, n5035, n5024, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5042 = n5041[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5044 = n5042 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5045 = n5040 ? n5044 : n5036;
  assign n5046 = {n5045, n5035, n5024, n5013, n5002};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5047 = n5046[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5048 = n4989[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5049 = {n5047, n5048};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5050 = n4989[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5052 = {n5050, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5058 = n5049[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5060 = $unsigned(n5058) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5061 = n5049[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5063 = n5061 + 4'b0011;
  assign n5064 = n5049[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5065 = n5060 ? n5063 : n5064;
  assign n5066 = n5049[19:4]; // extract
  assign n5067 = {n5066, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5068 = n5067[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5070 = $unsigned(n5068) > $unsigned(4'b0100);
  assign n5071 = {n5066, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5072 = n5071[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5074 = n5072 + 4'b0011;
  assign n5075 = n5049[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5076 = n5070 ? n5074 : n5075;
  assign n5077 = n5049[19:8]; // extract
  assign n5078 = {n5077, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5079 = n5078[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5081 = $unsigned(n5079) > $unsigned(4'b0100);
  assign n5082 = {n5077, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5083 = n5082[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5085 = n5083 + 4'b0011;
  assign n5086 = n5049[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5087 = n5081 ? n5085 : n5086;
  assign n5088 = n5049[19:12]; // extract
  assign n5089 = {n5088, n5087, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5090 = n5089[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5092 = $unsigned(n5090) > $unsigned(4'b0100);
  assign n5093 = {n5088, n5087, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5094 = n5093[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5096 = n5094 + 4'b0011;
  assign n5097 = n5049[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5098 = n5092 ? n5096 : n5097;
  assign n5099 = n5049[19:16]; // extract
  assign n5100 = {n5099, n5098, n5087, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5101 = n5100[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5103 = $unsigned(n5101) > $unsigned(4'b0100);
  assign n5104 = {n5099, n5098, n5087, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5105 = n5104[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5107 = n5105 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5108 = n5103 ? n5107 : n5099;
  assign n5109 = {n5108, n5098, n5087, n5076, n5065};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5110 = n5109[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5111 = n5052[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5112 = {n5110, n5111};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5113 = n5052[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5115 = {n5113, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5121 = n5112[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5123 = $unsigned(n5121) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5124 = n5112[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5126 = n5124 + 4'b0011;
  assign n5127 = n5112[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5128 = n5123 ? n5126 : n5127;
  assign n5129 = n5112[19:4]; // extract
  assign n5130 = {n5129, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5131 = n5130[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5133 = $unsigned(n5131) > $unsigned(4'b0100);
  assign n5134 = {n5129, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5135 = n5134[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5137 = n5135 + 4'b0011;
  assign n5138 = n5112[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5139 = n5133 ? n5137 : n5138;
  assign n5140 = n5112[19:8]; // extract
  assign n5141 = {n5140, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5142 = n5141[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5144 = $unsigned(n5142) > $unsigned(4'b0100);
  assign n5145 = {n5140, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5146 = n5145[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5148 = n5146 + 4'b0011;
  assign n5149 = n5112[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5150 = n5144 ? n5148 : n5149;
  assign n5151 = n5112[19:12]; // extract
  assign n5152 = {n5151, n5150, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5153 = n5152[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5155 = $unsigned(n5153) > $unsigned(4'b0100);
  assign n5156 = {n5151, n5150, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5157 = n5156[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5159 = n5157 + 4'b0011;
  assign n5160 = n5112[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5161 = n5155 ? n5159 : n5160;
  assign n5162 = n5112[19:16]; // extract
  assign n5163 = {n5162, n5161, n5150, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5164 = n5163[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5166 = $unsigned(n5164) > $unsigned(4'b0100);
  assign n5167 = {n5162, n5161, n5150, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5168 = n5167[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5170 = n5168 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5171 = n5166 ? n5170 : n5162;
  assign n5172 = {n5171, n5161, n5150, n5139, n5128};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5173 = n5172[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5174 = n5115[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5175 = {n5173, n5174};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5176 = n5115[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5178 = {n5176, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5184 = n5175[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5186 = $unsigned(n5184) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5187 = n5175[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5189 = n5187 + 4'b0011;
  assign n5190 = n5175[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5191 = n5186 ? n5189 : n5190;
  assign n5192 = n5175[19:4]; // extract
  assign n5193 = {n5192, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5194 = n5193[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5196 = $unsigned(n5194) > $unsigned(4'b0100);
  assign n5197 = {n5192, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5198 = n5197[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5200 = n5198 + 4'b0011;
  assign n5201 = n5175[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5202 = n5196 ? n5200 : n5201;
  assign n5203 = n5175[19:8]; // extract
  assign n5204 = {n5203, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5205 = n5204[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5207 = $unsigned(n5205) > $unsigned(4'b0100);
  assign n5208 = {n5203, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5209 = n5208[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5211 = n5209 + 4'b0011;
  assign n5212 = n5175[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5213 = n5207 ? n5211 : n5212;
  assign n5214 = n5175[19:12]; // extract
  assign n5215 = {n5214, n5213, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5216 = n5215[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5218 = $unsigned(n5216) > $unsigned(4'b0100);
  assign n5219 = {n5214, n5213, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5220 = n5219[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5222 = n5220 + 4'b0011;
  assign n5223 = n5175[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5224 = n5218 ? n5222 : n5223;
  assign n5225 = n5175[19:16]; // extract
  assign n5226 = {n5225, n5224, n5213, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5227 = n5226[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5229 = $unsigned(n5227) > $unsigned(4'b0100);
  assign n5230 = {n5225, n5224, n5213, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5231 = n5230[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5233 = n5231 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5234 = n5229 ? n5233 : n5225;
  assign n5235 = {n5234, n5224, n5213, n5202, n5191};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5236 = n5235[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5237 = n5178[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5238 = {n5236, n5237};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5239 = n5178[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5241 = {n5239, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5247 = n5238[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5249 = $unsigned(n5247) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5250 = n5238[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5252 = n5250 + 4'b0011;
  assign n5253 = n5238[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5254 = n5249 ? n5252 : n5253;
  assign n5255 = n5238[19:4]; // extract
  assign n5256 = {n5255, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5257 = n5256[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5259 = $unsigned(n5257) > $unsigned(4'b0100);
  assign n5260 = {n5255, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5261 = n5260[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5263 = n5261 + 4'b0011;
  assign n5264 = n5238[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5265 = n5259 ? n5263 : n5264;
  assign n5266 = n5238[19:8]; // extract
  assign n5267 = {n5266, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5268 = n5267[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5270 = $unsigned(n5268) > $unsigned(4'b0100);
  assign n5271 = {n5266, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5272 = n5271[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5274 = n5272 + 4'b0011;
  assign n5275 = n5238[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5276 = n5270 ? n5274 : n5275;
  assign n5277 = n5238[19:12]; // extract
  assign n5278 = {n5277, n5276, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5279 = n5278[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5281 = $unsigned(n5279) > $unsigned(4'b0100);
  assign n5282 = {n5277, n5276, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5283 = n5282[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5285 = n5283 + 4'b0011;
  assign n5286 = n5238[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5287 = n5281 ? n5285 : n5286;
  assign n5288 = n5238[19:16]; // extract
  assign n5289 = {n5288, n5287, n5276, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5290 = n5289[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5292 = $unsigned(n5290) > $unsigned(4'b0100);
  assign n5293 = {n5288, n5287, n5276, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5294 = n5293[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5296 = n5294 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5297 = n5292 ? n5296 : n5288;
  assign n5298 = {n5297, n5287, n5276, n5265, n5254};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5299 = n5298[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5300 = n5241[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5301 = {n5299, n5300};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5302 = n5241[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5304 = {n5302, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5310 = n5301[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5312 = $unsigned(n5310) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5313 = n5301[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5315 = n5313 + 4'b0011;
  assign n5316 = n5301[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5317 = n5312 ? n5315 : n5316;
  assign n5318 = n5301[19:4]; // extract
  assign n5319 = {n5318, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5320 = n5319[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5322 = $unsigned(n5320) > $unsigned(4'b0100);
  assign n5323 = {n5318, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5324 = n5323[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5326 = n5324 + 4'b0011;
  assign n5327 = n5301[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5328 = n5322 ? n5326 : n5327;
  assign n5329 = n5301[19:8]; // extract
  assign n5330 = {n5329, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5331 = n5330[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5333 = $unsigned(n5331) > $unsigned(4'b0100);
  assign n5334 = {n5329, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5335 = n5334[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5337 = n5335 + 4'b0011;
  assign n5338 = n5301[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5339 = n5333 ? n5337 : n5338;
  assign n5340 = n5301[19:12]; // extract
  assign n5341 = {n5340, n5339, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5342 = n5341[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5344 = $unsigned(n5342) > $unsigned(4'b0100);
  assign n5345 = {n5340, n5339, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5346 = n5345[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5348 = n5346 + 4'b0011;
  assign n5349 = n5301[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5350 = n5344 ? n5348 : n5349;
  assign n5351 = n5301[19:16]; // extract
  assign n5352 = {n5351, n5350, n5339, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5353 = n5352[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5355 = $unsigned(n5353) > $unsigned(4'b0100);
  assign n5356 = {n5351, n5350, n5339, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5357 = n5356[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5359 = n5357 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5360 = n5355 ? n5359 : n5351;
  assign n5361 = {n5360, n5350, n5339, n5328, n5317};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5362 = n5361[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5363 = n5304[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5364 = {n5362, n5363};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5365 = n5304[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5367 = {n5365, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5373 = n5364[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5375 = $unsigned(n5373) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5376 = n5364[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5378 = n5376 + 4'b0011;
  assign n5379 = n5364[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5380 = n5375 ? n5378 : n5379;
  assign n5381 = n5364[19:4]; // extract
  assign n5382 = {n5381, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5383 = n5382[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5385 = $unsigned(n5383) > $unsigned(4'b0100);
  assign n5386 = {n5381, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5387 = n5386[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5389 = n5387 + 4'b0011;
  assign n5390 = n5364[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5391 = n5385 ? n5389 : n5390;
  assign n5392 = n5364[19:8]; // extract
  assign n5393 = {n5392, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5394 = n5393[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5396 = $unsigned(n5394) > $unsigned(4'b0100);
  assign n5397 = {n5392, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5398 = n5397[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5400 = n5398 + 4'b0011;
  assign n5401 = n5364[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5402 = n5396 ? n5400 : n5401;
  assign n5403 = n5364[19:12]; // extract
  assign n5404 = {n5403, n5402, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5405 = n5404[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5407 = $unsigned(n5405) > $unsigned(4'b0100);
  assign n5408 = {n5403, n5402, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5409 = n5408[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5411 = n5409 + 4'b0011;
  assign n5412 = n5364[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5413 = n5407 ? n5411 : n5412;
  assign n5414 = n5364[19:16]; // extract
  assign n5415 = {n5414, n5413, n5402, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5416 = n5415[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5418 = $unsigned(n5416) > $unsigned(4'b0100);
  assign n5419 = {n5414, n5413, n5402, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5420 = n5419[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5422 = n5420 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5423 = n5418 ? n5422 : n5414;
  assign n5424 = {n5423, n5413, n5402, n5391, n5380};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5425 = n5424[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5426 = n5367[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5427 = {n5425, n5426};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5428 = n5367[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5430 = {n5428, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5436 = n5427[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5438 = $unsigned(n5436) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5439 = n5427[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5441 = n5439 + 4'b0011;
  assign n5442 = n5427[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5443 = n5438 ? n5441 : n5442;
  assign n5444 = n5427[19:4]; // extract
  assign n5445 = {n5444, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5446 = n5445[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5448 = $unsigned(n5446) > $unsigned(4'b0100);
  assign n5449 = {n5444, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5450 = n5449[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5452 = n5450 + 4'b0011;
  assign n5453 = n5427[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5454 = n5448 ? n5452 : n5453;
  assign n5455 = n5427[19:8]; // extract
  assign n5456 = {n5455, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5457 = n5456[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5459 = $unsigned(n5457) > $unsigned(4'b0100);
  assign n5460 = {n5455, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5461 = n5460[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5463 = n5461 + 4'b0011;
  assign n5464 = n5427[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5465 = n5459 ? n5463 : n5464;
  assign n5466 = n5427[19:12]; // extract
  assign n5467 = {n5466, n5465, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5468 = n5467[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5470 = $unsigned(n5468) > $unsigned(4'b0100);
  assign n5471 = {n5466, n5465, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5472 = n5471[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5474 = n5472 + 4'b0011;
  assign n5475 = n5427[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5476 = n5470 ? n5474 : n5475;
  assign n5477 = n5427[19:16]; // extract
  assign n5478 = {n5477, n5476, n5465, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5479 = n5478[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5481 = $unsigned(n5479) > $unsigned(4'b0100);
  assign n5482 = {n5477, n5476, n5465, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5483 = n5482[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5485 = n5483 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5486 = n5481 ? n5485 : n5477;
  assign n5487 = {n5486, n5476, n5465, n5454, n5443};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5488 = n5487[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5489 = n5430[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5490 = {n5488, n5489};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5491 = n5430[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5493 = {n5491, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5499 = n5490[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5501 = $unsigned(n5499) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5502 = n5490[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5504 = n5502 + 4'b0011;
  assign n5505 = n5490[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5506 = n5501 ? n5504 : n5505;
  assign n5507 = n5490[19:4]; // extract
  assign n5508 = {n5507, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5509 = n5508[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5511 = $unsigned(n5509) > $unsigned(4'b0100);
  assign n5512 = {n5507, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5513 = n5512[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5515 = n5513 + 4'b0011;
  assign n5516 = n5490[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5517 = n5511 ? n5515 : n5516;
  assign n5518 = n5490[19:8]; // extract
  assign n5519 = {n5518, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5520 = n5519[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5522 = $unsigned(n5520) > $unsigned(4'b0100);
  assign n5523 = {n5518, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5524 = n5523[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5526 = n5524 + 4'b0011;
  assign n5527 = n5490[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5528 = n5522 ? n5526 : n5527;
  assign n5529 = n5490[19:12]; // extract
  assign n5530 = {n5529, n5528, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5531 = n5530[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5533 = $unsigned(n5531) > $unsigned(4'b0100);
  assign n5534 = {n5529, n5528, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5535 = n5534[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5537 = n5535 + 4'b0011;
  assign n5538 = n5490[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5539 = n5533 ? n5537 : n5538;
  assign n5540 = n5490[19:16]; // extract
  assign n5541 = {n5540, n5539, n5528, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5542 = n5541[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5544 = $unsigned(n5542) > $unsigned(4'b0100);
  assign n5545 = {n5540, n5539, n5528, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5546 = n5545[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5548 = n5546 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5549 = n5544 ? n5548 : n5540;
  assign n5550 = {n5549, n5539, n5528, n5517, n5506};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5551 = n5550[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5552 = n5493[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5553 = {n5551, n5552};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5554 = n5493[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5556 = {n5554, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5562 = n5553[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5564 = $unsigned(n5562) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5565 = n5553[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5567 = n5565 + 4'b0011;
  assign n5568 = n5553[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5569 = n5564 ? n5567 : n5568;
  assign n5570 = n5553[19:4]; // extract
  assign n5571 = {n5570, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5572 = n5571[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5574 = $unsigned(n5572) > $unsigned(4'b0100);
  assign n5575 = {n5570, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5576 = n5575[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5578 = n5576 + 4'b0011;
  assign n5579 = n5553[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5580 = n5574 ? n5578 : n5579;
  assign n5581 = n5553[19:8]; // extract
  assign n5582 = {n5581, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5583 = n5582[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5585 = $unsigned(n5583) > $unsigned(4'b0100);
  assign n5586 = {n5581, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5587 = n5586[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5589 = n5587 + 4'b0011;
  assign n5590 = n5553[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5591 = n5585 ? n5589 : n5590;
  assign n5592 = n5553[19:12]; // extract
  assign n5593 = {n5592, n5591, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5594 = n5593[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5596 = $unsigned(n5594) > $unsigned(4'b0100);
  assign n5597 = {n5592, n5591, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5598 = n5597[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5600 = n5598 + 4'b0011;
  assign n5601 = n5553[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5602 = n5596 ? n5600 : n5601;
  assign n5603 = n5553[19:16]; // extract
  assign n5604 = {n5603, n5602, n5591, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5605 = n5604[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5607 = $unsigned(n5605) > $unsigned(4'b0100);
  assign n5608 = {n5603, n5602, n5591, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5609 = n5608[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5611 = n5609 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5612 = n5607 ? n5611 : n5603;
  assign n5613 = {n5612, n5602, n5591, n5580, n5569};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5614 = n5613[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5615 = n5556[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5616 = {n5614, n5615};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:41  */
  assign n5617 = n5556[14:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:53:55  */
  assign n5619 = {n5617, 1'b0};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:22  */
  assign n5625 = n5616[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:36  */
  assign n5627 = $unsigned(n5625) > $unsigned(4'b0100);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:58  */
  assign n5628 = n5616[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:31:72  */
  assign n5630 = n5628 + 4'b0011;
  assign n5631 = n5616[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:30:7  */
  assign n5632 = n5627 ? n5630 : n5631;
  assign n5633 = n5616[19:4]; // extract
  assign n5634 = {n5633, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:22  */
  assign n5635 = n5634[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:36  */
  assign n5637 = $unsigned(n5635) > $unsigned(4'b0100);
  assign n5638 = {n5633, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:58  */
  assign n5639 = n5638[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:35:72  */
  assign n5641 = n5639 + 4'b0011;
  assign n5642 = n5616[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:34:7  */
  assign n5643 = n5637 ? n5641 : n5642;
  assign n5644 = n5616[19:8]; // extract
  assign n5645 = {n5644, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:22  */
  assign n5646 = n5645[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:37  */
  assign n5648 = $unsigned(n5646) > $unsigned(4'b0100);
  assign n5649 = {n5644, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:59  */
  assign n5650 = n5649[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:39:74  */
  assign n5652 = n5650 + 4'b0011;
  assign n5653 = n5616[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:38:7  */
  assign n5654 = n5648 ? n5652 : n5653;
  assign n5655 = n5616[19:12]; // extract
  assign n5656 = {n5655, n5654, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:22  */
  assign n5657 = n5656[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:38  */
  assign n5659 = $unsigned(n5657) > $unsigned(4'b0100);
  assign n5660 = {n5655, n5654, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:60  */
  assign n5661 = n5660[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:43:76  */
  assign n5663 = n5661 + 4'b0011;
  assign n5664 = n5616[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:42:7  */
  assign n5665 = n5659 ? n5663 : n5664;
  assign n5666 = n5616[19:16]; // extract
  assign n5667 = {n5666, n5665, n5654, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:22  */
  assign n5668 = n5667[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:38  */
  assign n5670 = $unsigned(n5668) > $unsigned(4'b0100);
  assign n5671 = {n5666, n5665, n5654, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:60  */
  assign n5672 = n5671[19:16]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:47:76  */
  assign n5674 = n5672 + 4'b0011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:46:7  */
  assign n5675 = n5670 ? n5674 : n5666;
  assign n5676 = {n5675, n5665, n5654, n5643, n5632};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:17  */
  assign n5677 = n5676[18:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:48  */
  assign n5678 = n5619[15]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:51:31  */
  assign n5679 = {n5677, n5678};
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:56:38  */
  assign n5683 = n5679[3:0]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:57:38  */
  assign n5684 = n5679[7:4]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:58:42  */
  assign n5685 = n5679[11:8]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:59:43  */
  assign n5686 = n5679[15:12]; // extract
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/bin2bcd_ea.vhd:60:46  */
  assign n5687 = n5679[19:16]; // extract
endmodule

module tdp_ram_ea_8_8
  (input  a_clock_i,
   input  a_write_i,
   input  [7:0] a_addr_i,
   input  [7:0] a_data_i,
   output [7:0] a_data_o,
   input  b_clock_i,
   input  b_write_i,
   input  [7:0] b_addr_i,
   input  [7:0] b_data_i,
   output [7:0] b_data_o);
  reg [7:0] n4665; // mem_rd
  reg [7:0] n4668; // mem_rd
  assign a_data_o = n4668; //(module output)
  assign b_data_o = n4665; //(module output)
  reg [7:0] mem[255:0] ; // memory
  always @(posedge b_clock_i)
    if (b_write_i)
      mem[b_addr_i] <= b_data_i;
  always @(posedge b_clock_i)
    if (1'b1)
      n4665 <= mem[b_addr_i];
  always @(posedge a_clock_i)
    if (a_write_i)
      mem[a_addr_i] <= a_data_i;
  always @(posedge a_clock_i)
    if (1'b1)
      n4668 <= mem[a_addr_i];
  /* ../../vhdl/rtl/GAME/TDP_ram/rtl/TDP_ram_ea.vhd:60:13  */
  /* ../../vhdl/rtl/GAME/TDP_ram/rtl/TDP_ram_ea.vhd:58:5  */
  /* ../../vhdl/rtl/GAME/TDP_ram/rtl/TDP_ram_ea.vhd:48:13  */
  /* ../../vhdl/rtl/GAME/TDP_ram/rtl/TDP_ram_ea.vhd:58:5  */
endmodule

module pixgen_ea
  (input  clk_i,
   input  rst_i,
   input  vga_en_i,
   input  frame_finished_i,
   input  [7:0] pg_rd_i,
   input  [10:0] x_counter_i,
   input  [10:0] y_counter_i,
   output pg_we_o,
   output adr_cnt_finished_o,
   output [7:0] pg_wr_o,
   output [7:0] pg_adr_o,
   output [4:0] data_pg_o);
  wire [1:0] state;
  wire [1:0] next_state;
  wire [4:0] block_x_pos;
  wire [4:0] block_y_pos;
  wire [5:0] block_x;
  wire [5:0] block_y;
  wire [5:0] block_x_next;
  wire [5:0] block_y_next;
  wire x_cnt_enable;
  wire [4:0] color_pg;
  wire [2:0] color;
  wire vga_enable;
  wire [7:0] adr_cnt;
  wire [7:0] adr_cnt_next;
  wire inc_adr_cnt;
  wire clr_adr_cnt;
  wire adr_cnt_finished;
  wire mux_enable;
  wire [7:0] blockaddresse;
  wire [10:0] x_counter_enabled;
  wire [10:0] y_counter_enabled;
  localparam [7:0] n4122 = 8'b00001100;
  wire [10:0] n4124;
  wire n4126;
  wire n4128;
  wire n4129;
  wire [10:0] n4130;
  wire [10:0] n4133;
  wire n4135;
  wire n4137;
  wire n4138;
  wire [10:0] n4139;
  wire n4143;
  wire n4144;
  wire [5:0] n4145;
  wire [5:0] n4147;
  wire n4149;
  wire n4150;
  wire [5:0] n4151;
  wire n4154;
  wire n4155;
  wire [5:0] n4156;
  wire [5:0] n4158;
  wire n4160;
  wire n4161;
  wire n4163;
  wire n4164;
  wire [5:0] n4165;
  wire [10:0] n4167;
  wire [4:0] n4168;
  wire [10:0] n4170;
  wire [4:0] n4171;
  wire [5:0] n4173;
  wire [5:0] n4175;
  wire [13:0] n4178;
  wire [13:0] n4179;
  wire [13:0] n4180;
  wire [13:0] n4181;
  wire [7:0] n4182;
  wire [2:0] n4183;
  wire n4185;
  wire n4186;
  wire [4:0] n4187;
  wire n4190;
  wire n4192;
  wire n4194;
  wire n4195;
  wire n4197;
  wire n4199;
  wire n4200;
  wire n4201;
  wire n4202;
  wire [4:0] n4203;
  wire n4206;
  wire n4208;
  wire n4209;
  wire [4:0] n4211;
  wire n4212;
  wire n4213;
  wire n4214;
  wire n4215;
  wire [4:0] n4216;
  wire n4219;
  wire n4221;
  wire n4222;
  wire [4:0] n4224;
  wire n4225;
  wire n4226;
  wire n4227;
  wire n4228;
  wire [4:0] n4229;
  wire n4232;
  wire n4234;
  wire n4236;
  wire n4237;
  wire n4238;
  wire [4:0] n4239;
  wire n4242;
  wire n4244;
  wire n4246;
  wire n4247;
  wire n4249;
  wire n4251;
  wire n4252;
  wire n4253;
  wire n4254;
  wire [4:0] n4255;
  wire n4258;
  wire n4260;
  wire n4261;
  wire [4:0] n4263;
  wire n4264;
  wire n4265;
  wire n4266;
  wire n4267;
  wire [4:0] n4268;
  wire n4271;
  wire n4273;
  wire n4274;
  wire [4:0] n4276;
  wire n4277;
  wire n4278;
  wire n4279;
  wire n4280;
  wire [4:0] n4281;
  wire n4284;
  wire n4286;
  wire n4288;
  wire n4289;
  wire n4290;
  wire [4:0] n4291;
  wire n4294;
  wire n4296;
  wire n4298;
  wire n4299;
  wire n4301;
  wire n4303;
  wire n4304;
  wire n4305;
  wire n4306;
  wire [4:0] n4307;
  wire n4310;
  wire n4312;
  wire n4313;
  wire [4:0] n4315;
  wire n4316;
  wire n4317;
  wire n4318;
  wire n4319;
  wire [4:0] n4320;
  wire n4323;
  wire n4325;
  wire n4326;
  wire [4:0] n4328;
  wire n4329;
  wire n4330;
  wire n4331;
  wire n4332;
  wire [4:0] n4333;
  wire n4336;
  wire n4338;
  wire n4340;
  wire n4341;
  wire n4342;
  wire [4:0] n4343;
  wire n4346;
  wire n4348;
  wire n4350;
  wire n4351;
  wire n4353;
  wire n4355;
  wire n4356;
  wire n4357;
  wire n4358;
  wire [4:0] n4359;
  wire n4362;
  wire n4364;
  wire n4365;
  wire [4:0] n4367;
  wire n4368;
  wire n4369;
  wire n4370;
  wire n4371;
  wire [4:0] n4372;
  wire n4375;
  wire n4377;
  wire n4378;
  wire [4:0] n4380;
  wire n4381;
  wire n4382;
  wire n4383;
  wire n4384;
  wire [4:0] n4385;
  wire n4388;
  wire n4390;
  wire n4392;
  wire n4393;
  wire n4394;
  wire [4:0] n4395;
  wire n4398;
  wire n4400;
  wire n4402;
  wire n4403;
  wire n4405;
  wire n4407;
  wire n4408;
  wire n4409;
  wire n4410;
  wire [4:0] n4411;
  wire n4414;
  wire n4416;
  wire n4417;
  wire [4:0] n4419;
  wire n4420;
  wire n4421;
  wire n4422;
  wire n4423;
  wire [4:0] n4424;
  wire n4427;
  wire n4429;
  wire n4430;
  wire [4:0] n4432;
  wire n4433;
  wire n4434;
  wire n4435;
  wire n4436;
  wire [4:0] n4437;
  wire n4440;
  wire n4442;
  wire n4444;
  wire n4445;
  wire n4446;
  wire [4:0] n4447;
  wire n4450;
  wire n4452;
  wire n4454;
  wire n4455;
  wire n4457;
  wire n4459;
  wire n4460;
  wire n4461;
  wire n4462;
  wire [4:0] n4463;
  wire n4466;
  wire n4468;
  wire n4469;
  wire [4:0] n4471;
  wire n4472;
  wire n4473;
  wire n4474;
  wire n4475;
  wire [4:0] n4476;
  wire n4479;
  wire n4481;
  wire n4482;
  wire [4:0] n4484;
  wire n4485;
  wire n4486;
  wire n4487;
  wire n4488;
  wire [4:0] n4489;
  wire n4492;
  wire n4494;
  wire n4496;
  wire n4497;
  wire n4498;
  wire [4:0] n4499;
  wire n4502;
  wire n4504;
  wire n4506;
  wire n4507;
  wire n4509;
  wire n4511;
  wire n4512;
  wire n4513;
  wire n4514;
  wire [4:0] n4515;
  wire n4518;
  wire n4520;
  wire n4521;
  wire [4:0] n4523;
  wire n4524;
  wire n4525;
  wire n4526;
  wire n4527;
  wire [4:0] n4528;
  wire n4531;
  wire n4533;
  wire n4534;
  wire [4:0] n4536;
  wire n4537;
  wire n4538;
  wire n4539;
  wire n4540;
  wire [4:0] n4541;
  wire n4544;
  wire n4546;
  wire n4548;
  wire n4549;
  wire n4550;
  wire [4:0] n4551;
  wire [7:0] n4553;
  wire [7:0] n4554;
  wire [7:0] n4556;
  wire n4559;
  wire n4560;
  wire [7:0] n4562;
  wire n4563;
  wire [4:0] n4564;
  wire n4573;
  wire [1:0] n4575;
  wire n4577;
  wire [1:0] n4579;
  wire n4581;
  wire n4582;
  wire [1:0] n4584;
  wire n4586;
  wire [3:0] n4587;
  reg [1:0] n4590;
  wire n4594;
  wire n4595;
  wire n4599;
  wire n4600;
  wire n4604;
  wire n4605;
  wire n4614;
  wire n4615;
  wire n4619;
  wire n4620;
  reg [1:0] n4622;
  reg [5:0] n4623;
  reg [5:0] n4624;
  reg [7:0] n4625;
  assign pg_we_o = n4595; //(module output)
  assign adr_cnt_finished_o = adr_cnt_finished; //(module output)
  assign pg_wr_o = n4122; //(module output)
  assign pg_adr_o = n4562; //(module output)
  assign data_pg_o = n4564; //(module output)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:27:12  */
  assign state = n4622; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:27:19  */
  assign next_state = n4590; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:28:12  */
  assign block_x_pos = n4168; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:29:12  */
  assign block_y_pos = n4171; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:30:12  */
  assign block_x = n4623; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:30:21  */
  assign block_y = n4624; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:30:30  */
  assign block_x_next = n4145; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:30:44  */
  assign block_y_next = n4156; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:31:23  */
  assign x_cnt_enable = n4620; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:32:12  */
  assign color_pg = n4187; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:33:12  */
  assign color = n4183; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:34:12  */
  assign vga_enable = vga_en_i; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:35:12  */
  assign adr_cnt = n4625; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:35:21  */
  assign adr_cnt_next = n4554; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:36:12  */
  assign inc_adr_cnt = n4600; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:36:25  */
  assign clr_adr_cnt = n4615; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:36:38  */
  assign adr_cnt_finished = n4560; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:37:12  */
  assign mux_enable = n4605; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:38:12  */
  assign blockaddresse = n4182; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:40:12  */
  assign x_counter_enabled = n4130; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:41:12  */
  assign y_counter_enabled = n4139; // (signal)
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:60:38  */
  assign n4124 = x_counter_i - 11'b00011111010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:60:67  */
  assign n4126 = $unsigned(x_counter_i) >= $unsigned(11'b00011111010);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:60:95  */
  assign n4128 = $unsigned(x_counter_i) <= $unsigned(11'b01000010010);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:60:79  */
  assign n4129 = n4128 & n4126;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:60:49  */
  assign n4130 = n4129 ? n4124 : 11'b00000000000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:63:38  */
  assign n4133 = y_counter_i - 11'b00000100001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:63:67  */
  assign n4135 = $unsigned(y_counter_i) >= $unsigned(11'b00000100001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:63:95  */
  assign n4137 = $unsigned(y_counter_i) <= $unsigned(11'b01001010001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:63:79  */
  assign n4138 = n4137 & n4135;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:63:49  */
  assign n4139 = n4138 ? n4133 : 11'b00000000000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:68:50  */
  assign n4143 = block_x == 6'b001010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:68:58  */
  assign n4144 = n4143 | frame_finished_i;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:68:37  */
  assign n4145 = n4144 ? 6'b000000 : n4151;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:69:29  */
  assign n4147 = block_x + 6'b000001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:69:51  */
  assign n4149 = block_x_pos == 5'b11011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:69:69  */
  assign n4150 = x_cnt_enable & n4149;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:68:84  */
  assign n4151 = n4150 ? n4147 : block_x;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:72:50  */
  assign n4154 = block_y == 6'b010100;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:72:58  */
  assign n4155 = n4154 | frame_finished_i;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:72:37  */
  assign n4156 = n4155 ? 6'b000000 : n4165;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:73:29  */
  assign n4158 = block_y + 6'b000001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:73:51  */
  assign n4160 = block_y_pos == 5'b11011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:73:69  */
  assign n4161 = x_cnt_enable & n4160;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:73:114  */
  assign n4163 = x_counter_enabled == 11'b00100010111;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:73:92  */
  assign n4164 = n4163 & n4161;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:72:84  */
  assign n4165 = n4164 ? n4158 : block_y;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:76:45  */
  assign n4167 = x_counter_enabled % 11'b00000011100; // umod
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:76:20  */
  assign n4168 = n4167[4:0];  // trunc
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:77:45  */
  assign n4170 = y_counter_enabled % 11'b00000011100; // umod
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:77:20  */
  assign n4171 = n4170[4:0];  // trunc
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:61  */
  assign n4173 = 6'b010100 - block_y;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:71  */
  assign n4175 = n4173 - 6'b000001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:52  */
  assign n4178 = {8'b0, n4175};  //  uext
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:52  */
  assign n4179 = 14'b00000000001010 * n4178; // umul
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:77  */
  assign n4180 = {8'b0, block_x};  //  uext
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:77  */
  assign n4181 = n4179 + n4180;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:78:22  */
  assign n4182 = n4181[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:81:21  */
  assign n4183 = pg_rd_i[2:0]; // extract
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:82:41  */
  assign n4185 = pg_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:82:45  */
  assign n4186 = ~n4185;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:82:29  */
  assign n4187 = n4186 ? 5'b00000 : n4203;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:48  */
  assign n4190 = color == 3'b000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:74  */
  assign n4192 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:123  */
  assign n4194 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:107  */
  assign n4195 = n4194 & n4192;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:190  */
  assign n4197 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:239  */
  assign n4199 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:223  */
  assign n4200 = n4199 & n4197;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:173  */
  assign n4201 = n4200 & n4195;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:56  */
  assign n4202 = n4201 & n4190;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:82:51  */
  assign n4203 = n4202 ? 5'b00101 : n4216;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:47  */
  assign n4206 = color == 3'b000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:72  */
  assign n4208 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:121  */
  assign n4209 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:168  */
  assign n4211 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:152  */
  assign n4212 = $unsigned(block_x_pos) <= $unsigned(n4211);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:136  */
  assign n4213 = n4212 & n4209;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:104  */
  assign n4214 = n4213 & n4208;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:55  */
  assign n4215 = n4214 & n4206;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:83:291  */
  assign n4216 = n4215 ? 5'b01000 : n4229;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:48  */
  assign n4219 = color == 3'b000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:73  */
  assign n4221 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:139  */
  assign n4222 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:186  */
  assign n4224 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:170  */
  assign n4225 = $unsigned(block_x_pos) >= $unsigned(n4224);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:154  */
  assign n4226 = n4225 & n4222;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:122  */
  assign n4227 = n4226 & n4221;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:56  */
  assign n4228 = n4227 & n4219;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:84:185  */
  assign n4229 = n4228 ? 5'b00110 : n4239;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:52  */
  assign n4232 = color == 3'b000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:77  */
  assign n4234 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:124  */
  assign n4236 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:109  */
  assign n4237 = n4234 | n4236;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:60  */
  assign n4238 = n4237 & n4232;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:85:203  */
  assign n4239 = n4238 ? 5'b00111 : n4255;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:46  */
  assign n4242 = color == 3'b001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:72  */
  assign n4244 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:121  */
  assign n4246 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:105  */
  assign n4247 = n4246 & n4244;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:188  */
  assign n4249 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:237  */
  assign n4251 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:221  */
  assign n4252 = n4251 & n4249;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:171  */
  assign n4253 = n4252 & n4247;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:54  */
  assign n4254 = n4253 & n4242;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:86:174  */
  assign n4255 = n4254 ? 5'b00001 : n4268;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:45  */
  assign n4258 = color == 3'b001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:70  */
  assign n4260 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:119  */
  assign n4261 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:166  */
  assign n4263 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:150  */
  assign n4264 = $unsigned(block_x_pos) <= $unsigned(n4263);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:134  */
  assign n4265 = n4264 & n4261;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:102  */
  assign n4266 = n4265 & n4260;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:53  */
  assign n4267 = n4266 & n4258;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:88:289  */
  assign n4268 = n4267 ? 5'b00100 : n4281;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:46  */
  assign n4271 = color == 3'b001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:70  */
  assign n4273 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:136  */
  assign n4274 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:183  */
  assign n4276 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:167  */
  assign n4277 = $unsigned(block_x_pos) >= $unsigned(n4276);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:151  */
  assign n4278 = n4277 & n4274;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:119  */
  assign n4279 = n4278 & n4273;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:54  */
  assign n4280 = n4279 & n4271;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:89:183  */
  assign n4281 = n4280 ? 5'b00010 : n4291;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:50  */
  assign n4284 = color == 3'b001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:75  */
  assign n4286 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:122  */
  assign n4288 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:107  */
  assign n4289 = n4286 | n4288;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:58  */
  assign n4290 = n4289 & n4284;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:90:200  */
  assign n4291 = n4290 ? 5'b00011 : n4307;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:47  */
  assign n4294 = color == 3'b010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:73  */
  assign n4296 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:122  */
  assign n4298 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:106  */
  assign n4299 = n4298 & n4296;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:189  */
  assign n4301 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:238  */
  assign n4303 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:222  */
  assign n4304 = n4303 & n4301;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:172  */
  assign n4305 = n4304 & n4299;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:55  */
  assign n4306 = n4305 & n4294;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:91:172  */
  assign n4307 = n4306 ? 5'b01101 : n4320;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:46  */
  assign n4310 = color == 3'b010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:71  */
  assign n4312 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:120  */
  assign n4313 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:167  */
  assign n4315 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:151  */
  assign n4316 = $unsigned(block_x_pos) <= $unsigned(n4315);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:135  */
  assign n4317 = n4316 & n4313;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:103  */
  assign n4318 = n4317 & n4312;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:54  */
  assign n4319 = n4318 & n4310;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:93:290  */
  assign n4320 = n4319 ? 5'b10000 : n4333;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:47  */
  assign n4323 = color == 3'b010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:72  */
  assign n4325 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:138  */
  assign n4326 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:185  */
  assign n4328 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:169  */
  assign n4329 = $unsigned(block_x_pos) >= $unsigned(n4328);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:153  */
  assign n4330 = n4329 & n4326;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:121  */
  assign n4331 = n4330 & n4325;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:55  */
  assign n4332 = n4331 & n4323;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:94:184  */
  assign n4333 = n4332 ? 5'b01110 : n4343;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:51  */
  assign n4336 = color == 3'b010;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:76  */
  assign n4338 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:123  */
  assign n4340 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:108  */
  assign n4341 = n4338 | n4340;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:59  */
  assign n4342 = n4341 & n4336;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:95:202  */
  assign n4343 = n4342 ? 5'b01111 : n4359;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:45  */
  assign n4346 = color == 3'b011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:71  */
  assign n4348 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:120  */
  assign n4350 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:104  */
  assign n4351 = n4350 & n4348;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:187  */
  assign n4353 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:236  */
  assign n4355 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:220  */
  assign n4356 = n4355 & n4353;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:170  */
  assign n4357 = n4356 & n4351;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:53  */
  assign n4358 = n4357 & n4346;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:96:173  */
  assign n4359 = n4358 ? 5'b10001 : n4372;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:44  */
  assign n4362 = color == 3'b011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:69  */
  assign n4364 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:118  */
  assign n4365 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:165  */
  assign n4367 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:149  */
  assign n4368 = $unsigned(block_x_pos) <= $unsigned(n4367);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:133  */
  assign n4369 = n4368 & n4365;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:101  */
  assign n4370 = n4369 & n4364;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:52  */
  assign n4371 = n4370 & n4362;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:98:288  */
  assign n4372 = n4371 ? 5'b10100 : n4385;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:45  */
  assign n4375 = color == 3'b011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:70  */
  assign n4377 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:136  */
  assign n4378 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:183  */
  assign n4380 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:167  */
  assign n4381 = $unsigned(block_x_pos) >= $unsigned(n4380);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:151  */
  assign n4382 = n4381 & n4378;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:119  */
  assign n4383 = n4382 & n4377;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:53  */
  assign n4384 = n4383 & n4375;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:99:182  */
  assign n4385 = n4384 ? 5'b10010 : n4395;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:49  */
  assign n4388 = color == 3'b011;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:74  */
  assign n4390 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:121  */
  assign n4392 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:106  */
  assign n4393 = n4390 | n4392;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:57  */
  assign n4394 = n4393 & n4388;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:100:200  */
  assign n4395 = n4394 ? 5'b10011 : n4411;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:46  */
  assign n4398 = color == 3'b100;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:72  */
  assign n4400 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:121  */
  assign n4402 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:105  */
  assign n4403 = n4402 & n4400;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:188  */
  assign n4405 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:237  */
  assign n4407 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:221  */
  assign n4408 = n4407 & n4405;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:171  */
  assign n4409 = n4408 & n4403;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:54  */
  assign n4410 = n4409 & n4398;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:101:171  */
  assign n4411 = n4410 ? 5'b10101 : n4424;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:45  */
  assign n4414 = color == 3'b100;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:70  */
  assign n4416 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:119  */
  assign n4417 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:166  */
  assign n4419 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:150  */
  assign n4420 = $unsigned(block_x_pos) <= $unsigned(n4419);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:134  */
  assign n4421 = n4420 & n4417;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:102  */
  assign n4422 = n4421 & n4416;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:53  */
  assign n4423 = n4422 & n4414;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:103:289  */
  assign n4424 = n4423 ? 5'b11000 : n4437;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:46  */
  assign n4427 = color == 3'b100;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:71  */
  assign n4429 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:137  */
  assign n4430 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:184  */
  assign n4432 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:168  */
  assign n4433 = $unsigned(block_x_pos) >= $unsigned(n4432);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:152  */
  assign n4434 = n4433 & n4430;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:120  */
  assign n4435 = n4434 & n4429;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:54  */
  assign n4436 = n4435 & n4427;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:104:183  */
  assign n4437 = n4436 ? 5'b10110 : n4447;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:50  */
  assign n4440 = color == 3'b100;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:75  */
  assign n4442 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:122  */
  assign n4444 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:107  */
  assign n4445 = n4442 | n4444;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:58  */
  assign n4446 = n4445 & n4440;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:105:201  */
  assign n4447 = n4446 ? 5'b10111 : n4463;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:48  */
  assign n4450 = color == 3'b101;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:74  */
  assign n4452 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:123  */
  assign n4454 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:107  */
  assign n4455 = n4454 & n4452;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:190  */
  assign n4457 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:239  */
  assign n4459 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:223  */
  assign n4460 = n4459 & n4457;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:173  */
  assign n4461 = n4460 & n4455;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:56  */
  assign n4462 = n4461 & n4450;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:106:172  */
  assign n4463 = n4462 ? 5'b11001 : n4476;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:47  */
  assign n4466 = color == 3'b101;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:72  */
  assign n4468 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:121  */
  assign n4469 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:168  */
  assign n4471 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:152  */
  assign n4472 = $unsigned(block_x_pos) <= $unsigned(n4471);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:136  */
  assign n4473 = n4472 & n4469;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:104  */
  assign n4474 = n4473 & n4468;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:55  */
  assign n4475 = n4474 & n4466;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:108:291  */
  assign n4476 = n4475 ? 5'b11100 : n4489;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:48  */
  assign n4479 = color == 3'b101;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:73  */
  assign n4481 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:139  */
  assign n4482 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:186  */
  assign n4484 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:170  */
  assign n4485 = $unsigned(block_x_pos) >= $unsigned(n4484);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:154  */
  assign n4486 = n4485 & n4482;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:122  */
  assign n4487 = n4486 & n4481;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:56  */
  assign n4488 = n4487 & n4479;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:109:185  */
  assign n4489 = n4488 ? 5'b11010 : n4499;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:52  */
  assign n4492 = color == 3'b101;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:77  */
  assign n4494 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:124  */
  assign n4496 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:109  */
  assign n4497 = n4494 | n4496;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:60  */
  assign n4498 = n4497 & n4492;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:110:203  */
  assign n4499 = n4498 ? 5'b11011 : n4515;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:48  */
  assign n4502 = color == 3'b110;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:74  */
  assign n4504 = $unsigned(block_x_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:123  */
  assign n4506 = $unsigned(block_x_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:107  */
  assign n4507 = n4506 & n4504;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:190  */
  assign n4509 = $unsigned(block_y_pos) >= $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:239  */
  assign n4511 = $unsigned(block_y_pos) <= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:223  */
  assign n4512 = n4511 & n4509;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:173  */
  assign n4513 = n4512 & n4507;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:56  */
  assign n4514 = n4513 & n4502;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:111:174  */
  assign n4515 = n4514 ? 5'b01001 : n4528;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:47  */
  assign n4518 = color == 3'b110;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:72  */
  assign n4520 = $unsigned(block_y_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:121  */
  assign n4521 = $unsigned(block_x_pos) >= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:168  */
  assign n4523 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:152  */
  assign n4524 = $unsigned(block_x_pos) <= $unsigned(n4523);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:136  */
  assign n4525 = n4524 & n4521;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:104  */
  assign n4526 = n4525 & n4520;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:55  */
  assign n4527 = n4526 & n4518;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:113:291  */
  assign n4528 = n4527 ? 5'b01100 : n4541;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:48  */
  assign n4531 = color == 3'b110;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:73  */
  assign n4533 = $unsigned(block_y_pos) >= $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:139  */
  assign n4534 = $unsigned(block_x_pos) <= $unsigned(block_y_pos);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:186  */
  assign n4536 = 5'b11100 - block_y_pos;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:170  */
  assign n4537 = $unsigned(block_x_pos) >= $unsigned(n4536);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:154  */
  assign n4538 = n4537 & n4534;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:122  */
  assign n4539 = n4538 & n4533;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:56  */
  assign n4540 = n4539 & n4531;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:114:185  */
  assign n4541 = n4540 ? 5'b01010 : n4551;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:116:52  */
  assign n4544 = color == 3'b110;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:116:77  */
  assign n4546 = $unsigned(block_x_pos) < $unsigned(5'b00011);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:116:124  */
  assign n4548 = $unsigned(block_x_pos) > $unsigned(5'b11001);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:116:109  */
  assign n4549 = n4546 | n4548;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:116:60  */
  assign n4550 = n4549 & n4544;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:115:203  */
  assign n4551 = n4550 ? 5'b01011 : 5'b00000;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:119:29  */
  assign n4553 = adr_cnt + 8'b00000001;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:119:33  */
  assign n4554 = inc_adr_cnt ? n4553 : n4556;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:119:56  */
  assign n4556 = clr_adr_cnt ? 8'b00000000 : adr_cnt;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:123:42  */
  assign n4559 = $unsigned(adr_cnt) >= $unsigned(8'b11000111);
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:123:29  */
  assign n4560 = n4559 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:126:62  */
  assign n4562 = mux_enable ? adr_cnt : blockaddresse;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:129:55  */
  assign n4563 = ~vga_enable;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:129:39  */
  assign n4564 = n4563 ? 5'b00011 : color_pg;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:153:13  */
  assign n4573 = state == 2'b00;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:156:17  */
  assign n4575 = adr_cnt_finished ? 2'b10 : state;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:155:13  */
  assign n4577 = state == 2'b01;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:160:17  */
  assign n4579 = vga_enable ? 2'b11 : state;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:159:13  */
  assign n4581 = state == 2'b10;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:164:31  */
  assign n4582 = ~vga_enable;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:164:17  */
  assign n4584 = n4582 ? 2'b10 : state;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:163:13  */
  assign n4586 = state == 2'b11;
  assign n4587 = {n4586, n4581, n4577, n4573};
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:152:9  */
  always @*
    case (n4587)
      4'b1000: n4590 = n4584;
      4'b0100: n4590 = n4579;
      4'b0010: n4590 = n4575;
      4'b0001: n4590 = 2'b01;
      default: n4590 = 2'bX;
    endcase
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:171:31  */
  assign n4594 = state == 2'b01;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:171:20  */
  assign n4595 = n4594 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:174:35  */
  assign n4599 = state == 2'b01;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:174:24  */
  assign n4600 = n4599 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:177:34  */
  assign n4604 = state == 2'b01;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:177:23  */
  assign n4605 = n4604 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:183:35  */
  assign n4614 = state == 2'b00;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:183:24  */
  assign n4615 = n4614 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:186:36  */
  assign n4619 = state == 2'b11;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:186:25  */
  assign n4620 = n4619 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:141:9  */
  always @(posedge clk_i or posedge rst_i)
    if (rst_i)
      n4622 <= 2'b00;
    else
      n4622 <= next_state;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:51:9  */
  always @(posedge clk_i or posedge rst_i)
    if (rst_i)
      n4623 <= 6'b000000;
    else
      n4623 <= block_x_next;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:51:9  */
  always @(posedge clk_i or posedge rst_i)
    if (rst_i)
      n4624 <= 6'b000000;
    else
      n4624 <= block_y_next;
  /* ../../vhdl/rtl/GAME/pixgen/rtl/pixgen_ea.vhd:51:9  */
  always @(posedge clk_i or posedge rst_i)
    if (rst_i)
      n4625 <= 8'b00000000;
    else
      n4625 <= adr_cnt_next;
endmodule

module delete_ea
  (input  reset_i,
   input  clk_i,
   input  req_del_i,
   output ack_del_o,
   input  [4:0] block1_y_i,
   input  [4:0] block2_y_i,
   input  [4:0] block3_y_i,
   input  [4:0] block4_y_i,
   input  [7:0] d_rd_i,
   output [7:0] adr_del_o,
   output [7:0] data_del_o,
   output we_del_o,
   output [15:0] points_del);
  wire inc_sel;
  wire clr_sel;
  wire [2:0] sel_cnt;
  wire [2:0] sel_cnt_next;
  wire ld_blocks;
  wire y19;
  wire inc_y;
  wire clr_y;
  wire inc_off;
  wire clr_off;
  wire subtract_offset;
  wire x9;
  wire inc_x;
  wire clr_x;
  wire [4:0] y_cnt;
  wire [4:0] y_cnt_next;
  wire [3:0] x_cnt;
  wire [3:0] x_cnt_next;
  wire [2:0] off_cnt;
  wire [2:0] off_cnt_next;
  wire [4:0] cnt;
  wire [4:0] cnt_next;
  wire [4:0] by;
  wire [3:0] bx;
  wire cnt_finished;
  wire clr_cnt;
  wire state1_sel;
  wire state2_sel;
  wire stateandcnt;
  wire state_activate;
  wire full_row;
  wire line_full;
  wire full;
  wire [17:0] full_reg;
  wire [17:0] next_full_reg;
  wire moving;
  reg blockk;
  wire [5:0] data_del;
  wire [5:0] data_del_next;
  wire [3:0] data_del_2;
  wire [3:0] data_del_next2;
  wire copy_dn;
  wire mux_x_sel;
  wire [4:0] block1_y_next;
  wire [4:0] block2_y_next;
  wire [4:0] block3_y_next;
  wire [4:0] block4_y_next;
  wire [4:0] block1_y;
  wire [4:0] block2_y;
  wire [4:0] block3_y;
  wire [4:0] block4_y;
  wire points_enable;
  wire [4:0] state;
  wire [4:0] next_state;
  wire [4:0] n3643;
  wire [4:0] n3644;
  wire [4:0] n3645;
  wire [4:0] n3646;
  wire [5:0] n3647;
  wire n3648;
  wire [5:0] n3649;
  wire n3650;
  wire [2:0] n3651;
  wire [3:0] n3652;
  wire n3653;
  wire [3:0] n3654;
  wire [16:0] n3655;
  wire [17:0] n3656;
  wire [4:0] n3658;
  wire [4:0] n3659;
  wire [4:0] n3661;
  wire n3664;
  wire n3665;
  wire [3:0] n3668;
  wire [3:0] n3669;
  wire [3:0] n3671;
  wire n3674;
  wire n3675;
  wire [2:0] n3678;
  wire [2:0] n3679;
  wire [2:0] n3681;
  wire [2:0] n3683;
  wire [2:0] n3684;
  wire [2:0] n3686;
  wire [4:0] n3688;
  wire [4:0] n3690;
  wire n3693;
  wire n3694;
  wire [1:0] n3697;
  wire [7:0] n3698;
  wire [7:0] n3699;
  wire [1:0] n3701;
  wire n3702;
  wire [2:0] n3703;
  wire [3:0] n3704;
  wire [4:0] n3705;
  wire [2:0] n3706;
  wire [7:0] n3707;
  wire n3708;
  wire n3709;
  wire n3710;
  wire n3711;
  wire n3712;
  wire n3713;
  wire n3714;
  wire n3715;
  wire n3716;
  wire n3717;
  wire n3718;
  wire n3719;
  wire n3720;
  wire n3721;
  wire n3722;
  wire n3723;
  wire n3724;
  wire n3725;
  wire n3726;
  wire n3727;
  wire n3728;
  wire n3729;
  wire n3730;
  wire n3731;
  wire n3732;
  wire n3733;
  wire n3734;
  wire n3735;
  wire n3736;
  wire n3737;
  wire n3738;
  wire n3739;
  wire n3740;
  wire n3741;
  wire n3742;
  wire n3743;
  wire n3744;
  wire n3745;
  wire n3746;
  wire n3747;
  wire n3748;
  wire n3749;
  wire [3:0] n3750;
  wire [3:0] n3751;
  wire n3753;
  wire [4:0] n3754;
  wire n3756;
  wire [4:0] n3757;
  wire n3759;
  wire [4:0] n3760;
  wire n3762;
  wire [4:0] n3763;
  wire [4:0] n3764;
  wire [4:0] n3765;
  wire n3767;
  wire n3768;
  wire [4:0] n3769;
  wire n3772;
  wire [15:0] n3773;
  wire n3776;
  wire n3777;
  wire [15:0] n3778;
  wire n3781;
  wire n3782;
  wire [15:0] n3783;
  wire n3786;
  wire n3787;
  wire [15:0] n3788;
  wire n3791;
  wire n3792;
  wire [15:0] n3793;
  wire [9:0] n3797;
  wire [9:0] n3798;
  wire [9:0] n3799;
  wire [9:0] n3800;
  wire [7:0] n3801;
  wire [4:0] n3810;
  wire n3812;
  wire n3814;
  wire n3815;
  wire n3817;
  wire n3818;
  wire [4:0] n3820;
  wire [4:0] n3822;
  wire n3824;
  wire n3826;
  wire n3827;
  wire n3829;
  wire n3830;
  wire [4:0] n3832;
  wire [4:0] n3834;
  wire n3836;
  wire n3838;
  wire n3839;
  wire n3840;
  wire n3841;
  wire [4:0] n3843;
  wire [4:0] n3845;
  wire [4:0] n3847;
  wire n3849;
  wire n3851;
  wire n3852;
  wire n3853;
  wire n3854;
  wire [4:0] n3856;
  wire [4:0] n3858;
  wire [4:0] n3860;
  wire n3862;
  wire n3864;
  wire n3865;
  wire [4:0] n3867;
  wire [4:0] n3869;
  wire n3871;
  wire n3873;
  wire n3874;
  wire [4:0] n3876;
  wire [4:0] n3878;
  wire n3880;
  wire n3882;
  wire n3883;
  wire [4:0] n3885;
  wire n3887;
  wire n3889;
  wire n3891;
  wire n3893;
  wire n3895;
  wire [17:0] n3896;
  reg [4:0] n3908;
  wire n3912;
  wire n3914;
  wire n3915;
  wire n3916;
  wire n3918;
  wire n3919;
  wire n3920;
  wire n3921;
  wire n3925;
  wire n3926;
  wire n3930;
  wire n3931;
  wire n3935;
  wire n3936;
  wire n3940;
  wire n3941;
  wire n3945;
  wire n3947;
  wire n3948;
  wire n3949;
  wire n3950;
  wire n3952;
  wire n3954;
  wire n3955;
  wire n3956;
  wire n3957;
  wire n3958;
  wire n3959;
  wire n3961;
  wire n3963;
  wire n3964;
  wire n3965;
  wire n3966;
  wire n3967;
  wire n3971;
  wire n3972;
  wire n3976;
  wire n3978;
  wire n3979;
  wire n3980;
  wire n3984;
  wire n3986;
  wire n3987;
  wire n3988;
  wire n3992;
  wire n3994;
  wire n3995;
  wire n3996;
  wire n3997;
  wire n3998;
  wire n4000;
  wire n4002;
  wire n4003;
  wire n4004;
  wire n4005;
  wire n4006;
  wire n4007;
  wire n4009;
  wire n4011;
  wire n4012;
  wire n4013;
  wire n4014;
  wire n4016;
  wire n4018;
  wire n4019;
  wire n4020;
  wire n4021;
  wire n4022;
  wire n4026;
  wire n4027;
  wire n4028;
  wire n4029;
  wire n4031;
  wire n4032;
  wire n4033;
  wire n4035;
  wire n4036;
  wire n4037;
  wire n4038;
  wire n4042;
  wire n4043;
  wire n4044;
  wire n4048;
  wire n4049;
  wire n4050;
  wire n4052;
  wire n4053;
  wire n4054;
  wire n4055;
  wire n4056;
  wire n4060;
  wire n4062;
  wire n4063;
  wire n4065;
  wire n4066;
  wire n4067;
  wire n4071;
  wire n4073;
  wire n4074;
  wire n4075;
  wire n4079;
  wire n4080;
  wire n4084;
  wire n4085;
  wire n4089;
  wire n4090;
  reg [2:0] n4092;
  reg [4:0] n4093;
  reg [3:0] n4094;
  reg [2:0] n4095;
  reg [4:0] n4096;
  reg [17:0] n4097;
  reg [5:0] n4098;
  reg [3:0] n4099;
  reg [4:0] n4100;
  reg [4:0] n4101;
  reg [4:0] n4102;
  reg [4:0] n4103;
  reg [4:0] n4104;
  assign ack_del_o = n4085; //(module output)
  assign adr_del_o = n3801; //(module output)
  assign data_del_o = n3699; //(module output)
  assign we_del_o = state_activate; //(module output)
  assign points_del = n3773; //(module output)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:29:12  */
  assign inc_sel = n4022; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:29:21  */
  assign clr_sel = n3936; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:30:12  */
  assign sel_cnt = n4092; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:30:21  */
  assign sel_cnt_next = n3684; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:32:12  */
  assign ld_blocks = n3941; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:33:12  */
  assign y19 = n3665; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:33:17  */
  assign inc_y = n4038; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:33:24  */
  assign clr_y = n3926; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:34:12  */
  assign inc_off = n4044; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:34:21  */
  assign clr_off = n3931; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:35:12  */
  assign subtract_offset = n4080; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:36:12  */
  assign x9 = n3675; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:36:16  */
  assign inc_x = n4056; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:36:23  */
  assign clr_x = n3921; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:37:12  */
  assign y_cnt = n4093; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:37:19  */
  assign y_cnt_next = n3659; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:38:12  */
  assign x_cnt = n4094; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:38:19  */
  assign x_cnt_next = n3669; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:39:12  */
  assign off_cnt = n4095; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:39:21  */
  assign off_cnt_next = n3679; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:40:12  */
  assign cnt = n4096; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:40:17  */
  assign cnt_next = n3688; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:41:12  */
  assign by = n3754; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:42:12  */
  assign bx = n3751; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:43:12  */
  assign cnt_finished = n3694; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:43:26  */
  assign clr_cnt = n3967; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:44:12  */
  assign state1_sel = n3972; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:44:24  */
  assign state2_sel = n4067; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:45:12  */
  assign stateandcnt = n3709; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:45:25  */
  assign state_activate = n3710; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:46:12  */
  assign full_row = n3749; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:46:22  */
  assign line_full = n3748; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:46:33  */
  assign full = n3712; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:47:12  */
  assign full_reg = n4097; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:48:12  */
  assign next_full_reg = n3656; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:49:12  */
  assign moving = n4075; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:50:12  */
  always @*
    blockk = 1'b0; // (isignal)
  initial
    blockk = 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:51:12  */
  assign data_del = n4098; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:52:12  */
  assign data_del_next = n3649; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:53:12  */
  assign data_del_2 = n4099; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:54:12  */
  assign data_del_next2 = n3654; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:55:12  */
  assign copy_dn = n3988; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:56:12  */
  assign mux_x_sel = n3980; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:57:12  */
  assign block1_y_next = n3643; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:57:27  */
  assign block2_y_next = n3644; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:57:42  */
  assign block3_y_next = n3645; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:57:57  */
  assign block4_y_next = n3646; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:58:12  */
  assign block1_y = n4100; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:58:22  */
  assign block2_y = n4101; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:58:32  */
  assign block3_y = n4102; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:58:42  */
  assign block4_y = n4103; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:59:12  */
  assign points_enable = n4090; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:62:12  */
  assign state = n4104; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:63:12  */
  assign next_state = n3908; // (signal)
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:103:33  */
  assign n3643 = ld_blocks ? block1_y_i : block1_y;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:105:33  */
  assign n3644 = ld_blocks ? block2_y_i : block2_y;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:107:33  */
  assign n3645 = ld_blocks ? block3_y_i : block3_y;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:109:33  */
  assign n3646 = ld_blocks ? block4_y_i : block4_y;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:112:28  */
  assign n3647 = d_rd_i[5:0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:112:61  */
  assign n3648 = ~state_activate;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:112:41  */
  assign n3649 = n3648 ? n3647 : data_del;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:114:29  */
  assign n3650 = d_rd_i[5]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:114:41  */
  assign n3651 = d_rd_i[2:0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:114:33  */
  assign n3652 = {n3650, n3651};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:114:74  */
  assign n3653 = ~state_activate;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:114:54  */
  assign n3654 = n3653 ? n3652 : data_del_2;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:117:30  */
  assign n3655 = full_reg[16:0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:117:44  */
  assign n3656 = {n3655, full_row};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:120:53  */
  assign n3658 = y_cnt + 5'b00001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:120:58  */
  assign n3659 = inc_y ? n3658 : n3661;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:120:75  */
  assign n3661 = clr_y ? 5'b00000 : y_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:123:27  */
  assign n3664 = y_cnt == 5'b10100;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:123:16  */
  assign n3665 = n3664 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:126:53  */
  assign n3668 = x_cnt + 4'b0001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:126:58  */
  assign n3669 = inc_x ? n3668 : n3671;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:126:75  */
  assign n3671 = clr_x ? 4'b0000 : x_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:129:26  */
  assign n3674 = x_cnt == 4'b1001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:129:15  */
  assign n3675 = n3674 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:132:57  */
  assign n3678 = off_cnt + 3'b001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:132:62  */
  assign n3679 = inc_off ? n3678 : n3681;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:132:81  */
  assign n3681 = clr_off ? 3'b000 : off_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:135:57  */
  assign n3683 = sel_cnt + 3'b001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:135:62  */
  assign n3684 = inc_sel ? n3683 : n3686;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:135:81  */
  assign n3686 = clr_sel ? 3'b000 : sel_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:138:33  */
  assign n3688 = clr_cnt ? 5'b00000 : n3690;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:139:49  */
  assign n3690 = cnt + 5'b00001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:140:34  */
  assign n3693 = cnt == 5'b10011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:140:25  */
  assign n3694 = n3693 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:144:23  */
  assign n3697 = {1'b1, full};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:144:30  */
  assign n3698 = {n3697, data_del};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:144:53  */
  assign n3699 = copy_dn ? n3698 : n3707;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:23  */
  assign n3701 = {1'b1, full};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:42  */
  assign n3702 = data_del_2[3]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:30  */
  assign n3703 = {n3701, n3702};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:46  */
  assign n3704 = {n3703, blockk};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:55  */
  assign n3705 = {n3704, moving};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:76  */
  assign n3706 = data_del_2[2:0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:145:64  */
  assign n3707 = {n3705, n3706};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:149:23  */
  assign n3708 = cnt[0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:149:27  */
  assign n3709 = n3708 & state1_sel;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:150:35  */
  assign n3710 = stateandcnt | state2_sel;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:151:33  */
  assign n3711 = ~state2_sel;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:151:28  */
  assign n3712 = state_activate & n3711;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:26  */
  assign n3713 = full_reg[0]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:42  */
  assign n3714 = full_reg[1]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:30  */
  assign n3715 = n3713 & n3714;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:58  */
  assign n3716 = full_reg[2]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:46  */
  assign n3717 = n3715 & n3716;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:74  */
  assign n3718 = full_reg[3]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:62  */
  assign n3719 = n3717 & n3718;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:90  */
  assign n3720 = full_reg[4]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:78  */
  assign n3721 = n3719 & n3720;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:106  */
  assign n3722 = full_reg[5]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:94  */
  assign n3723 = n3721 & n3722;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:122  */
  assign n3724 = full_reg[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:110  */
  assign n3725 = n3723 & n3724;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:138  */
  assign n3726 = full_reg[7]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:126  */
  assign n3727 = n3725 & n3726;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:154  */
  assign n3728 = full_reg[8]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:142  */
  assign n3729 = n3727 & n3728;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:170  */
  assign n3730 = full_reg[9]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:158  */
  assign n3731 = n3729 & n3730;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:26  */
  assign n3732 = full_reg[10]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:152:174  */
  assign n3733 = n3731 & n3732;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:43  */
  assign n3734 = full_reg[11]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:31  */
  assign n3735 = n3733 & n3734;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:60  */
  assign n3736 = full_reg[12]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:48  */
  assign n3737 = n3735 & n3736;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:77  */
  assign n3738 = full_reg[13]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:65  */
  assign n3739 = n3737 & n3738;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:94  */
  assign n3740 = full_reg[14]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:82  */
  assign n3741 = n3739 & n3740;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:111  */
  assign n3742 = full_reg[15]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:99  */
  assign n3743 = n3741 & n3742;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:128  */
  assign n3744 = full_reg[16]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:116  */
  assign n3745 = n3743 & n3744;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:145  */
  assign n3746 = full_reg[17]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:133  */
  assign n3747 = n3745 & n3746;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:153:150  */
  assign n3748 = n3747 & full_row;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:154:23  */
  assign n3749 = d_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:157:14  */
  assign n3750 = cnt[4:1]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:157:27  */
  assign n3751 = mux_x_sel ? n3750 : x_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:161:33  */
  assign n3753 = sel_cnt == 3'b000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:161:20  */
  assign n3754 = n3753 ? block1_y : n3757;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:162:33  */
  assign n3756 = sel_cnt == 3'b001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:161:41  */
  assign n3757 = n3756 ? block2_y : n3760;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:163:33  */
  assign n3759 = sel_cnt == 3'b010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:162:41  */
  assign n3760 = n3759 ? block3_y : n3763;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:164:33  */
  assign n3762 = sel_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:163:41  */
  assign n3763 = n3762 ? block4_y : n3769;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:165:45  */
  assign n3764 = {2'b0, off_cnt};  //  uext
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:165:45  */
  assign n3765 = y_cnt - n3764;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:165:79  */
  assign n3767 = sel_cnt == 3'b100;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:165:87  */
  assign n3768 = subtract_offset & n3767;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:164:41  */
  assign n3769 = n3768 ? n3765 : y_cnt;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:170:48  */
  assign n3772 = off_cnt == 3'b000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:170:35  */
  assign n3773 = n3772 ? 16'b0000000000000000 : n3778;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:171:66  */
  assign n3776 = off_cnt == 3'b001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:171:74  */
  assign n3777 = points_enable & n3776;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:170:56  */
  assign n3778 = n3777 ? 16'b0000000000110010 : n3783;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:172:66  */
  assign n3781 = off_cnt == 3'b010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:172:74  */
  assign n3782 = points_enable & n3781;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:171:98  */
  assign n3783 = n3782 ? 16'b0000000001100100 : n3788;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:173:68  */
  assign n3786 = off_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:173:76  */
  assign n3787 = points_enable & n3786;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:172:98  */
  assign n3788 = n3787 ? 16'b0000000011001000 : n3793;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:174:67  */
  assign n3791 = off_cnt == 3'b100;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:174:75  */
  assign n3792 = points_enable & n3791;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:173:100  */
  assign n3793 = n3792 ? 16'b0000000111110100 : 16'b0000000000000000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:178:62  */
  assign n3797 = {5'b0, by};  //  uext
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:178:62  */
  assign n3798 = 10'b0000001010 * n3797; // umul
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:178:77  */
  assign n3799 = {6'b0, bx};  //  uext
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:178:77  */
  assign n3800 = n3798 + n3799;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:178:36  */
  assign n3801 = n3800[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:201:21  */
  assign n3810 = req_del_i ? 5'b00001 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:200:17  */
  assign n3812 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:204:17  */
  assign n3814 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:207:40  */
  assign n3815 = cnt_finished & line_full;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:209:58  */
  assign n3817 = sel_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:209:46  */
  assign n3818 = n3817 & cnt_finished;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:209:21  */
  assign n3820 = n3818 ? 5'b00100 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:207:21  */
  assign n3822 = n3815 ? 5'b00011 : n3820;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:206:17  */
  assign n3824 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:213:32  */
  assign n3826 = $unsigned(sel_cnt) < $unsigned(3'b011);
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:213:40  */
  assign n3827 = cnt_finished & n3826;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:215:35  */
  assign n3829 = sel_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:215:43  */
  assign n3830 = cnt_finished & n3829;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:215:21  */
  assign n3832 = n3830 ? 5'b00100 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:213:21  */
  assign n3834 = n3827 ? 5'b00010 : n3832;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:212:17  */
  assign n3836 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:218:17  */
  assign n3838 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:223:33  */
  assign n3839 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:223:37  */
  assign n3840 = ~n3839;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:225:33  */
  assign n3841 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:225:21  */
  assign n3843 = n3841 ? 5'b01011 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:223:21  */
  assign n3845 = n3840 ? 5'b00100 : n3843;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:221:21  */
  assign n3847 = y19 ? 5'b01101 : n3845;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:220:17  */
  assign n3849 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:228:17  */
  assign n3851 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:233:33  */
  assign n3852 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:235:33  */
  assign n3853 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:235:37  */
  assign n3854 = ~n3853;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:235:21  */
  assign n3856 = n3854 ? 5'b01000 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:233:21  */
  assign n3858 = n3852 ? 5'b01011 : n3856;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:231:21  */
  assign n3860 = y19 ? 5'b10001 : n3858;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:230:17  */
  assign n3862 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:238:17  */
  assign n3864 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:243:30  */
  assign n3865 = ~x9;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:243:21  */
  assign n3867 = n3865 ? 5'b01111 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:241:21  */
  assign n3869 = x9 ? 5'b01110 : n3867;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:240:17  */
  assign n3871 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:246:17  */
  assign n3873 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:251:30  */
  assign n3874 = ~x9;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:251:21  */
  assign n3876 = n3874 ? 5'b10000 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:249:21  */
  assign n3878 = x9 ? 5'b01110 : n3876;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:248:17  */
  assign n3880 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:254:17  */
  assign n3882 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:257:34  */
  assign n3883 = ~req_del_i;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:257:21  */
  assign n3885 = n3883 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:256:17  */
  assign n3887 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:260:17  */
  assign n3889 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:262:17  */
  assign n3891 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:264:17  */
  assign n3893 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:266:17  */
  assign n3895 = state == 5'b10001;
  assign n3896 = {n3895, n3893, n3891, n3889, n3887, n3882, n3880, n3873, n3871, n3864, n3862, n3851, n3849, n3838, n3836, n3824, n3814, n3812};
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:199:13  */
  always @*
    case (n3896)
      18'b100000000000000000: n3908 = 5'b01101;
      18'b010000000000000000: n3908 = 5'b01100;
      18'b001000000000000000: n3908 = 5'b01010;
      18'b000100000000000000: n3908 = 5'b00111;
      18'b000010000000000000: n3908 = n3885;
      18'b000001000000000000: n3908 = 5'b01011;
      18'b000000100000000000: n3908 = n3878;
      18'b000000010000000000: n3908 = 5'b01000;
      18'b000000001000000000: n3908 = n3869;
      18'b000000000100000000: n3908 = 5'b01001;
      18'b000000000010000000: n3908 = n3860;
      18'b000000000001000000: n3908 = 5'b00111;
      18'b000000000000100000: n3908 = n3847;
      18'b000000000000010000: n3908 = 5'b00101;
      18'b000000000000001000: n3908 = n3834;
      18'b000000000000000100: n3908 = n3822;
      18'b000000000000000010: n3908 = 5'b00010;
      18'b000000000000000001: n3908 = n3810;
      default: n3908 = 5'b00000;
    endcase
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:29  */
  assign n3912 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:44  */
  assign n3914 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:50  */
  assign n3915 = x9 & n3914;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:34  */
  assign n3916 = n3912 | n3915;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:74  */
  assign n3918 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:79  */
  assign n3919 = x9 & n3918;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:64  */
  assign n3920 = n3916 | n3919;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:273:18  */
  assign n3921 = n3920 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:275:29  */
  assign n3925 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:275:18  */
  assign n3926 = n3925 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:277:31  */
  assign n3930 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:277:20  */
  assign n3931 = n3930 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:279:31  */
  assign n3935 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:279:20  */
  assign n3936 = n3935 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:281:33  */
  assign n3940 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:281:22  */
  assign n3941 = n3940 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:31  */
  assign n3945 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:46  */
  assign n3947 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:72  */
  assign n3948 = cnt_finished & line_full;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:51  */
  assign n3949 = n3948 & n3947;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:36  */
  assign n3950 = n3945 | n3949;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:23  */
  assign n3952 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:64  */
  assign n3954 = $unsigned(sel_cnt) < $unsigned(3'b011);
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:52  */
  assign n3955 = n3954 & cnt_finished;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:86  */
  assign n3956 = ~line_full;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:72  */
  assign n3957 = n3956 & n3955;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:28  */
  assign n3958 = n3957 & n3952;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:97  */
  assign n3959 = n3950 | n3958;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:285:23  */
  assign n3961 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:285:41  */
  assign n3963 = $unsigned(sel_cnt) < $unsigned(3'b011);
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:285:49  */
  assign n3964 = cnt_finished & n3963;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:285:28  */
  assign n3965 = n3964 & n3961;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:284:94  */
  assign n3966 = n3959 | n3965;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:283:20  */
  assign n3967 = n3966 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:287:34  */
  assign n3971 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:287:23  */
  assign n3972 = n3971 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:289:33  */
  assign n3976 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:289:47  */
  assign n3978 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:289:38  */
  assign n3979 = n3976 | n3978;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:289:22  */
  assign n3980 = n3979 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:291:31  */
  assign n3984 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:291:45  */
  assign n3986 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:291:36  */
  assign n3987 = n3984 | n3986;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:291:20  */
  assign n3988 = n3987 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:32  */
  assign n3992 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:73  */
  assign n3994 = $unsigned(sel_cnt) < $unsigned(3'b011);
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:61  */
  assign n3995 = n3994 & cnt_finished;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:95  */
  assign n3996 = ~line_full;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:81  */
  assign n3997 = n3996 & n3995;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:37  */
  assign n3998 = n3997 & n3992;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:23  */
  assign n4000 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:64  */
  assign n4002 = sel_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:52  */
  assign n4003 = n4002 & cnt_finished;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:86  */
  assign n4004 = ~line_full;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:72  */
  assign n4005 = n4004 & n4003;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:28  */
  assign n4006 = n4005 & n4000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:103  */
  assign n4007 = n3998 | n4006;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:295:23  */
  assign n4009 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:295:41  */
  assign n4011 = $unsigned(sel_cnt) < $unsigned(3'b011);
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:295:49  */
  assign n4012 = cnt_finished & n4011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:295:28  */
  assign n4013 = n4012 & n4009;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:294:94  */
  assign n4014 = n4007 | n4013;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:296:23  */
  assign n4016 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:296:64  */
  assign n4018 = sel_cnt == 3'b011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:296:52  */
  assign n4019 = n4018 & cnt_finished;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:296:28  */
  assign n4020 = n4019 & n4016;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:295:74  */
  assign n4021 = n4014 | n4020;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:293:20  */
  assign n4022 = n4021 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:30  */
  assign n4026 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:45  */
  assign n4027 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:49  */
  assign n4028 = ~n4027;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:35  */
  assign n4029 = n4028 & n4026;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:66  */
  assign n4031 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:72  */
  assign n4032 = x9 & n4031;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:56  */
  assign n4033 = n4029 | n4032;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:96  */
  assign n4035 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:101  */
  assign n4036 = x9 & n4035;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:86  */
  assign n4037 = n4033 | n4036;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:298:18  */
  assign n4038 = n4037 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:300:32  */
  assign n4042 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:300:38  */
  assign n4043 = x9 & n4042;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:300:20  */
  assign n4044 = n4043 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:30  */
  assign n4048 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:43  */
  assign n4049 = ~x9;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:36  */
  assign n4050 = n4049 & n4048;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:60  */
  assign n4052 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:72  */
  assign n4053 = ~x9;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:65  */
  assign n4054 = n4053 & n4052;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:50  */
  assign n4055 = n4050 | n4054;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:302:18  */
  assign n4056 = n4055 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:34  */
  assign n4060 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:49  */
  assign n4062 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:40  */
  assign n4063 = n4060 | n4062;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:63  */
  assign n4065 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:54  */
  assign n4066 = n4063 | n4065;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:304:23  */
  assign n4067 = n4066 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:306:30  */
  assign n4071 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:306:45  */
  assign n4073 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:306:36  */
  assign n4074 = n4071 | n4073;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:306:19  */
  assign n4075 = n4074 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:308:39  */
  assign n4079 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:308:28  */
  assign n4080 = n4079 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:310:33  */
  assign n4084 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:310:22  */
  assign n4085 = n4084 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:312:37  */
  assign n4089 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:312:26  */
  assign n4090 = n4089 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4092 <= 3'b000;
    else
      n4092 <= sel_cnt_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4093 <= 5'b00000;
    else
      n4093 <= y_cnt_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4094 <= 4'b0000;
    else
      n4094 <= x_cnt_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4095 <= 3'b000;
    else
      n4095 <= off_cnt_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4096 <= 5'b00000;
    else
      n4096 <= cnt_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4097 <= 18'b000000000000000000;
    else
      n4097 <= next_full_reg;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4098 <= 6'b000000;
    else
      n4098 <= data_del_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4099 <= 4'b0000;
    else
      n4099 <= data_del_next2;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4100 <= 5'b00000;
    else
      n4100 <= block1_y_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4101 <= 5'b00000;
    else
      n4101 <= block2_y_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4102 <= 5'b00000;
    else
      n4102 <= block3_y_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:82:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4103 <= 5'b00000;
    else
      n4103 <= block4_y_next;
  /* ../../vhdl/rtl/GAME/delete/rtl/delete_ea.vhd:186:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n4104 <= 5'b00000;
    else
      n4104 <= next_state;
endmodule

module descend_ea
  (input  reset_i,
   input  clk_i,
   input  req_des_i,
   output ack_des_o,
   input  [13:0] lp_d_i,
   output [14:0] lp_d_o,
   input  [3:0] block1_x_i,
   input  [3:0] block2_x_i,
   input  [3:0] block3_x_i,
   input  [3:0] block4_x_i,
   input  [4:0] block1_y_i,
   input  [4:0] block2_y_i,
   input  [4:0] block3_y_i,
   input  [4:0] block4_y_i,
   input  [7:0] d_rd_i,
   output [7:0] adr_des_o,
   output [7:0] data_des_o,
   output we_des_o);
  wire ld_pos;
  wire ld_blocks;
  wire down_action;
  wire [13:0] lp_d_next;
  wire [13:0] lp_d;
  wire sel_b1;
  wire sel_b2;
  wire sel_b3;
  wire frozen;
  wire in_range;
  wire in_range_next;
  wire blockk;
  wire [3:0] block1_x_next;
  wire [3:0] block2_x_next;
  wire [3:0] block3_x_next;
  wire [3:0] block4_x_next;
  wire [4:0] block1_y_next;
  wire [4:0] block2_y_next;
  wire [4:0] block3_y_next;
  wire [4:0] block4_y_next;
  wire [3:0] block1_x;
  wire [3:0] block2_x;
  wire [3:0] block3_x;
  wire [3:0] block4_x;
  wire [4:0] block1_y;
  wire [4:0] block2_y;
  wire [4:0] block3_y;
  wire [4:0] block4_y;
  wire [3:0] mux_x;
  wire [4:0] mux_y;
  wire [4:0] state;
  wire [4:0] next_state;
  wire [13:0] n3327;
  wire [3:0] n3328;
  wire [3:0] n3329;
  wire [3:0] n3330;
  wire [3:0] n3331;
  wire [4:0] n3332;
  wire [4:0] n3333;
  wire [4:0] n3334;
  wire [4:0] n3335;
  wire [2:0] n3336;
  wire [4:0] n3341;
  wire [4:0] n3343;
  wire [4:0] n3344;
  wire [4:0] n3345;
  wire [3:0] n3346;
  wire [2:0] n3347;
  wire [1:0] n3348;
  wire [3:0] n3349;
  wire [3:0] n3350;
  wire [3:0] n3351;
  wire [4:0] n3352;
  wire [4:0] n3353;
  wire [4:0] n3354;
  wire [9:0] n3357;
  wire [9:0] n3358;
  wire [9:0] n3359;
  wire [9:0] n3360;
  wire [7:0] n3361;
  wire n3364;
  wire n3366;
  wire n3367;
  wire n3368;
  wire n3370;
  wire n3371;
  wire [4:0] n3380;
  wire n3382;
  wire n3384;
  wire n3386;
  wire n3388;
  wire n3389;
  wire n3390;
  wire [4:0] n3393;
  wire n3395;
  wire n3396;
  wire n3397;
  wire [4:0] n3400;
  wire n3402;
  wire n3403;
  wire n3404;
  wire [4:0] n3407;
  wire n3409;
  wire n3410;
  wire n3411;
  wire [4:0] n3414;
  wire n3416;
  wire n3418;
  wire n3420;
  wire n3422;
  wire n3424;
  wire n3426;
  wire n3428;
  wire n3430;
  wire n3432;
  wire n3434;
  wire n3436;
  wire n3438;
  wire n3440;
  wire n3441;
  wire [4:0] n3443;
  wire n3445;
  wire n3447;
  wire [21:0] n3448;
  reg [4:0] n3466;
  wire n3470;
  wire n3471;
  wire n3472;
  wire n3476;
  wire n3478;
  wire n3479;
  wire n3481;
  wire n3482;
  wire n3484;
  wire n3485;
  wire n3486;
  wire n3490;
  wire n3492;
  wire n3493;
  wire n3494;
  wire n3498;
  wire n3500;
  wire n3501;
  wire n3503;
  wire n3504;
  wire n3505;
  wire n3509;
  wire n3511;
  wire n3512;
  wire n3514;
  wire n3515;
  wire n3516;
  wire n3520;
  wire n3522;
  wire n3523;
  wire n3525;
  wire n3526;
  wire n3527;
  wire n3531;
  wire n3533;
  wire n3534;
  wire n3536;
  wire n3537;
  wire n3538;
  wire n3542;
  wire n3544;
  wire n3545;
  wire n3547;
  wire n3548;
  wire n3550;
  wire n3551;
  wire n3553;
  wire n3554;
  wire n3556;
  wire n3557;
  wire n3559;
  wire n3560;
  wire n3562;
  wire n3563;
  wire n3564;
  wire n3568;
  wire n3570;
  wire n3571;
  wire n3573;
  wire n3574;
  wire n3576;
  wire n3577;
  wire n3578;
  wire n3582;
  wire n3583;
  wire [14:0] n3585;
  wire [7:0] n3586;
  reg [13:0] n3587;
  reg n3588;
  reg [3:0] n3589;
  reg [3:0] n3590;
  reg [3:0] n3591;
  reg [3:0] n3592;
  reg [4:0] n3593;
  reg [4:0] n3594;
  reg [4:0] n3595;
  reg [4:0] n3596;
  reg [4:0] n3597;
  assign ack_des_o = n3583; //(module output)
  assign lp_d_o = n3585; //(module output)
  assign adr_des_o = n3361; //(module output)
  assign data_des_o = n3586; //(module output)
  assign we_des_o = n3564; //(module output)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:32:12  */
  assign ld_pos = n3472; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:32:20  */
  assign ld_blocks = n3505; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:33:12  */
  assign down_action = n3494; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:34:12  */
  assign lp_d_next = n3327; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:34:23  */
  assign lp_d = n3587; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:35:12  */
  assign sel_b1 = n3516; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:35:20  */
  assign sel_b2 = n3527; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:35:28  */
  assign sel_b3 = n3538; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:36:12  */
  assign frozen = n3371; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:36:20  */
  assign in_range = n3588; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:36:30  */
  assign in_range_next = n3368; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:37:12  */
  assign blockk = n3578; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:38:12  */
  assign block1_x_next = n3328; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:38:27  */
  assign block2_x_next = n3329; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:38:42  */
  assign block3_x_next = n3330; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:38:57  */
  assign block4_x_next = n3331; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:39:12  */
  assign block1_y_next = n3332; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:39:27  */
  assign block2_y_next = n3333; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:39:42  */
  assign block3_y_next = n3334; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:39:57  */
  assign block4_y_next = n3335; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:40:12  */
  assign block1_x = n3589; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:40:22  */
  assign block2_x = n3590; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:40:32  */
  assign block3_x = n3591; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:40:42  */
  assign block4_x = n3592; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:41:12  */
  assign block1_y = n3593; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:41:22  */
  assign block2_y = n3594; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:41:32  */
  assign block3_y = n3595; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:41:42  */
  assign block4_y = n3596; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:43:12  */
  assign mux_x = n3349; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:44:12  */
  assign mux_y = n3352; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:46:12  */
  assign state = n3597; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:47:12  */
  assign next_state = n3466; // (signal)
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:84:25  */
  assign n3327 = ld_pos ? lp_d_i : lp_d;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:87:33  */
  assign n3328 = ld_blocks ? block1_x_i : block1_x;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:89:33  */
  assign n3329 = ld_blocks ? block2_x_i : block2_x;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:91:33  */
  assign n3330 = ld_blocks ? block3_x_i : block3_x;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:93:33  */
  assign n3331 = ld_blocks ? block4_x_i : block4_x;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:96:33  */
  assign n3332 = ld_blocks ? block1_y_i : block1_y;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:98:33  */
  assign n3333 = ld_blocks ? block2_y_i : block2_y;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:100:33  */
  assign n3334 = ld_blocks ? block3_y_i : block3_y;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:102:33  */
  assign n3335 = ld_blocks ? block4_y_i : block4_y;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:106:40  */
  assign n3336 = lp_d_next[11:9]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:114:63  */
  assign n3341 = lp_d_next[8:4]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:114:77  */
  assign n3343 = n3341 - 5'b00001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:114:82  */
  assign n3344 = down_action ? n3343 : n3345;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:115:36  */
  assign n3345 = lp_d_next[8:4]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:116:36  */
  assign n3346 = lp_d_next[3:0]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:117:37  */
  assign n3347 = lp_d_next[11:9]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:118:38  */
  assign n3348 = lp_d_next[13:12]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:121:28  */
  assign n3349 = sel_b1 ? block1_x_next : n3350;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:121:46  */
  assign n3350 = sel_b2 ? block2_x_next : n3351;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:122:46  */
  assign n3351 = sel_b3 ? block3_x_next : block4_x_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:126:28  */
  assign n3352 = sel_b1 ? block1_y_next : n3353;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:126:46  */
  assign n3353 = sel_b2 ? block2_y_next : n3354;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:127:46  */
  assign n3354 = sel_b3 ? block3_y_next : block4_y_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:131:62  */
  assign n3357 = {5'b0, mux_y};  //  uext
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:131:62  */
  assign n3358 = 10'b0000001010 * n3357; // umul
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:131:80  */
  assign n3359 = {6'b0, mux_x};  //  uext
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:131:80  */
  assign n3360 = n3358 + n3359;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:131:36  */
  assign n3361 = n3360[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:134:48  */
  assign n3364 = $unsigned(mux_y) >= $unsigned(5'b00000);
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:134:73  */
  assign n3366 = $unsigned(mux_y) <= $unsigned(5'b10011);
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:134:53  */
  assign n3367 = n3366 & n3364;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:134:26  */
  assign n3368 = n3367 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:137:25  */
  assign n3370 = d_rd_i[3]; // extract
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:137:15  */
  assign n3371 = ~n3370;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:159:21  */
  assign n3380 = req_des_i ? 5'b00001 : state;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:158:17  */
  assign n3382 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:162:17  */
  assign n3384 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:164:17  */
  assign n3386 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:166:17  */
  assign n3388 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:169:31  */
  assign n3389 = ~frozen;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:169:37  */
  assign n3390 = in_range & n3389;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:169:21  */
  assign n3393 = n3390 ? 5'b00101 : 5'b10101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:168:17  */
  assign n3395 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:175:31  */
  assign n3396 = ~frozen;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:175:37  */
  assign n3397 = in_range & n3396;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:175:21  */
  assign n3400 = n3397 ? 5'b00110 : 5'b10101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:174:17  */
  assign n3402 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:181:31  */
  assign n3403 = ~frozen;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:181:37  */
  assign n3404 = in_range & n3403;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:181:21  */
  assign n3407 = n3404 ? 5'b00111 : 5'b10101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:180:17  */
  assign n3409 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:187:31  */
  assign n3410 = ~frozen;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:187:37  */
  assign n3411 = in_range & n3410;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:187:21  */
  assign n3414 = n3411 ? 5'b01000 : 5'b10101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:186:17  */
  assign n3416 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:192:17  */
  assign n3418 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:194:17  */
  assign n3420 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:196:17  */
  assign n3422 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:198:17  */
  assign n3424 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:200:17  */
  assign n3426 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:202:17  */
  assign n3428 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:204:17  */
  assign n3430 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:206:17  */
  assign n3432 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:208:17  */
  assign n3434 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:210:17  */
  assign n3436 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:212:17  */
  assign n3438 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:214:17  */
  assign n3440 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:217:34  */
  assign n3441 = ~req_des_i;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:217:21  */
  assign n3443 = n3441 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:216:17  */
  assign n3445 = state == 5'b10100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:220:17  */
  assign n3447 = state == 5'b10101;
  assign n3448 = {n3447, n3445, n3440, n3438, n3436, n3434, n3432, n3430, n3428, n3426, n3424, n3422, n3420, n3418, n3416, n3409, n3402, n3395, n3388, n3386, n3384, n3382};
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:157:13  */
  always @*
    case (n3448)
      22'b1000000000000000000000: n3466 = 5'b10100;
      22'b0100000000000000000000: n3466 = n3443;
      22'b0010000000000000000000: n3466 = 5'b10100;
      22'b0001000000000000000000: n3466 = 5'b10011;
      22'b0000100000000000000000: n3466 = 5'b10010;
      22'b0000010000000000000000: n3466 = 5'b10001;
      22'b0000001000000000000000: n3466 = 5'b10000;
      22'b0000000100000000000000: n3466 = 5'b01111;
      22'b0000000010000000000000: n3466 = 5'b01110;
      22'b0000000001000000000000: n3466 = 5'b01101;
      22'b0000000000100000000000: n3466 = 5'b01100;
      22'b0000000000010000000000: n3466 = 5'b01011;
      22'b0000000000001000000000: n3466 = 5'b01010;
      22'b0000000000000100000000: n3466 = 5'b01001;
      22'b0000000000000010000000: n3466 = n3414;
      22'b0000000000000001000000: n3466 = n3407;
      22'b0000000000000000100000: n3466 = n3400;
      22'b0000000000000000010000: n3466 = n3393;
      22'b0000000000000000001000: n3466 = 5'b00100;
      22'b0000000000000000000100: n3466 = 5'b00011;
      22'b0000000000000000000010: n3466 = 5'b00010;
      22'b0000000000000000000001: n3466 = n3380;
      default: n3466 = 5'b00000;
    endcase
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:227:30  */
  assign n3470 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:227:35  */
  assign n3471 = req_des_i & n3470;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:227:19  */
  assign n3472 = n3471 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:34  */
  assign n3476 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:48  */
  assign n3478 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:39  */
  assign n3479 = n3476 | n3478;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:62  */
  assign n3481 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:53  */
  assign n3482 = n3479 | n3481;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:77  */
  assign n3484 = state == 5'b10101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:68  */
  assign n3485 = n3482 | n3484;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:229:23  */
  assign n3486 = n3485 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:231:35  */
  assign n3490 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:231:49  */
  assign n3492 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:231:40  */
  assign n3493 = n3490 | n3492;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:231:24  */
  assign n3494 = n3493 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:33  */
  assign n3498 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:47  */
  assign n3500 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:38  */
  assign n3501 = n3498 | n3500;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:61  */
  assign n3503 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:52  */
  assign n3504 = n3501 | n3503;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:233:22  */
  assign n3505 = n3504 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:30  */
  assign n3509 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:44  */
  assign n3511 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:35  */
  assign n3512 = n3509 | n3511;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:59  */
  assign n3514 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:50  */
  assign n3515 = n3512 | n3514;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:235:19  */
  assign n3516 = n3515 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:30  */
  assign n3520 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:44  */
  assign n3522 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:35  */
  assign n3523 = n3520 | n3522;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:59  */
  assign n3525 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:50  */
  assign n3526 = n3523 | n3525;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:237:19  */
  assign n3527 = n3526 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:30  */
  assign n3531 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:44  */
  assign n3533 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:35  */
  assign n3534 = n3531 | n3533;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:59  */
  assign n3536 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:50  */
  assign n3537 = n3534 | n3536;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:239:19  */
  assign n3538 = n3537 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:32  */
  assign n3542 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:47  */
  assign n3544 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:38  */
  assign n3545 = n3542 | n3544;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:62  */
  assign n3547 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:53  */
  assign n3548 = n3545 | n3547;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:77  */
  assign n3550 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:68  */
  assign n3551 = n3548 | n3550;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:92  */
  assign n3553 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:83  */
  assign n3554 = n3551 | n3553;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:107  */
  assign n3556 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:98  */
  assign n3557 = n3554 | n3556;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:122  */
  assign n3559 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:113  */
  assign n3560 = n3557 | n3559;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:137  */
  assign n3562 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:128  */
  assign n3563 = n3560 | n3562;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:241:21  */
  assign n3564 = n3563 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:30  */
  assign n3568 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:45  */
  assign n3570 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:36  */
  assign n3571 = n3568 | n3570;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:60  */
  assign n3573 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:51  */
  assign n3574 = n3571 | n3573;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:75  */
  assign n3576 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:66  */
  assign n3577 = n3574 | n3576;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:243:19  */
  assign n3578 = n3577 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:245:33  */
  assign n3582 = state == 5'b10100;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:245:22  */
  assign n3583 = n3582 ? 1'b1 : 1'b0;
  assign n3585 = {n3486, n3348, n3347, n3344, n3346};
  assign n3586 = {1'b1, 1'b0, 1'b0, blockk, 1'b1, n3336};
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3587 <= 14'b00000000000000;
    else
      n3587 <= lp_d_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3588 <= 1'b0;
    else
      n3588 <= in_range_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3589 <= 4'b0000;
    else
      n3589 <= block1_x_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3590 <= 4'b0000;
    else
      n3590 <= block2_x_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3591 <= 4'b0000;
    else
      n3591 <= block3_x_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3592 <= 4'b0000;
    else
      n3592 <= block4_x_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3593 <= 5'b00000;
    else
      n3593 <= block1_y_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3594 <= 5'b00000;
    else
      n3594 <= block2_y_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3595 <= 5'b00000;
    else
      n3595 <= block3_y_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:67:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3596 <= 5'b00000;
    else
      n3596 <= block4_y_next;
  /* ../../vhdl/rtl/GAME/descend/rtl/descend_ea.vhd:145:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3597 <= 5'b00000;
    else
      n3597 <= next_state;
endmodule

module check_ea
  (input  clk_i,
   input  reset_i,
   input  req_check_i,
   input  [3:0] block1_x_i,
   input  [3:0] block2_x_i,
   input  [3:0] block3_x_i,
   input  [3:0] block4_x_i,
   input  [4:0] block1_y_i,
   input  [4:0] block2_y_i,
   input  [4:0] block3_y_i,
   input  [4:0] block4_y_i,
   input  [7:0] d_rd_i,
   output ack_check_o,
   output frozen_o,
   output we_check_o,
   output [7:0] data_check_o,
   output [7:0] check_adr_o);
  wire frozen_data_i;
  wire [3:0] block1_x;
  wire [3:0] block2_x;
  wire [3:0] block3_x;
  wire [3:0] block4_x;
  wire [4:0] block1_y;
  wire [4:0] block2_y;
  wire [4:0] block3_y;
  wire [4:0] block4_y;
  wire [3:0] block1_x_next;
  wire [3:0] block2_x_next;
  wire [3:0] block3_x_next;
  wire [3:0] block4_x_next;
  wire [4:0] block1_y_next;
  wire [4:0] block2_y_next;
  wire [4:0] block3_y_next;
  wire [4:0] block4_y_next;
  wire ld_lp;
  wire ymo;
  wire ld_block;
  wire sel_b1;
  wire sel_b2;
  wire sel_b3;
  wire [3:0] mux_x;
  wire [4:0] mux_y;
  wire [4:0] mux_y_i;
  wire [4:0] state;
  wire [4:0] next_state;
  wire out_range_next;
  wire out_range;
  wire [7:0] data_check_next;
  wire [7:0] data_check;
  wire [3:0] n3028;
  wire [4:0] n3029;
  wire [3:0] n3030;
  wire [4:0] n3031;
  wire [3:0] n3032;
  wire [4:0] n3033;
  wire [3:0] n3034;
  wire [4:0] n3035;
  wire n3036;
  wire n3037;
  wire n3038;
  wire n3039;
  wire n3040;
  wire n3041;
  wire n3042;
  wire n3043;
  wire n3044;
  wire n3045;
  wire n3046;
  wire n3047;
  wire n3048;
  wire n3049;
  wire n3050;
  wire n3054;
  wire n3055;
  wire [3:0] n3056;
  wire [3:0] n3057;
  wire [3:0] n3058;
  wire [4:0] n3059;
  wire [4:0] n3060;
  wire [4:0] n3061;
  wire n3062;
  wire [4:0] n3063;
  wire [4:0] n3065;
  wire n3068;
  wire n3069;
  wire [9:0] n3073;
  wire [9:0] n3074;
  wire [9:0] n3075;
  wire [9:0] n3076;
  wire [7:0] n3077;
  wire [4:0] n3086;
  wire n3088;
  wire n3090;
  wire n3091;
  wire n3092;
  wire n3093;
  wire [4:0] n3096;
  wire n3098;
  wire n3099;
  wire n3100;
  wire n3101;
  wire [4:0] n3104;
  wire n3106;
  wire n3107;
  wire n3108;
  wire n3109;
  wire [4:0] n3112;
  wire n3114;
  wire n3115;
  wire n3116;
  wire n3117;
  wire [4:0] n3120;
  wire n3122;
  wire n3124;
  wire n3126;
  wire n3128;
  wire n3130;
  wire n3132;
  wire n3134;
  wire n3136;
  wire n3138;
  wire n3140;
  wire n3142;
  wire n3144;
  wire n3146;
  wire n3147;
  wire [4:0] n3149;
  wire n3151;
  wire n3152;
  wire [4:0] n3154;
  wire n3156;
  wire [19:0] n3157;
  reg [4:0] n3172;
  wire n3176;
  wire n3178;
  wire n3179;
  wire n3181;
  wire n3182;
  wire n3184;
  wire n3185;
  wire n3186;
  wire n3190;
  wire n3192;
  wire n3193;
  wire n3195;
  wire n3196;
  wire n3198;
  wire n3199;
  wire n3200;
  wire n3204;
  wire n3206;
  wire n3207;
  wire n3209;
  wire n3210;
  wire n3212;
  wire n3213;
  wire n3214;
  wire n3218;
  wire n3220;
  wire n3221;
  wire n3223;
  wire n3224;
  wire n3226;
  wire n3227;
  wire n3228;
  wire n3232;
  wire n3234;
  wire n3235;
  wire n3237;
  wire n3238;
  wire n3240;
  wire n3241;
  wire n3242;
  wire n3246;
  wire n3248;
  wire n3249;
  wire n3250;
  wire n3254;
  wire n3255;
  wire n3259;
  wire n3260;
  wire n3261;
  wire n3265;
  wire n3267;
  wire n3268;
  wire n3270;
  wire n3271;
  wire n3273;
  wire n3274;
  wire n3275;
  wire [7:0] n3277;
  reg [3:0] n3278;
  reg [3:0] n3279;
  reg [3:0] n3280;
  reg [3:0] n3281;
  reg [4:0] n3282;
  reg [4:0] n3283;
  reg [4:0] n3284;
  reg [4:0] n3285;
  reg [4:0] n3286;
  reg n3287;
  reg [7:0] n3288;
  assign ack_check_o = n3250; //(module output)
  assign frozen_o = n3255; //(module output)
  assign we_check_o = n3228; //(module output)
  assign data_check_o = data_check; //(module output)
  assign check_adr_o = n3077; //(module output)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:25:12  */
  assign frozen_data_i = n3055; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:26:12  */
  assign block1_x = n3278; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:26:22  */
  assign block2_x = n3279; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:26:32  */
  assign block3_x = n3280; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:26:42  */
  assign block4_x = n3281; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:27:12  */
  assign block1_y = n3282; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:27:22  */
  assign block2_y = n3283; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:27:32  */
  assign block3_y = n3284; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:27:42  */
  assign block4_y = n3285; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:28:12  */
  assign block1_x_next = n3028; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:28:27  */
  assign block2_x_next = n3030; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:28:42  */
  assign block3_x_next = n3032; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:28:57  */
  assign block4_x_next = n3034; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:29:12  */
  assign block1_y_next = n3029; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:29:27  */
  assign block2_y_next = n3031; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:29:42  */
  assign block3_y_next = n3033; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:29:57  */
  assign block4_y_next = n3035; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:30:12  */
  assign ld_lp = n3261; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:30:19  */
  assign ymo = n3242; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:30:24  */
  assign ld_block = n3275; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:31:12  */
  assign sel_b1 = n3186; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:31:20  */
  assign sel_b2 = n3200; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:31:28  */
  assign sel_b3 = n3214; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:32:12  */
  assign mux_x = n3056; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:33:12  */
  assign mux_y = n3063; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:33:19  */
  assign mux_y_i = n3059; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:35:12  */
  assign state = n3286; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:36:12  */
  assign next_state = n3172; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:37:12  */
  assign out_range_next = n3069; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:37:28  */
  assign out_range = n3287; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:38:12  */
  assign data_check_next = n3277; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:38:29  */
  assign data_check = n3288; // (signal)
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:69:33  */
  assign n3028 = ld_lp ? block1_x_i : block1_x;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:72:33  */
  assign n3029 = ld_lp ? block1_y_i : block1_y;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:75:33  */
  assign n3030 = ld_lp ? block2_x_i : block2_x;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:78:33  */
  assign n3031 = ld_lp ? block2_y_i : block2_y;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:81:33  */
  assign n3032 = ld_lp ? block3_x_i : block3_x;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:84:33  */
  assign n3033 = ld_lp ? block3_y_i : block3_y;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:87:33  */
  assign n3034 = ld_lp ? block4_x_i : block4_x;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:90:33  */
  assign n3035 = ld_lp ? block4_y_i : block4_y;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:93:33  */
  assign n3036 = d_rd_i[0]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:93:37  */
  assign n3037 = ld_block ? n3036 : n3038;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:94:37  */
  assign n3038 = data_check[0]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:95:33  */
  assign n3039 = d_rd_i[1]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:95:37  */
  assign n3040 = ld_block ? n3039 : n3041;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:96:37  */
  assign n3041 = data_check[1]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:97:33  */
  assign n3042 = d_rd_i[2]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:97:37  */
  assign n3043 = ld_block ? n3042 : n3044;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:98:37  */
  assign n3044 = data_check[2]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:99:33  */
  assign n3045 = d_rd_i[5]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:99:37  */
  assign n3046 = ld_block ? n3045 : n3047;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:100:37  */
  assign n3047 = data_check[5]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:101:33  */
  assign n3048 = d_rd_i[6]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:101:37  */
  assign n3049 = ld_block ? n3048 : n3050;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:102:37  */
  assign n3050 = data_check[6]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:109:32  */
  assign n3054 = d_rd_i[3]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:109:22  */
  assign n3055 = ~n3054;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:112:23  */
  assign n3056 = sel_b1 ? block1_x : n3057;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:112:41  */
  assign n3057 = sel_b2 ? block2_x : n3058;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:113:41  */
  assign n3058 = sel_b3 ? block3_x : block4_x;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:117:25  */
  assign n3059 = sel_b1 ? block1_y : n3060;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:117:43  */
  assign n3060 = sel_b2 ? block2_y : n3061;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:118:43  */
  assign n3061 = sel_b3 ? block3_y : block4_y;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:122:31  */
  assign n3062 = ~ymo;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:122:22  */
  assign n3063 = n3062 ? mux_y_i : n3065;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:123:50  */
  assign n3065 = mux_y_i - 5'b00001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:125:48  */
  assign n3068 = $unsigned(mux_y) > $unsigned(5'b10011);
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:125:27  */
  assign n3069 = n3068 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:128:64  */
  assign n3073 = {5'b0, mux_y};  //  uext
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:128:64  */
  assign n3074 = 10'b0000001010 * n3073; // umul
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:128:82  */
  assign n3075 = {6'b0, mux_x};  //  uext
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:128:82  */
  assign n3076 = n3074 + n3075;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:128:38  */
  assign n3077 = n3076[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:149:17  */
  assign n3086 = req_check_i ? 5'b00001 : state;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:148:13  */
  assign n3088 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:152:13  */
  assign n3090 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:155:51  */
  assign n3091 = d_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:155:41  */
  assign n3092 = n3091 & frozen_data_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:155:62  */
  assign n3093 = n3092 | out_range;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:155:17  */
  assign n3096 = n3093 ? 5'b00110 : 5'b00011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:154:13  */
  assign n3098 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:161:51  */
  assign n3099 = d_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:161:41  */
  assign n3100 = n3099 & frozen_data_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:161:62  */
  assign n3101 = n3100 | out_range;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:161:17  */
  assign n3104 = n3101 ? 5'b00110 : 5'b00100;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:160:13  */
  assign n3106 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:167:51  */
  assign n3107 = d_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:167:41  */
  assign n3108 = n3107 & frozen_data_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:167:62  */
  assign n3109 = n3108 | out_range;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:167:17  */
  assign n3112 = n3109 ? 5'b00110 : 5'b00101;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:166:13  */
  assign n3114 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:173:51  */
  assign n3115 = d_rd_i[4]; // extract
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:173:41  */
  assign n3116 = n3115 & frozen_data_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:173:62  */
  assign n3117 = n3116 | out_range;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:173:17  */
  assign n3120 = n3117 ? 5'b00110 : 5'b10011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:172:13  */
  assign n3122 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:178:13  */
  assign n3124 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:180:13  */
  assign n3126 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:182:13  */
  assign n3128 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:184:13  */
  assign n3130 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:186:13  */
  assign n3132 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:188:13  */
  assign n3134 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:190:13  */
  assign n3136 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:192:13  */
  assign n3138 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:194:13  */
  assign n3140 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:196:13  */
  assign n3142 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:198:13  */
  assign n3144 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:200:13  */
  assign n3146 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:203:32  */
  assign n3147 = ~req_check_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:203:17  */
  assign n3149 = n3147 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:202:13  */
  assign n3151 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:207:32  */
  assign n3152 = ~req_check_i;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:207:17  */
  assign n3154 = n3152 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:206:13  */
  assign n3156 = state == 5'b10011;
  assign n3157 = {n3156, n3151, n3146, n3144, n3142, n3140, n3138, n3136, n3134, n3132, n3130, n3128, n3126, n3124, n3122, n3114, n3106, n3098, n3090, n3088};
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:147:9  */
  always @*
    case (n3157)
      20'b10000000000000000000: n3172 = n3154;
      20'b01000000000000000000: n3172 = n3149;
      20'b00100000000000000000: n3172 = 5'b10010;
      20'b00010000000000000000: n3172 = 5'b10001;
      20'b00001000000000000000: n3172 = 5'b10000;
      20'b00000100000000000000: n3172 = 5'b01111;
      20'b00000010000000000000: n3172 = 5'b01110;
      20'b00000001000000000000: n3172 = 5'b01101;
      20'b00000000100000000000: n3172 = 5'b01100;
      20'b00000000010000000000: n3172 = 5'b01011;
      20'b00000000001000000000: n3172 = 5'b01010;
      20'b00000000000100000000: n3172 = 5'b01001;
      20'b00000000000010000000: n3172 = 5'b01000;
      20'b00000000000001000000: n3172 = 5'b00111;
      20'b00000000000000100000: n3172 = n3120;
      20'b00000000000000010000: n3172 = n3112;
      20'b00000000000000001000: n3172 = n3104;
      20'b00000000000000000100: n3172 = n3096;
      20'b00000000000000000010: n3172 = 5'b00010;
      20'b00000000000000000001: n3172 = n3086;
      default: n3172 = 5'b00000;
    endcase
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:30  */
  assign n3176 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:44  */
  assign n3178 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:35  */
  assign n3179 = n3176 | n3178;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:58  */
  assign n3181 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:49  */
  assign n3182 = n3179 | n3181;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:72  */
  assign n3184 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:63  */
  assign n3185 = n3182 | n3184;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:216:19  */
  assign n3186 = n3185 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:30  */
  assign n3190 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:44  */
  assign n3192 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:35  */
  assign n3193 = n3190 | n3192;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:58  */
  assign n3195 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:49  */
  assign n3196 = n3193 | n3195;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:73  */
  assign n3198 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:64  */
  assign n3199 = n3196 | n3198;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:218:19  */
  assign n3200 = n3199 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:30  */
  assign n3204 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:44  */
  assign n3206 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:35  */
  assign n3207 = n3204 | n3206;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:59  */
  assign n3209 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:50  */
  assign n3210 = n3207 | n3209;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:74  */
  assign n3212 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:65  */
  assign n3213 = n3210 | n3212;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:220:19  */
  assign n3214 = n3213 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:34  */
  assign n3218 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:48  */
  assign n3220 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:39  */
  assign n3221 = n3218 | n3220;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:63  */
  assign n3223 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:54  */
  assign n3224 = n3221 | n3223;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:78  */
  assign n3226 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:69  */
  assign n3227 = n3224 | n3226;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:223:23  */
  assign n3228 = n3227 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:27  */
  assign n3232 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:41  */
  assign n3234 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:32  */
  assign n3235 = n3232 | n3234;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:55  */
  assign n3237 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:46  */
  assign n3238 = n3235 | n3237;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:69  */
  assign n3240 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:60  */
  assign n3241 = n3238 | n3240;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:226:16  */
  assign n3242 = n3241 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:229:35  */
  assign n3246 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:229:50  */
  assign n3248 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:229:41  */
  assign n3249 = n3246 | n3248;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:229:24  */
  assign n3250 = n3249 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:232:32  */
  assign n3254 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:232:21  */
  assign n3255 = n3254 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:235:29  */
  assign n3259 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:235:34  */
  assign n3260 = req_check_i & n3259;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:235:18  */
  assign n3261 = n3260 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:32  */
  assign n3265 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:46  */
  assign n3267 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:37  */
  assign n3268 = n3265 | n3267;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:61  */
  assign n3270 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:52  */
  assign n3271 = n3268 | n3270;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:76  */
  assign n3273 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:67  */
  assign n3274 = n3271 | n3273;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:238:21  */
  assign n3275 = n3274 ? 1'b1 : 1'b0;
  assign n3277 = {1'b1, n3049, n3046, 1'b1, 1'b0, n3043, n3040, n3037};
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3278 <= 4'b0000;
    else
      n3278 <= block1_x_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3279 <= 4'b0000;
    else
      n3279 <= block2_x_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3280 <= 4'b0000;
    else
      n3280 <= block3_x_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3281 <= 4'b0000;
    else
      n3281 <= block4_x_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3282 <= 5'b00000;
    else
      n3282 <= block1_y_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3283 <= 5'b00000;
    else
      n3283 <= block2_y_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3284 <= 5'b00000;
    else
      n3284 <= block3_y_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3285 <= 5'b00000;
    else
      n3285 <= block4_y_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:136:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3286 <= 5'b00000;
    else
      n3286 <= next_state;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3287 <= 1'b0;
    else
      n3287 <= out_range_next;
  /* ../../vhdl/rtl/GAME/check/rtl/check_ea.vhd:55:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n3288 <= 8'b00000000;
    else
      n3288 <= data_check_next;
endmodule

module move_ea
  (input  reset_i,
   input  clk_i,
   input  ack_move_i,
   output req_move_o,
   input  lr_i,
   input  rr_i,
   input  dnr_i,
   input  drr_i,
   input  [13:0] lp_m_i,
   output [14:0] lp_m_o,
   input  [3:0] block1_x_i,
   input  [3:0] block2_x_i,
   input  [3:0] block3_x_i,
   input  [3:0] block4_x_i,
   input  [4:0] block1_y_i,
   input  [4:0] block2_y_i,
   input  [4:0] block3_y_i,
   input  [4:0] block4_y_i,
   input  [7:0] d_rd_i,
   output [7:0] adr_move_o,
   output [7:0] data_move_o,
   output we_move_o,
   output [15:0] points_move,
   output timer_reset_o);
  wire left;
  wire right;
  wire turn;
  wire down;
  wire left_next;
  wire right_next;
  wire turn_next;
  wire down_next;
  wire ld_action;
  wire ld_pos;
  wire ld_blocks;
  wire apply_action;
  wire [13:0] lp_m_next;
  wire [13:0] lp_m;
  wire sel_b1;
  wire sel_b2;
  wire sel_b3;
  wire frozen;
  wire in_range;
  wire in_range_next;
  wire blockk;
  wire [3:0] block1_x_next;
  wire [3:0] block2_x_next;
  wire [3:0] block3_x_next;
  wire [3:0] block4_x_next;
  wire [4:0] block1_y_next;
  wire [4:0] block2_y_next;
  wire [4:0] block3_y_next;
  wire [4:0] block4_y_next;
  wire [3:0] block1_x;
  wire [3:0] block2_x;
  wire [3:0] block3_x;
  wire [3:0] block4_x;
  wire [4:0] block1_y;
  wire [4:0] block2_y;
  wire [4:0] block3_y;
  wire [4:0] block4_y;
  wire [13:0] req_cnt;
  wire [13:0] req_cnt_next;
  wire req_cnt_rst;
  wire points_enable;
  wire [3:0] mux_x;
  wire [4:0] mux_y;
  wire [4:0] state;
  wire [4:0] next_state;
  wire n2641;
  wire n2642;
  wire n2643;
  wire n2644;
  wire [13:0] n2645;
  wire [3:0] n2646;
  wire [3:0] n2647;
  wire [3:0] n2648;
  wire [3:0] n2649;
  wire [4:0] n2650;
  wire [4:0] n2651;
  wire [4:0] n2652;
  wire [4:0] n2653;
  wire [2:0] n2654;
  wire [4:0] n2659;
  wire [4:0] n2661;
  wire n2662;
  wire [4:0] n2663;
  wire [4:0] n2664;
  wire [3:0] n2665;
  wire [3:0] n2667;
  wire n2668;
  wire [3:0] n2669;
  wire [3:0] n2670;
  wire [3:0] n2672;
  wire n2673;
  wire [3:0] n2674;
  wire [3:0] n2675;
  wire [1:0] n2676;
  wire [1:0] n2678;
  wire n2679;
  wire [1:0] n2680;
  wire [1:0] n2681;
  wire [2:0] n2682;
  wire [3:0] n2683;
  wire [3:0] n2684;
  wire [3:0] n2685;
  wire [4:0] n2686;
  wire [4:0] n2687;
  wire [4:0] n2688;
  wire [9:0] n2691;
  wire [9:0] n2692;
  wire [9:0] n2693;
  wire [9:0] n2694;
  wire [7:0] n2695;
  wire n2697;
  wire [15:0] n2698;
  wire n2702;
  wire n2704;
  wire n2705;
  wire n2707;
  wire n2709;
  wire n2710;
  wire n2711;
  wire n2712;
  wire n2714;
  wire n2715;
  wire [13:0] n2717;
  wire n2718;
  wire [13:0] n2719;
  wire n2728;
  wire n2729;
  wire n2730;
  wire [4:0] n2732;
  wire n2734;
  wire n2736;
  wire [4:0] n2738;
  wire [4:0] n2740;
  wire n2742;
  wire n2744;
  wire n2746;
  wire n2748;
  wire n2749;
  wire n2750;
  wire [4:0] n2753;
  wire n2755;
  wire n2756;
  wire n2757;
  wire [4:0] n2760;
  wire n2762;
  wire n2763;
  wire n2764;
  wire [4:0] n2767;
  wire n2769;
  wire n2770;
  wire n2771;
  wire [4:0] n2774;
  wire n2776;
  wire n2778;
  wire n2780;
  wire n2782;
  wire n2784;
  wire n2786;
  wire n2788;
  wire n2790;
  wire n2792;
  wire n2794;
  wire n2796;
  wire n2798;
  wire n2800;
  wire n2801;
  wire [4:0] n2803;
  wire n2805;
  wire n2807;
  wire [22:0] n2808;
  reg [4:0] n2826;
  wire n2830;
  wire n2831;
  wire n2835;
  wire n2836;
  wire n2837;
  wire n2838;
  wire n2839;
  wire n2840;
  wire n2844;
  wire n2845;
  wire n2846;
  wire n2850;
  wire n2852;
  wire n2853;
  wire n2854;
  wire n2858;
  wire n2860;
  wire n2861;
  wire n2863;
  wire n2864;
  wire n2866;
  wire n2867;
  wire n2868;
  wire n2872;
  wire n2874;
  wire n2875;
  wire n2877;
  wire n2878;
  wire n2879;
  wire n2883;
  wire n2885;
  wire n2886;
  wire n2888;
  wire n2889;
  wire n2890;
  wire n2894;
  wire n2896;
  wire n2897;
  wire n2899;
  wire n2900;
  wire n2901;
  wire n2905;
  wire n2907;
  wire n2908;
  wire n2910;
  wire n2911;
  wire n2912;
  wire n2916;
  wire n2918;
  wire n2919;
  wire n2921;
  wire n2922;
  wire n2924;
  wire n2925;
  wire n2927;
  wire n2928;
  wire n2930;
  wire n2931;
  wire n2933;
  wire n2934;
  wire n2936;
  wire n2937;
  wire n2938;
  wire n2942;
  wire n2944;
  wire n2945;
  wire n2947;
  wire n2948;
  wire n2950;
  wire n2951;
  wire n2952;
  wire n2956;
  wire n2958;
  wire n2959;
  wire n2960;
  wire n2964;
  wire n2965;
  wire n2966;
  wire [14:0] n2968;
  wire [7:0] n2969;
  reg n2970;
  reg n2971;
  reg n2972;
  reg n2973;
  reg [13:0] n2974;
  wire n2975;
  wire n2976;
  reg n2977;
  reg [3:0] n2978;
  reg [3:0] n2979;
  reg [3:0] n2980;
  reg [3:0] n2981;
  reg [4:0] n2982;
  reg [4:0] n2983;
  reg [4:0] n2984;
  reg [4:0] n2985;
  wire n2986;
  wire [13:0] n2987;
  reg [13:0] n2988;
  reg [4:0] n2989;
  assign req_move_o = n2960; //(module output)
  assign lp_m_o = n2968; //(module output)
  assign adr_move_o = n2695; //(module output)
  assign data_move_o = n2969; //(module output)
  assign we_move_o = n2938; //(module output)
  assign points_move = n2698; //(module output)
  assign timer_reset_o = points_enable; //(module output)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:36:12  */
  assign left = n2970; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:36:18  */
  assign right = n2971; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:36:25  */
  assign turn = n2972; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:36:31  */
  assign down = n2973; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:37:12  */
  assign left_next = n2641; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:37:23  */
  assign right_next = n2642; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:37:35  */
  assign turn_next = n2643; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:37:46  */
  assign down_next = n2644; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:39:12  */
  assign ld_action = n2840; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:39:23  */
  assign ld_pos = n2846; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:39:31  */
  assign ld_blocks = n2879; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:40:12  */
  assign apply_action = n2854; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:41:12  */
  assign lp_m_next = n2645; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:41:23  */
  assign lp_m = n2974; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:42:12  */
  assign sel_b1 = n2890; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:42:20  */
  assign sel_b2 = n2901; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:42:28  */
  assign sel_b3 = n2912; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:43:12  */
  assign frozen = n2715; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:43:20  */
  assign in_range = n2977; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:43:30  */
  assign in_range_next = n2712; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:44:12  */
  assign blockk = n2952; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:45:12  */
  assign block1_x_next = n2646; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:45:27  */
  assign block2_x_next = n2647; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:45:42  */
  assign block3_x_next = n2648; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:45:57  */
  assign block4_x_next = n2649; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:46:12  */
  assign block1_y_next = n2650; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:46:27  */
  assign block2_y_next = n2651; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:46:42  */
  assign block3_y_next = n2652; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:46:57  */
  assign block4_y_next = n2653; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:47:12  */
  assign block1_x = n2978; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:47:22  */
  assign block2_x = n2979; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:47:32  */
  assign block3_x = n2980; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:47:42  */
  assign block4_x = n2981; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:48:12  */
  assign block1_y = n2982; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:48:22  */
  assign block2_y = n2983; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:48:32  */
  assign block3_y = n2984; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:48:42  */
  assign block4_y = n2985; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:49:12  */
  assign req_cnt = n2988; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:49:21  */
  assign req_cnt_next = n2719; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:50:12  */
  assign req_cnt_rst = n2831; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:51:12  */
  assign points_enable = n2966; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:53:12  */
  assign mux_x = n2683; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:54:12  */
  assign mux_y = n2686; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:56:12  */
  assign state = n2989; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:57:12  */
  assign next_state = n2826; // (signal)
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:102:23  */
  assign n2641 = ld_action ? lr_i : left;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:104:24  */
  assign n2642 = ld_action ? rr_i : right;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:106:24  */
  assign n2643 = ld_action ? drr_i : turn;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:108:24  */
  assign n2644 = ld_action ? dnr_i : down;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:111:25  */
  assign n2645 = ld_pos ? lp_m_i : lp_m;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:114:33  */
  assign n2646 = ld_blocks ? block1_x_i : block1_x;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:116:33  */
  assign n2647 = ld_blocks ? block2_x_i : block2_x;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:118:33  */
  assign n2648 = ld_blocks ? block3_x_i : block3_x;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:120:33  */
  assign n2649 = ld_blocks ? block4_x_i : block4_x;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:123:33  */
  assign n2650 = ld_blocks ? block1_y_i : block1_y;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:125:33  */
  assign n2651 = ld_blocks ? block2_y_i : block2_y;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:127:33  */
  assign n2652 = ld_blocks ? block3_y_i : block3_y;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:129:33  */
  assign n2653 = ld_blocks ? block4_y_i : block4_y;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:133:41  */
  assign n2654 = lp_m_next[11:9]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:141:63  */
  assign n2659 = lp_m_next[8:4]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:141:77  */
  assign n2661 = n2659 - 5'b00001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:141:98  */
  assign n2662 = apply_action & down;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:141:82  */
  assign n2663 = n2662 ? n2661 : n2664;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:142:36  */
  assign n2664 = lp_m_next[8:4]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:143:63  */
  assign n2665 = lp_m_next[3:0]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:143:77  */
  assign n2667 = n2665 - 4'b0001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:143:98  */
  assign n2668 = apply_action & left;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:143:82  */
  assign n2669 = n2668 ? n2667 : n2674;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:144:63  */
  assign n2670 = lp_m_next[3:0]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:144:77  */
  assign n2672 = n2670 + 4'b0001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:144:99  */
  assign n2673 = apply_action & right;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:143:121  */
  assign n2674 = n2673 ? n2672 : n2675;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:145:36  */
  assign n2675 = lp_m_next[3:0]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:146:65  */
  assign n2676 = lp_m_next[13:12]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:146:81  */
  assign n2678 = n2676 + 2'b01;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:146:102  */
  assign n2679 = apply_action & turn;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:146:86  */
  assign n2680 = n2679 ? n2678 : n2681;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:147:38  */
  assign n2681 = lp_m_next[13:12]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:148:37  */
  assign n2682 = lp_m_next[11:9]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:151:28  */
  assign n2683 = sel_b1 ? block1_x_next : n2684;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:151:46  */
  assign n2684 = sel_b2 ? block2_x_next : n2685;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:152:46  */
  assign n2685 = sel_b3 ? block3_x_next : block4_x_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:156:28  */
  assign n2686 = sel_b1 ? block1_y_next : n2687;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:156:46  */
  assign n2687 = sel_b2 ? block2_y_next : n2688;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:157:46  */
  assign n2688 = sel_b3 ? block3_y_next : block4_y_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:161:63  */
  assign n2691 = {5'b0, mux_y};  //  uext
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:161:63  */
  assign n2692 = 10'b0000001010 * n2691; // umul
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:161:81  */
  assign n2693 = {6'b0, mux_x};  //  uext
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:161:81  */
  assign n2694 = n2692 + n2693;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:161:37  */
  assign n2695 = n2694[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:164:71  */
  assign n2697 = points_enable & down;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:164:55  */
  assign n2698 = n2697 ? 16'b0000000000000010 : 16'b0000000000000000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:48  */
  assign n2702 = $unsigned(mux_x) >= $unsigned(4'b0000);
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:73  */
  assign n2704 = $unsigned(mux_x) <= $unsigned(4'b1001);
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:53  */
  assign n2705 = n2704 & n2702;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:100  */
  assign n2707 = $unsigned(mux_y) >= $unsigned(5'b00000);
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:125  */
  assign n2709 = $unsigned(mux_y) <= $unsigned(5'b10011);
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:105  */
  assign n2710 = n2709 & n2707;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:79  */
  assign n2711 = n2710 & n2705;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:168:26  */
  assign n2712 = n2711 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:171:25  */
  assign n2714 = d_rd_i[3]; // extract
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:171:15  */
  assign n2715 = ~n2714;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:174:29  */
  assign n2717 = req_cnt + 14'b00000000000001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:174:50  */
  assign n2718 = ~req_cnt_rst;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:174:33  */
  assign n2719 = n2718 ? n2717 : 14'b00000000000000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:201:35  */
  assign n2728 = lr_i | rr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:201:49  */
  assign n2729 = n2728 | dnr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:201:64  */
  assign n2730 = n2729 | drr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:201:21  */
  assign n2732 = n2730 ? 5'b00001 : state;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:200:17  */
  assign n2734 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:207:35  */
  assign n2736 = req_cnt == 14'b10011100010000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:207:21  */
  assign n2738 = n2736 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:205:21  */
  assign n2740 = ack_move_i ? 5'b00010 : n2738;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:204:17  */
  assign n2742 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:210:17  */
  assign n2744 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:212:17  */
  assign n2746 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:214:17  */
  assign n2748 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:217:31  */
  assign n2749 = ~frozen;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:217:37  */
  assign n2750 = in_range & n2749;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:217:21  */
  assign n2753 = n2750 ? 5'b00110 : 5'b10110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:216:17  */
  assign n2755 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:223:31  */
  assign n2756 = ~frozen;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:223:37  */
  assign n2757 = in_range & n2756;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:223:21  */
  assign n2760 = n2757 ? 5'b00111 : 5'b10110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:222:17  */
  assign n2762 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:229:31  */
  assign n2763 = ~frozen;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:229:37  */
  assign n2764 = in_range & n2763;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:229:21  */
  assign n2767 = n2764 ? 5'b01000 : 5'b10110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:228:17  */
  assign n2769 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:235:31  */
  assign n2770 = ~frozen;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:235:37  */
  assign n2771 = in_range & n2770;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:235:21  */
  assign n2774 = n2771 ? 5'b01001 : 5'b10110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:234:17  */
  assign n2776 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:240:17  */
  assign n2778 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:242:17  */
  assign n2780 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:244:17  */
  assign n2782 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:246:17  */
  assign n2784 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:248:17  */
  assign n2786 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:250:17  */
  assign n2788 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:252:17  */
  assign n2790 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:254:17  */
  assign n2792 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:256:17  */
  assign n2794 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:258:17  */
  assign n2796 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:260:17  */
  assign n2798 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:262:17  */
  assign n2800 = state == 5'b10100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:265:35  */
  assign n2801 = ~ack_move_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:265:21  */
  assign n2803 = n2801 ? 5'b00000 : state;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:264:17  */
  assign n2805 = state == 5'b10101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:268:17  */
  assign n2807 = state == 5'b10110;
  assign n2808 = {n2807, n2805, n2800, n2798, n2796, n2794, n2792, n2790, n2788, n2786, n2784, n2782, n2780, n2778, n2776, n2769, n2762, n2755, n2748, n2746, n2744, n2742, n2734};
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:199:13  */
  always @*
    case (n2808)
      23'b10000000000000000000000: n2826 = 5'b10101;
      23'b01000000000000000000000: n2826 = n2803;
      23'b00100000000000000000000: n2826 = 5'b10101;
      23'b00010000000000000000000: n2826 = 5'b10100;
      23'b00001000000000000000000: n2826 = 5'b10011;
      23'b00000100000000000000000: n2826 = 5'b10010;
      23'b00000010000000000000000: n2826 = 5'b10001;
      23'b00000001000000000000000: n2826 = 5'b10000;
      23'b00000000100000000000000: n2826 = 5'b01111;
      23'b00000000010000000000000: n2826 = 5'b01110;
      23'b00000000001000000000000: n2826 = 5'b01101;
      23'b00000000000100000000000: n2826 = 5'b01100;
      23'b00000000000010000000000: n2826 = 5'b01011;
      23'b00000000000001000000000: n2826 = 5'b01010;
      23'b00000000000000100000000: n2826 = n2774;
      23'b00000000000000010000000: n2826 = n2767;
      23'b00000000000000001000000: n2826 = n2760;
      23'b00000000000000000100000: n2826 = n2753;
      23'b00000000000000000010000: n2826 = 5'b00101;
      23'b00000000000000000001000: n2826 = 5'b00100;
      23'b00000000000000000000100: n2826 = 5'b00011;
      23'b00000000000000000000010: n2826 = n2740;
      23'b00000000000000000000001: n2826 = n2732;
      default: n2826 = 5'b00000;
    endcase
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:276:35  */
  assign n2830 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:276:24  */
  assign n2831 = n2830 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:33  */
  assign n2835 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:54  */
  assign n2836 = lr_i | rr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:68  */
  assign n2837 = n2836 | dnr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:83  */
  assign n2838 = n2837 | drr_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:38  */
  assign n2839 = n2838 & n2835;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:278:22  */
  assign n2840 = n2839 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:280:30  */
  assign n2844 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:280:35  */
  assign n2845 = ack_move_i & n2844;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:280:19  */
  assign n2846 = n2845 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:282:36  */
  assign n2850 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:282:50  */
  assign n2852 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:282:41  */
  assign n2853 = n2850 | n2852;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:282:25  */
  assign n2854 = n2853 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:34  */
  assign n2858 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:48  */
  assign n2860 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:39  */
  assign n2861 = n2858 | n2860;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:62  */
  assign n2863 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:53  */
  assign n2864 = n2861 | n2863;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:77  */
  assign n2866 = state == 5'b10110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:68  */
  assign n2867 = n2864 | n2866;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:284:23  */
  assign n2868 = n2867 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:33  */
  assign n2872 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:47  */
  assign n2874 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:38  */
  assign n2875 = n2872 | n2874;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:62  */
  assign n2877 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:53  */
  assign n2878 = n2875 | n2877;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:286:22  */
  assign n2879 = n2878 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:30  */
  assign n2883 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:44  */
  assign n2885 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:35  */
  assign n2886 = n2883 | n2885;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:59  */
  assign n2888 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:50  */
  assign n2889 = n2886 | n2888;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:288:19  */
  assign n2890 = n2889 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:30  */
  assign n2894 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:44  */
  assign n2896 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:35  */
  assign n2897 = n2894 | n2896;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:59  */
  assign n2899 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:50  */
  assign n2900 = n2897 | n2899;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:290:19  */
  assign n2901 = n2900 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:30  */
  assign n2905 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:44  */
  assign n2907 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:35  */
  assign n2908 = n2905 | n2907;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:59  */
  assign n2910 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:50  */
  assign n2911 = n2908 | n2910;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:292:19  */
  assign n2912 = n2911 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:33  */
  assign n2916 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:48  */
  assign n2918 = state == 5'b01100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:39  */
  assign n2919 = n2916 | n2918;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:63  */
  assign n2921 = state == 5'b01101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:54  */
  assign n2922 = n2919 | n2921;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:78  */
  assign n2924 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:69  */
  assign n2925 = n2922 | n2924;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:93  */
  assign n2927 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:84  */
  assign n2928 = n2925 | n2927;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:108  */
  assign n2930 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:99  */
  assign n2931 = n2928 | n2930;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:123  */
  assign n2933 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:114  */
  assign n2934 = n2931 | n2933;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:138  */
  assign n2936 = state == 5'b10100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:129  */
  assign n2937 = n2934 | n2936;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:294:22  */
  assign n2938 = n2937 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:30  */
  assign n2942 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:45  */
  assign n2944 = state == 5'b10010;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:36  */
  assign n2945 = n2942 | n2944;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:60  */
  assign n2947 = state == 5'b10011;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:51  */
  assign n2948 = n2945 | n2947;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:75  */
  assign n2950 = state == 5'b10100;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:66  */
  assign n2951 = n2948 | n2950;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:296:19  */
  assign n2952 = n2951 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:298:34  */
  assign n2956 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:298:48  */
  assign n2958 = state == 5'b10101;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:298:39  */
  assign n2959 = n2956 | n2958;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:298:23  */
  assign n2960 = n2959 ? 1'b0 : 1'b1;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:300:37  */
  assign n2964 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:300:42  */
  assign n2965 = down & n2964;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:300:26  */
  assign n2966 = n2965 ? 1'b1 : 1'b0;
  assign n2968 = {n2868, n2680, n2682, n2663, n2669};
  assign n2969 = {1'b1, 1'b0, 1'b0, blockk, 1'b1, n2654};
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2970 <= 1'b0;
    else
      n2970 <= left_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2971 <= 1'b0;
    else
      n2971 <= right_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2972 <= 1'b0;
    else
      n2972 <= turn_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2973 <= 1'b0;
    else
      n2973 <= down_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2974 <= 14'b00000000000000;
    else
      n2974 <= lp_m_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:43:20  */
  assign n2975 = ~reset_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  assign n2976 = n2975 ? in_range_next : in_range;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i)
    n2977 <= n2976;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2978 <= 4'b0000;
    else
      n2978 <= block1_x_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2979 <= 4'b0000;
    else
      n2979 <= block2_x_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2980 <= 4'b0000;
    else
      n2980 <= block3_x_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2981 <= 4'b0000;
    else
      n2981 <= block4_x_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2982 <= 5'b00000;
    else
      n2982 <= block1_y_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2983 <= 5'b00000;
    else
      n2983 <= block2_y_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2984 <= 5'b00000;
    else
      n2984 <= block3_y_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2985 <= 5'b00000;
    else
      n2985 <= block4_y_next;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:49:12  */
  assign n2986 = ~reset_i;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  assign n2987 = n2986 ? req_cnt_next : req_cnt;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:78:9  */
  always @(posedge clk_i)
    n2988 <= n2987;
  /* ../../vhdl/rtl/GAME/move/rtl/move_ea.vhd:186:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2989 <= 5'b00000;
    else
      n2989 <= next_state;
endmodule

module set_ea
  (input  reset_i,
   input  req_set_i,
   input  clk_i,
   output ack_set_o,
   output game_over_o,
   input  [2:0] typ_s_i,
   output [14:0] lp_s_o,
   input  [3:0] block1_x_i,
   input  [3:0] block2_x_i,
   input  [3:0] block3_x_i,
   input  [3:0] block4_x_i,
   input  [4:0] block1_y_i,
   input  [4:0] block2_y_i,
   input  [4:0] block3_y_i,
   input  [4:0] block4_y_i,
   input  [7:0] d_rd_i,
   output [7:0] adr_set_o,
   output [7:0] data_set_o,
   output we_set_o);
  wire sel_b1;
  wire sel_b2;
  wire sel_b3;
  wire frozen;
  wire ld_s;
  wire [3:0] block1_x;
  wire [3:0] block2_x;
  wire [3:0] block3_x;
  wire [3:0] block4_x;
  wire [4:0] block1_y;
  wire [4:0] block2_y;
  wire [4:0] block3_y;
  wire [4:0] block4_y;
  wire [3:0] block1_x_next;
  wire [3:0] block2_x_next;
  wire [3:0] block3_x_next;
  wire [3:0] block4_x_next;
  wire [4:0] block1_y_next;
  wire [4:0] block2_y_next;
  wire [4:0] block3_y_next;
  wire [4:0] block4_y_next;
  wire ld_blocks;
  wire [3:0] mux_x;
  wire [4:0] mux_y;
  wire [3:0] state;
  wire [3:0] next_state;
  wire [3:0] n2393;
  wire [3:0] n2394;
  wire [3:0] n2395;
  wire [3:0] n2396;
  wire [4:0] n2397;
  wire [4:0] n2398;
  wire [4:0] n2399;
  wire [4:0] n2400;
  wire n2406;
  wire n2407;
  wire [3:0] n2411;
  wire [3:0] n2412;
  wire [3:0] n2413;
  wire [4:0] n2414;
  wire [4:0] n2415;
  wire [4:0] n2416;
  wire [9:0] n2419;
  wire [9:0] n2420;
  wire [9:0] n2421;
  wire [9:0] n2422;
  wire [7:0] n2423;
  wire [3:0] n2432;
  wire n2434;
  wire n2436;
  wire n2438;
  wire n2440;
  wire n2441;
  wire [3:0] n2444;
  wire n2446;
  wire n2447;
  wire [3:0] n2450;
  wire n2452;
  wire n2453;
  wire [3:0] n2456;
  wire n2458;
  wire n2459;
  wire [3:0] n2462;
  wire n2464;
  wire n2466;
  wire n2468;
  wire n2470;
  wire n2472;
  wire n2473;
  wire [3:0] n2475;
  wire n2477;
  wire n2478;
  wire [3:0] n2480;
  wire n2482;
  wire n2484;
  wire [14:0] n2485;
  reg [3:0] n2495;
  wire n2499;
  wire n2500;
  wire n2504;
  wire n2505;
  wire n2509;
  wire n2511;
  wire n2512;
  wire n2513;
  wire n2517;
  wire n2519;
  wire n2520;
  wire n2521;
  wire n2525;
  wire n2527;
  wire n2528;
  wire n2529;
  wire n2533;
  wire n2535;
  wire n2536;
  wire n2538;
  wire n2539;
  wire n2541;
  wire n2542;
  wire n2543;
  wire n2547;
  wire n2549;
  wire n2550;
  wire n2551;
  wire n2555;
  wire n2557;
  wire n2558;
  wire n2559;
  wire [14:0] n2561;
  wire [7:0] n2562;
  wire n2563;
  wire [3:0] n2564;
  reg [3:0] n2565;
  wire n2566;
  wire [3:0] n2567;
  reg [3:0] n2568;
  wire n2569;
  wire [3:0] n2570;
  reg [3:0] n2571;
  wire n2572;
  wire [3:0] n2573;
  reg [3:0] n2574;
  wire n2575;
  wire [4:0] n2576;
  reg [4:0] n2577;
  wire n2578;
  wire [4:0] n2579;
  reg [4:0] n2580;
  wire n2581;
  wire [4:0] n2582;
  reg [4:0] n2583;
  wire n2584;
  wire [4:0] n2585;
  reg [4:0] n2586;
  reg [3:0] n2587;
  assign ack_set_o = n2559; //(module output)
  assign game_over_o = n2551; //(module output)
  assign lp_s_o = n2561; //(module output)
  assign adr_set_o = n2423; //(module output)
  assign data_set_o = n2562; //(module output)
  assign we_set_o = n2543; //(module output)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:31:12  */
  assign sel_b1 = n2513; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:31:20  */
  assign sel_b2 = n2521; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:31:28  */
  assign sel_b3 = n2529; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:32:12  */
  assign frozen = n2407; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:33:12  */
  assign ld_s = n2500; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:12  */
  assign block1_x = n2565; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:22  */
  assign block2_x = n2568; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:32  */
  assign block3_x = n2571; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:42  */
  assign block4_x = n2574; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:12  */
  assign block1_y = n2577; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:22  */
  assign block2_y = n2580; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:32  */
  assign block3_y = n2583; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:42  */
  assign block4_y = n2586; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:36:12  */
  assign block1_x_next = n2393; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:36:27  */
  assign block2_x_next = n2394; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:36:42  */
  assign block3_x_next = n2395; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:36:57  */
  assign block4_x_next = n2396; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:37:12  */
  assign block1_y_next = n2397; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:37:27  */
  assign block2_y_next = n2398; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:37:42  */
  assign block3_y_next = n2399; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:37:57  */
  assign block4_y_next = n2400; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:38:12  */
  assign ld_blocks = n2505; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:40:12  */
  assign mux_x = n2411; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:41:12  */
  assign mux_y = n2414; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:43:12  */
  assign state = n2587; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:44:12  */
  assign next_state = n2495; // (signal)
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:62:33  */
  assign n2393 = ld_blocks ? block1_x_i : block1_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:64:33  */
  assign n2394 = ld_blocks ? block2_x_i : block2_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:66:33  */
  assign n2395 = ld_blocks ? block3_x_i : block3_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:68:33  */
  assign n2396 = ld_blocks ? block4_x_i : block4_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:70:33  */
  assign n2397 = ld_blocks ? block1_y_i : block1_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:72:33  */
  assign n2398 = ld_blocks ? block2_y_i : block2_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:74:33  */
  assign n2399 = ld_blocks ? block3_y_i : block3_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:76:33  */
  assign n2400 = ld_blocks ? block4_y_i : block4_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:88:25  */
  assign n2406 = d_rd_i[3]; // extract
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:88:15  */
  assign n2407 = ~n2406;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:98:23  */
  assign n2411 = sel_b1 ? block1_x : n2412;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:98:41  */
  assign n2412 = sel_b2 ? block2_x : n2413;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:99:41  */
  assign n2413 = sel_b3 ? block3_x : block4_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:103:23  */
  assign n2414 = sel_b1 ? block1_y : n2415;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:103:41  */
  assign n2415 = sel_b2 ? block2_y : n2416;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:104:41  */
  assign n2416 = sel_b3 ? block3_y : block4_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:108:62  */
  assign n2419 = {5'b0, mux_y};  //  uext
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:108:62  */
  assign n2420 = 10'b0000001010 * n2419; // umul
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:108:80  */
  assign n2421 = {6'b0, mux_x};  //  uext
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:108:80  */
  assign n2422 = n2420 + n2421;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:108:36  */
  assign n2423 = n2422[7:0];  // trunc
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:129:21  */
  assign n2432 = req_set_i ? 4'b0001 : state;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:128:17  */
  assign n2434 = state == 4'b0000;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:132:17  */
  assign n2436 = state == 4'b0001;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:134:17  */
  assign n2438 = state == 4'b0010;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:136:17  */
  assign n2440 = state == 4'b0011;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:139:31  */
  assign n2441 = ~frozen;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:139:21  */
  assign n2444 = n2441 ? 4'b0101 : 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:138:17  */
  assign n2446 = state == 4'b0100;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:145:31  */
  assign n2447 = ~frozen;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:145:21  */
  assign n2450 = n2447 ? 4'b0110 : 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:144:17  */
  assign n2452 = state == 4'b0101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:151:31  */
  assign n2453 = ~frozen;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:151:21  */
  assign n2456 = n2453 ? 4'b0111 : 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:150:17  */
  assign n2458 = state == 4'b0110;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:157:31  */
  assign n2459 = ~frozen;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:157:21  */
  assign n2462 = n2459 ? 4'b1000 : 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:156:17  */
  assign n2464 = state == 4'b0111;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:162:17  */
  assign n2466 = state == 4'b1000;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:164:17  */
  assign n2468 = state == 4'b1001;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:166:17  */
  assign n2470 = state == 4'b1010;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:168:17  */
  assign n2472 = state == 4'b1011;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:171:34  */
  assign n2473 = ~req_set_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:171:21  */
  assign n2475 = n2473 ? 4'b0000 : state;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:170:17  */
  assign n2477 = state == 4'b1100;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:175:34  */
  assign n2478 = ~req_set_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:175:21  */
  assign n2480 = n2478 ? 4'b1110 : state;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:174:17  */
  assign n2482 = state == 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:178:17  */
  assign n2484 = state == 4'b1110;
  assign n2485 = {n2484, n2482, n2477, n2472, n2470, n2468, n2466, n2464, n2458, n2452, n2446, n2440, n2438, n2436, n2434};
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:127:13  */
  always @*
    case (n2485)
      15'b100000000000000: n2495 = 4'b1110;
      15'b010000000000000: n2495 = n2480;
      15'b001000000000000: n2495 = n2475;
      15'b000100000000000: n2495 = 4'b1100;
      15'b000010000000000: n2495 = 4'b1011;
      15'b000001000000000: n2495 = 4'b1010;
      15'b000000100000000: n2495 = 4'b1001;
      15'b000000010000000: n2495 = n2462;
      15'b000000001000000: n2495 = n2456;
      15'b000000000100000: n2495 = n2450;
      15'b000000000010000: n2495 = n2444;
      15'b000000000001000: n2495 = 4'b0100;
      15'b000000000000100: n2495 = 4'b0011;
      15'b000000000000010: n2495 = 4'b0010;
      15'b000000000000001: n2495 = n2432;
      default: n2495 = 4'b0000;
    endcase
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:185:28  */
  assign n2499 = state == 4'b0001;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:185:17  */
  assign n2500 = n2499 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:187:33  */
  assign n2504 = state == 4'b0010;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:187:22  */
  assign n2505 = n2504 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:189:30  */
  assign n2509 = state == 4'b0011;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:189:44  */
  assign n2511 = state == 4'b1000;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:189:35  */
  assign n2512 = n2509 | n2511;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:189:19  */
  assign n2513 = n2512 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:191:30  */
  assign n2517 = state == 4'b0100;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:191:44  */
  assign n2519 = state == 4'b1001;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:191:35  */
  assign n2520 = n2517 | n2519;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:191:19  */
  assign n2521 = n2520 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:193:30  */
  assign n2525 = state == 4'b0101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:193:44  */
  assign n2527 = state == 4'b1010;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:193:35  */
  assign n2528 = n2525 | n2527;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:193:19  */
  assign n2529 = n2528 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:32  */
  assign n2533 = state == 4'b1000;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:46  */
  assign n2535 = state == 4'b1001;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:37  */
  assign n2536 = n2533 | n2535;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:60  */
  assign n2538 = state == 4'b1010;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:51  */
  assign n2539 = n2536 | n2538;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:75  */
  assign n2541 = state == 4'b1011;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:66  */
  assign n2542 = n2539 | n2541;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:195:21  */
  assign n2543 = n2542 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:197:35  */
  assign n2547 = state == 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:197:50  */
  assign n2549 = state == 4'b1110;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:197:41  */
  assign n2550 = n2547 | n2549;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:197:24  */
  assign n2551 = n2550 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:199:33  */
  assign n2555 = state == 4'b1100;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:199:48  */
  assign n2557 = state == 4'b1101;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:199:39  */
  assign n2558 = n2555 | n2557;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:199:22  */
  assign n2559 = n2558 ? 1'b1 : 1'b0;
  assign n2561 = {ld_s, 2'b00, typ_s_i, 5'b10011, 4'b0100};
  assign n2562 = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, typ_s_i};
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:12  */
  assign n2563 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2564 = n2563 ? block1_x_next : block1_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2565 <= n2564;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:22  */
  assign n2566 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2567 = n2566 ? block2_x_next : block2_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2568 <= n2567;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:32  */
  assign n2569 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2570 = n2569 ? block3_x_next : block3_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2571 <= n2570;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:34:42  */
  assign n2572 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2573 = n2572 ? block4_x_next : block4_x;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2574 <= n2573;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:12  */
  assign n2575 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2576 = n2575 ? block1_y_next : block1_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2577 <= n2576;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:22  */
  assign n2578 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2579 = n2578 ? block2_y_next : block2_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2580 <= n2579;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:32  */
  assign n2581 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2582 = n2581 ? block3_y_next : block3_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2583 <= n2582;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:35:42  */
  assign n2584 = ~reset_i;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  assign n2585 = n2584 ? block4_y_next : block4_y;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:51:9  */
  always @(posedge clk_i)
    n2586 <= n2585;
  /* ../../vhdl/rtl/GAME/set/rtl/set_ea.vhd:116:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2587 <= 4'b0000;
    else
      n2587 <= next_state;
endmodule

module lastpos_ea
  (input  clk_i,
   input  reset_i,
   input  [14:0] lp_m_i,
   input  [14:0] lp_d_i,
   input  [14:0] lp_s_i,
   output [13:0] lp_bus_o,
   output [3:0] b1_x_o,
   output [3:0] b2_x_o,
   output [3:0] b3_x_o,
   output [3:0] b4_x_o,
   output [4:0] b1_y_o,
   output [4:0] b2_y_o,
   output [4:0] b3_y_o,
   output [4:0] b4_y_o);
  wire [13:0] lp_bus;
  wire [13:0] lp_bus_next;
  wire [13:0] n880;
  wire n881;
  wire [13:0] n882;
  wire [13:0] n883;
  wire n884;
  wire [13:0] n885;
  wire [13:0] n886;
  wire n887;
  wire [13:0] n888;
  wire [3:0] n889;
  wire [4:0] n890;
  wire [3:0] n891;
  wire [3:0] n893;
  wire [2:0] n894;
  wire n896;
  wire [1:0] n897;
  wire n899;
  wire [1:0] n900;
  wire n902;
  wire n903;
  wire [1:0] n904;
  wire n906;
  wire n907;
  wire [1:0] n908;
  wire n910;
  wire n911;
  wire n912;
  wire [3:0] n913;
  wire [3:0] n914;
  wire [3:0] n916;
  wire [2:0] n917;
  wire n919;
  wire [1:0] n920;
  wire n922;
  wire [1:0] n923;
  wire n925;
  wire n926;
  wire n927;
  wire [3:0] n928;
  wire [3:0] n929;
  wire [3:0] n931;
  wire [2:0] n932;
  wire n934;
  wire [1:0] n935;
  wire n937;
  wire [1:0] n938;
  wire n940;
  wire n941;
  wire n942;
  wire [3:0] n943;
  wire [3:0] n944;
  wire [3:0] n946;
  wire [2:0] n947;
  wire n949;
  wire [1:0] n950;
  wire n952;
  wire [1:0] n953;
  wire n955;
  wire n956;
  wire n957;
  wire [3:0] n958;
  wire [3:0] n959;
  wire [3:0] n961;
  wire [2:0] n962;
  wire n964;
  wire [1:0] n965;
  wire n967;
  wire [1:0] n968;
  wire n970;
  wire n971;
  wire n972;
  wire [3:0] n973;
  wire [3:0] n974;
  wire [3:0] n976;
  wire [2:0] n977;
  wire n979;
  wire [1:0] n980;
  wire n982;
  wire [1:0] n983;
  wire n985;
  wire n986;
  wire n987;
  wire [3:0] n988;
  wire [3:0] n989;
  wire [3:0] n991;
  wire [2:0] n992;
  wire n994;
  wire [1:0] n995;
  wire n997;
  wire [1:0] n998;
  wire n1000;
  wire n1001;
  wire n1002;
  wire [3:0] n1003;
  wire [3:0] n1004;
  wire [3:0] n1006;
  wire [2:0] n1007;
  wire n1009;
  wire [1:0] n1010;
  wire n1012;
  wire n1013;
  wire [3:0] n1014;
  wire [3:0] n1015;
  wire [3:0] n1017;
  wire [2:0] n1018;
  wire n1020;
  wire [1:0] n1021;
  wire n1023;
  wire n1024;
  wire [3:0] n1025;
  wire [3:0] n1026;
  wire [3:0] n1028;
  wire [2:0] n1029;
  wire n1031;
  wire [1:0] n1032;
  wire n1034;
  wire n1035;
  wire [3:0] n1036;
  wire [3:0] n1037;
  wire [3:0] n1039;
  wire [2:0] n1040;
  wire n1042;
  wire [1:0] n1043;
  wire n1045;
  wire n1046;
  wire [3:0] n1047;
  wire [3:0] n1048;
  wire [3:0] n1050;
  wire [2:0] n1051;
  wire n1053;
  wire [1:0] n1054;
  wire n1056;
  wire n1057;
  wire [3:0] n1058;
  wire [3:0] n1059;
  wire [3:0] n1061;
  wire [2:0] n1062;
  wire n1064;
  wire [1:0] n1065;
  wire n1067;
  wire n1068;
  wire [3:0] n1069;
  wire [3:0] n1070;
  wire [3:0] n1072;
  wire [2:0] n1073;
  wire n1075;
  wire [1:0] n1076;
  wire n1078;
  wire n1079;
  wire [3:0] n1080;
  wire [3:0] n1081;
  wire [3:0] n1083;
  wire [2:0] n1084;
  wire n1086;
  wire [1:0] n1087;
  wire n1089;
  wire n1090;
  wire [3:0] n1091;
  wire [3:0] n1092;
  wire [3:0] n1094;
  wire [2:0] n1095;
  wire n1097;
  wire [1:0] n1098;
  wire n1100;
  wire n1101;
  wire [3:0] n1102;
  wire [3:0] n1103;
  wire [3:0] n1105;
  wire [2:0] n1106;
  wire n1108;
  wire [1:0] n1109;
  wire n1111;
  wire n1112;
  wire [3:0] n1113;
  wire [3:0] n1114;
  wire [3:0] n1116;
  wire [2:0] n1117;
  wire n1119;
  wire [1:0] n1120;
  wire n1122;
  wire n1123;
  wire [3:0] n1124;
  wire [3:0] n1125;
  wire [3:0] n1127;
  wire [2:0] n1128;
  wire n1130;
  wire [1:0] n1131;
  wire n1133;
  wire n1134;
  wire [3:0] n1135;
  wire [4:0] n1137;
  wire [4:0] n1139;
  wire [2:0] n1140;
  wire n1142;
  wire [1:0] n1143;
  wire n1145;
  wire [1:0] n1146;
  wire n1148;
  wire n1149;
  wire [1:0] n1150;
  wire n1152;
  wire n1153;
  wire [1:0] n1154;
  wire n1156;
  wire n1157;
  wire n1158;
  wire [4:0] n1159;
  wire [4:0] n1160;
  wire [4:0] n1162;
  wire [2:0] n1163;
  wire n1165;
  wire [1:0] n1166;
  wire n1168;
  wire [1:0] n1169;
  wire n1171;
  wire n1172;
  wire n1173;
  wire [4:0] n1174;
  wire [4:0] n1175;
  wire [4:0] n1177;
  wire [2:0] n1178;
  wire n1180;
  wire [1:0] n1181;
  wire n1183;
  wire [1:0] n1184;
  wire n1186;
  wire n1187;
  wire n1188;
  wire [4:0] n1189;
  wire [4:0] n1190;
  wire [4:0] n1192;
  wire [2:0] n1193;
  wire n1195;
  wire [1:0] n1196;
  wire n1198;
  wire [1:0] n1199;
  wire n1201;
  wire n1202;
  wire n1203;
  wire [4:0] n1204;
  wire [4:0] n1205;
  wire [4:0] n1207;
  wire [2:0] n1208;
  wire n1210;
  wire [1:0] n1211;
  wire n1213;
  wire [1:0] n1214;
  wire n1216;
  wire n1217;
  wire n1218;
  wire [4:0] n1219;
  wire [4:0] n1220;
  wire [4:0] n1222;
  wire [2:0] n1223;
  wire n1225;
  wire [1:0] n1226;
  wire n1228;
  wire [1:0] n1229;
  wire n1231;
  wire n1232;
  wire n1233;
  wire [4:0] n1234;
  wire [4:0] n1235;
  wire [4:0] n1237;
  wire [2:0] n1238;
  wire n1240;
  wire [1:0] n1241;
  wire n1243;
  wire [1:0] n1244;
  wire n1246;
  wire n1247;
  wire n1248;
  wire [4:0] n1249;
  wire [4:0] n1250;
  wire [4:0] n1252;
  wire [2:0] n1253;
  wire n1255;
  wire [1:0] n1256;
  wire n1258;
  wire n1259;
  wire [4:0] n1260;
  wire [4:0] n1261;
  wire [4:0] n1263;
  wire [2:0] n1264;
  wire n1266;
  wire [1:0] n1267;
  wire n1269;
  wire n1270;
  wire [4:0] n1271;
  wire [4:0] n1272;
  wire [4:0] n1274;
  wire [2:0] n1275;
  wire n1277;
  wire [1:0] n1278;
  wire n1280;
  wire n1281;
  wire [4:0] n1282;
  wire [4:0] n1283;
  wire [4:0] n1285;
  wire [2:0] n1286;
  wire n1288;
  wire [1:0] n1289;
  wire n1291;
  wire n1292;
  wire [4:0] n1293;
  wire [4:0] n1294;
  wire [4:0] n1296;
  wire [2:0] n1297;
  wire n1299;
  wire [1:0] n1300;
  wire n1302;
  wire n1303;
  wire [4:0] n1304;
  wire [4:0] n1305;
  wire [4:0] n1307;
  wire [2:0] n1308;
  wire n1310;
  wire [1:0] n1311;
  wire n1313;
  wire n1314;
  wire [4:0] n1315;
  wire [4:0] n1316;
  wire [4:0] n1318;
  wire [2:0] n1319;
  wire n1321;
  wire [1:0] n1322;
  wire n1324;
  wire n1325;
  wire [4:0] n1326;
  wire [4:0] n1327;
  wire [4:0] n1329;
  wire [2:0] n1330;
  wire n1332;
  wire [1:0] n1333;
  wire n1335;
  wire n1336;
  wire [4:0] n1337;
  wire [4:0] n1338;
  wire [4:0] n1340;
  wire [2:0] n1341;
  wire n1343;
  wire [1:0] n1344;
  wire n1346;
  wire n1347;
  wire [4:0] n1348;
  wire [4:0] n1349;
  wire [4:0] n1351;
  wire [2:0] n1352;
  wire n1354;
  wire [1:0] n1355;
  wire n1357;
  wire n1358;
  wire [4:0] n1359;
  wire [4:0] n1360;
  wire [4:0] n1362;
  wire [2:0] n1363;
  wire n1365;
  wire [1:0] n1366;
  wire n1368;
  wire n1369;
  wire [4:0] n1370;
  wire [4:0] n1371;
  wire [4:0] n1373;
  wire [2:0] n1374;
  wire n1376;
  wire [1:0] n1377;
  wire n1379;
  wire n1380;
  wire [4:0] n1381;
  wire [3:0] n1383;
  wire [3:0] n1385;
  wire [2:0] n1386;
  wire n1388;
  wire [1:0] n1389;
  wire n1391;
  wire [1:0] n1392;
  wire n1394;
  wire n1395;
  wire [1:0] n1396;
  wire n1398;
  wire n1399;
  wire [1:0] n1400;
  wire n1402;
  wire n1403;
  wire n1404;
  wire [3:0] n1405;
  wire [3:0] n1406;
  wire [3:0] n1408;
  wire [2:0] n1409;
  wire n1411;
  wire [1:0] n1412;
  wire n1414;
  wire [1:0] n1415;
  wire n1417;
  wire n1418;
  wire n1419;
  wire [3:0] n1420;
  wire [3:0] n1421;
  wire [3:0] n1423;
  wire [2:0] n1424;
  wire n1426;
  wire [1:0] n1427;
  wire n1429;
  wire [1:0] n1430;
  wire n1432;
  wire n1433;
  wire n1434;
  wire [3:0] n1435;
  wire [3:0] n1436;
  wire [3:0] n1438;
  wire [2:0] n1439;
  wire n1441;
  wire [1:0] n1442;
  wire n1444;
  wire [1:0] n1445;
  wire n1447;
  wire n1448;
  wire n1449;
  wire [3:0] n1450;
  wire [3:0] n1451;
  wire [3:0] n1453;
  wire [2:0] n1454;
  wire n1456;
  wire [1:0] n1457;
  wire n1459;
  wire [1:0] n1460;
  wire n1462;
  wire n1463;
  wire n1464;
  wire [3:0] n1465;
  wire [3:0] n1466;
  wire [3:0] n1468;
  wire [2:0] n1469;
  wire n1471;
  wire [1:0] n1472;
  wire n1474;
  wire [1:0] n1475;
  wire n1477;
  wire n1478;
  wire n1479;
  wire [3:0] n1480;
  wire [3:0] n1481;
  wire [3:0] n1483;
  wire [2:0] n1484;
  wire n1486;
  wire [1:0] n1487;
  wire n1489;
  wire [1:0] n1490;
  wire n1492;
  wire n1493;
  wire n1494;
  wire [3:0] n1495;
  wire [3:0] n1496;
  wire [3:0] n1498;
  wire [2:0] n1499;
  wire n1501;
  wire [1:0] n1502;
  wire n1504;
  wire n1505;
  wire [3:0] n1506;
  wire [3:0] n1507;
  wire [3:0] n1509;
  wire [2:0] n1510;
  wire n1512;
  wire [1:0] n1513;
  wire n1515;
  wire n1516;
  wire [3:0] n1517;
  wire [3:0] n1518;
  wire [3:0] n1520;
  wire [2:0] n1521;
  wire n1523;
  wire [1:0] n1524;
  wire n1526;
  wire n1527;
  wire [3:0] n1528;
  wire [3:0] n1529;
  wire [3:0] n1531;
  wire [2:0] n1532;
  wire n1534;
  wire [1:0] n1535;
  wire n1537;
  wire n1538;
  wire [3:0] n1539;
  wire [3:0] n1540;
  wire [3:0] n1542;
  wire [2:0] n1543;
  wire n1545;
  wire [1:0] n1546;
  wire n1548;
  wire n1549;
  wire [3:0] n1550;
  wire [3:0] n1551;
  wire [3:0] n1553;
  wire [2:0] n1554;
  wire n1556;
  wire [1:0] n1557;
  wire n1559;
  wire n1560;
  wire [3:0] n1561;
  wire [3:0] n1562;
  wire [3:0] n1564;
  wire [2:0] n1565;
  wire n1567;
  wire [1:0] n1568;
  wire n1570;
  wire n1571;
  wire [3:0] n1572;
  wire [3:0] n1573;
  wire [3:0] n1575;
  wire [2:0] n1576;
  wire n1578;
  wire [1:0] n1579;
  wire n1581;
  wire n1582;
  wire [3:0] n1583;
  wire [3:0] n1584;
  wire [3:0] n1586;
  wire [2:0] n1587;
  wire n1589;
  wire [1:0] n1590;
  wire n1592;
  wire n1593;
  wire [3:0] n1594;
  wire [3:0] n1595;
  wire [3:0] n1597;
  wire [2:0] n1598;
  wire n1600;
  wire [1:0] n1601;
  wire n1603;
  wire n1604;
  wire [3:0] n1605;
  wire [3:0] n1606;
  wire [3:0] n1608;
  wire [2:0] n1609;
  wire n1611;
  wire [1:0] n1612;
  wire n1614;
  wire n1615;
  wire [3:0] n1616;
  wire [3:0] n1617;
  wire [3:0] n1619;
  wire [2:0] n1620;
  wire n1622;
  wire [1:0] n1623;
  wire n1625;
  wire n1626;
  wire [3:0] n1627;
  wire [4:0] n1629;
  wire [4:0] n1631;
  wire [2:0] n1632;
  wire n1634;
  wire [1:0] n1635;
  wire n1637;
  wire [1:0] n1638;
  wire n1640;
  wire n1641;
  wire [1:0] n1642;
  wire n1644;
  wire n1645;
  wire [1:0] n1646;
  wire n1648;
  wire n1649;
  wire n1650;
  wire [4:0] n1651;
  wire [4:0] n1652;
  wire [4:0] n1654;
  wire [2:0] n1655;
  wire n1657;
  wire [1:0] n1658;
  wire n1660;
  wire [1:0] n1661;
  wire n1663;
  wire n1664;
  wire n1665;
  wire [4:0] n1666;
  wire [4:0] n1667;
  wire [4:0] n1669;
  wire [2:0] n1670;
  wire n1672;
  wire [1:0] n1673;
  wire n1675;
  wire [1:0] n1676;
  wire n1678;
  wire n1679;
  wire n1680;
  wire [4:0] n1681;
  wire [4:0] n1682;
  wire [4:0] n1684;
  wire [2:0] n1685;
  wire n1687;
  wire [1:0] n1688;
  wire n1690;
  wire [1:0] n1691;
  wire n1693;
  wire n1694;
  wire n1695;
  wire [4:0] n1696;
  wire [4:0] n1697;
  wire [4:0] n1699;
  wire [2:0] n1700;
  wire n1702;
  wire [1:0] n1703;
  wire n1705;
  wire [1:0] n1706;
  wire n1708;
  wire n1709;
  wire n1710;
  wire [4:0] n1711;
  wire [4:0] n1712;
  wire [4:0] n1714;
  wire [2:0] n1715;
  wire n1717;
  wire [1:0] n1718;
  wire n1720;
  wire [1:0] n1721;
  wire n1723;
  wire n1724;
  wire n1725;
  wire [4:0] n1726;
  wire [4:0] n1727;
  wire [4:0] n1729;
  wire [2:0] n1730;
  wire n1732;
  wire [1:0] n1733;
  wire n1735;
  wire [1:0] n1736;
  wire n1738;
  wire n1739;
  wire n1740;
  wire [4:0] n1741;
  wire [4:0] n1742;
  wire [4:0] n1744;
  wire [2:0] n1745;
  wire n1747;
  wire [1:0] n1748;
  wire n1750;
  wire n1751;
  wire [4:0] n1752;
  wire [4:0] n1753;
  wire [4:0] n1755;
  wire [2:0] n1756;
  wire n1758;
  wire [1:0] n1759;
  wire n1761;
  wire n1762;
  wire [4:0] n1763;
  wire [4:0] n1764;
  wire [4:0] n1766;
  wire [2:0] n1767;
  wire n1769;
  wire [1:0] n1770;
  wire n1772;
  wire n1773;
  wire [4:0] n1774;
  wire [4:0] n1775;
  wire [4:0] n1777;
  wire [2:0] n1778;
  wire n1780;
  wire [1:0] n1781;
  wire n1783;
  wire n1784;
  wire [4:0] n1785;
  wire [4:0] n1786;
  wire [4:0] n1788;
  wire [2:0] n1789;
  wire n1791;
  wire [1:0] n1792;
  wire n1794;
  wire n1795;
  wire [4:0] n1796;
  wire [4:0] n1797;
  wire [4:0] n1799;
  wire [2:0] n1800;
  wire n1802;
  wire [1:0] n1803;
  wire n1805;
  wire n1806;
  wire [4:0] n1807;
  wire [4:0] n1808;
  wire [4:0] n1810;
  wire [2:0] n1811;
  wire n1813;
  wire [1:0] n1814;
  wire n1816;
  wire n1817;
  wire [4:0] n1818;
  wire [4:0] n1819;
  wire [4:0] n1821;
  wire [2:0] n1822;
  wire n1824;
  wire [1:0] n1825;
  wire n1827;
  wire n1828;
  wire [4:0] n1829;
  wire [4:0] n1830;
  wire [4:0] n1832;
  wire [2:0] n1833;
  wire n1835;
  wire [1:0] n1836;
  wire n1838;
  wire n1839;
  wire [4:0] n1840;
  wire [4:0] n1841;
  wire [4:0] n1843;
  wire [2:0] n1844;
  wire n1846;
  wire [1:0] n1847;
  wire n1849;
  wire n1850;
  wire [4:0] n1851;
  wire [4:0] n1852;
  wire [4:0] n1854;
  wire [2:0] n1855;
  wire n1857;
  wire [1:0] n1858;
  wire n1860;
  wire n1861;
  wire [4:0] n1862;
  wire [4:0] n1863;
  wire [4:0] n1865;
  wire [2:0] n1866;
  wire n1868;
  wire [1:0] n1869;
  wire n1871;
  wire n1872;
  wire [4:0] n1873;
  wire [3:0] n1875;
  wire [3:0] n1877;
  wire [2:0] n1878;
  wire n1880;
  wire [1:0] n1881;
  wire n1883;
  wire [1:0] n1884;
  wire n1886;
  wire n1887;
  wire [1:0] n1888;
  wire n1890;
  wire n1891;
  wire [1:0] n1892;
  wire n1894;
  wire n1895;
  wire n1896;
  wire [3:0] n1897;
  wire [3:0] n1898;
  wire [3:0] n1900;
  wire [2:0] n1901;
  wire n1903;
  wire [1:0] n1904;
  wire n1906;
  wire [1:0] n1907;
  wire n1909;
  wire n1910;
  wire n1911;
  wire [3:0] n1912;
  wire [3:0] n1913;
  wire [3:0] n1915;
  wire [2:0] n1916;
  wire n1918;
  wire [1:0] n1919;
  wire n1921;
  wire [1:0] n1922;
  wire n1924;
  wire n1925;
  wire n1926;
  wire [3:0] n1927;
  wire [3:0] n1928;
  wire [3:0] n1930;
  wire [2:0] n1931;
  wire n1933;
  wire [1:0] n1934;
  wire n1936;
  wire [1:0] n1937;
  wire n1939;
  wire n1940;
  wire n1941;
  wire [3:0] n1942;
  wire [3:0] n1943;
  wire [3:0] n1945;
  wire [2:0] n1946;
  wire n1948;
  wire [1:0] n1949;
  wire n1951;
  wire [1:0] n1952;
  wire n1954;
  wire n1955;
  wire n1956;
  wire [3:0] n1957;
  wire [3:0] n1958;
  wire [3:0] n1960;
  wire [2:0] n1961;
  wire n1963;
  wire [1:0] n1964;
  wire n1966;
  wire [1:0] n1967;
  wire n1969;
  wire n1970;
  wire n1971;
  wire [3:0] n1972;
  wire [3:0] n1973;
  wire [3:0] n1975;
  wire [2:0] n1976;
  wire n1978;
  wire [1:0] n1979;
  wire n1981;
  wire [1:0] n1982;
  wire n1984;
  wire n1985;
  wire n1986;
  wire [3:0] n1987;
  wire [3:0] n1988;
  wire [3:0] n1990;
  wire [2:0] n1991;
  wire n1993;
  wire [1:0] n1994;
  wire n1996;
  wire n1997;
  wire [3:0] n1998;
  wire [3:0] n1999;
  wire [3:0] n2001;
  wire [2:0] n2002;
  wire n2004;
  wire [1:0] n2005;
  wire n2007;
  wire n2008;
  wire [3:0] n2009;
  wire [3:0] n2010;
  wire [3:0] n2012;
  wire [2:0] n2013;
  wire n2015;
  wire [1:0] n2016;
  wire n2018;
  wire n2019;
  wire [3:0] n2020;
  wire [3:0] n2021;
  wire [3:0] n2023;
  wire [2:0] n2024;
  wire n2026;
  wire [1:0] n2027;
  wire n2029;
  wire n2030;
  wire [3:0] n2031;
  wire [3:0] n2032;
  wire [3:0] n2034;
  wire [2:0] n2035;
  wire n2037;
  wire [1:0] n2038;
  wire n2040;
  wire n2041;
  wire [3:0] n2042;
  wire [3:0] n2043;
  wire [3:0] n2045;
  wire [2:0] n2046;
  wire n2048;
  wire [1:0] n2049;
  wire n2051;
  wire n2052;
  wire [3:0] n2053;
  wire [3:0] n2054;
  wire [3:0] n2056;
  wire [2:0] n2057;
  wire n2059;
  wire [1:0] n2060;
  wire n2062;
  wire n2063;
  wire [3:0] n2064;
  wire [3:0] n2065;
  wire [3:0] n2067;
  wire [2:0] n2068;
  wire n2070;
  wire [1:0] n2071;
  wire n2073;
  wire n2074;
  wire [3:0] n2075;
  wire [3:0] n2076;
  wire [3:0] n2078;
  wire [2:0] n2079;
  wire n2081;
  wire [1:0] n2082;
  wire n2084;
  wire n2085;
  wire [3:0] n2086;
  wire [3:0] n2087;
  wire [3:0] n2089;
  wire [2:0] n2090;
  wire n2092;
  wire [1:0] n2093;
  wire n2095;
  wire n2096;
  wire [3:0] n2097;
  wire [3:0] n2098;
  wire [3:0] n2100;
  wire [2:0] n2101;
  wire n2103;
  wire [1:0] n2104;
  wire n2106;
  wire n2107;
  wire [3:0] n2108;
  wire [3:0] n2109;
  wire [3:0] n2111;
  wire [2:0] n2112;
  wire n2114;
  wire [1:0] n2115;
  wire n2117;
  wire n2118;
  wire [3:0] n2119;
  wire [4:0] n2121;
  wire [4:0] n2123;
  wire [2:0] n2124;
  wire n2126;
  wire [1:0] n2127;
  wire n2129;
  wire [1:0] n2130;
  wire n2132;
  wire n2133;
  wire [1:0] n2134;
  wire n2136;
  wire n2137;
  wire [1:0] n2138;
  wire n2140;
  wire n2141;
  wire n2142;
  wire [4:0] n2143;
  wire [4:0] n2144;
  wire [4:0] n2146;
  wire [2:0] n2147;
  wire n2149;
  wire [1:0] n2150;
  wire n2152;
  wire [1:0] n2153;
  wire n2155;
  wire n2156;
  wire n2157;
  wire [4:0] n2158;
  wire [4:0] n2159;
  wire [4:0] n2161;
  wire [2:0] n2162;
  wire n2164;
  wire [1:0] n2165;
  wire n2167;
  wire [1:0] n2168;
  wire n2170;
  wire n2171;
  wire n2172;
  wire [4:0] n2173;
  wire [4:0] n2174;
  wire [4:0] n2176;
  wire [2:0] n2177;
  wire n2179;
  wire [1:0] n2180;
  wire n2182;
  wire [1:0] n2183;
  wire n2185;
  wire n2186;
  wire n2187;
  wire [4:0] n2188;
  wire [4:0] n2189;
  wire [4:0] n2191;
  wire [2:0] n2192;
  wire n2194;
  wire [1:0] n2195;
  wire n2197;
  wire [1:0] n2198;
  wire n2200;
  wire n2201;
  wire n2202;
  wire [4:0] n2203;
  wire [4:0] n2204;
  wire [4:0] n2206;
  wire [2:0] n2207;
  wire n2209;
  wire [1:0] n2210;
  wire n2212;
  wire [1:0] n2213;
  wire n2215;
  wire n2216;
  wire n2217;
  wire [4:0] n2218;
  wire [4:0] n2219;
  wire [4:0] n2221;
  wire [2:0] n2222;
  wire n2224;
  wire [1:0] n2225;
  wire n2227;
  wire [1:0] n2228;
  wire n2230;
  wire n2231;
  wire n2232;
  wire [4:0] n2233;
  wire [4:0] n2234;
  wire [4:0] n2236;
  wire [2:0] n2237;
  wire n2239;
  wire [1:0] n2240;
  wire n2242;
  wire n2243;
  wire [4:0] n2244;
  wire [4:0] n2245;
  wire [4:0] n2247;
  wire [2:0] n2248;
  wire n2250;
  wire [1:0] n2251;
  wire n2253;
  wire n2254;
  wire [4:0] n2255;
  wire [4:0] n2256;
  wire [4:0] n2258;
  wire [2:0] n2259;
  wire n2261;
  wire [1:0] n2262;
  wire n2264;
  wire n2265;
  wire [4:0] n2266;
  wire [4:0] n2267;
  wire [4:0] n2269;
  wire [2:0] n2270;
  wire n2272;
  wire [1:0] n2273;
  wire n2275;
  wire n2276;
  wire [4:0] n2277;
  wire [4:0] n2278;
  wire [4:0] n2280;
  wire [2:0] n2281;
  wire n2283;
  wire [1:0] n2284;
  wire n2286;
  wire n2287;
  wire [4:0] n2288;
  wire [4:0] n2289;
  wire [4:0] n2291;
  wire [2:0] n2292;
  wire n2294;
  wire [1:0] n2295;
  wire n2297;
  wire n2298;
  wire [4:0] n2299;
  wire [4:0] n2300;
  wire [4:0] n2302;
  wire [2:0] n2303;
  wire n2305;
  wire [1:0] n2306;
  wire n2308;
  wire n2309;
  wire [4:0] n2310;
  wire [4:0] n2311;
  wire [4:0] n2313;
  wire [2:0] n2314;
  wire n2316;
  wire [1:0] n2317;
  wire n2319;
  wire n2320;
  wire [4:0] n2321;
  wire [4:0] n2322;
  wire [4:0] n2324;
  wire [2:0] n2325;
  wire n2327;
  wire [1:0] n2328;
  wire n2330;
  wire n2331;
  wire [4:0] n2332;
  wire [4:0] n2333;
  wire [4:0] n2335;
  wire [2:0] n2336;
  wire n2338;
  wire [1:0] n2339;
  wire n2341;
  wire n2342;
  wire [4:0] n2343;
  wire [4:0] n2344;
  wire [4:0] n2346;
  wire [2:0] n2347;
  wire n2349;
  wire [1:0] n2350;
  wire n2352;
  wire n2353;
  wire [4:0] n2354;
  wire [4:0] n2355;
  wire [4:0] n2357;
  wire [2:0] n2358;
  wire n2360;
  wire [1:0] n2361;
  wire n2363;
  wire n2364;
  wire [4:0] n2365;
  reg [13:0] n2367;
  assign lp_bus_o = lp_bus; //(module output)
  assign b1_x_o = n889; //(module output)
  assign b2_x_o = n913; //(module output)
  assign b3_x_o = n1405; //(module output)
  assign b4_x_o = n1897; //(module output)
  assign b1_y_o = n890; //(module output)
  assign b2_y_o = n1159; //(module output)
  assign b3_y_o = n1651; //(module output)
  assign b4_y_o = n2143; //(module output)
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:22:10  */
  assign lp_bus = n2367; // (signal)
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:22:18  */
  assign lp_bus_next = n882; // (signal)
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:38:24  */
  assign n880 = lp_m_i[13:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:38:49  */
  assign n881 = lp_m_i[14]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:38:38  */
  assign n882 = n881 ? n880 : n885;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:39:21  */
  assign n883 = lp_d_i[13:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:39:46  */
  assign n884 = lp_d_i[14]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:38:60  */
  assign n885 = n884 ? n883 : n888;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:40:21  */
  assign n886 = lp_s_i[13:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:40:46  */
  assign n887 = lp_s_i[14]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:39:57  */
  assign n888 = n887 ? n886 : lp_bus;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:49:19  */
  assign n889 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:51:19  */
  assign n890 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:46  */
  assign n891 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:60  */
  assign n893 = n891 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:78  */
  assign n894 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:92  */
  assign n896 = n894 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:111  */
  assign n897 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:126  */
  assign n899 = n897 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:142  */
  assign n900 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:157  */
  assign n902 = n900 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:133  */
  assign n903 = n899 | n902;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:173  */
  assign n904 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:188  */
  assign n906 = n904 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:164  */
  assign n907 = n903 | n906;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:204  */
  assign n908 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:219  */
  assign n910 = n908 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:195  */
  assign n911 = n907 | n910;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:100  */
  assign n912 = n911 & n896;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:65  */
  assign n913 = n912 ? n893 : n928;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:46  */
  assign n914 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:60  */
  assign n916 = n914 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:78  */
  assign n917 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:92  */
  assign n919 = n917 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:111  */
  assign n920 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:126  */
  assign n922 = n920 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:142  */
  assign n923 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:157  */
  assign n925 = n923 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:133  */
  assign n926 = n922 | n925;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:100  */
  assign n927 = n926 & n919;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:53:228  */
  assign n928 = n927 ? n916 : n943;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:46  */
  assign n929 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:60  */
  assign n931 = n929 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:78  */
  assign n932 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:92  */
  assign n934 = n932 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:111  */
  assign n935 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:126  */
  assign n937 = n935 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:142  */
  assign n938 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:157  */
  assign n940 = n938 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:133  */
  assign n941 = n937 | n940;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:100  */
  assign n942 = n941 & n934;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:55:166  */
  assign n943 = n942 ? n931 : n958;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:46  */
  assign n944 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:60  */
  assign n946 = n944 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:78  */
  assign n947 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:92  */
  assign n949 = n947 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:111  */
  assign n950 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:126  */
  assign n952 = n950 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:142  */
  assign n953 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:157  */
  assign n955 = n953 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:133  */
  assign n956 = n952 | n955;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:100  */
  assign n957 = n956 & n949;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:56:166  */
  assign n958 = n957 ? n946 : n973;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:46  */
  assign n959 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:60  */
  assign n961 = n959 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:78  */
  assign n962 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:92  */
  assign n964 = n962 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:111  */
  assign n965 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:126  */
  assign n967 = n965 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:142  */
  assign n968 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:157  */
  assign n970 = n968 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:133  */
  assign n971 = n967 | n970;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:100  */
  assign n972 = n971 & n964;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:58:166  */
  assign n973 = n972 ? n961 : n988;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:46  */
  assign n974 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:60  */
  assign n976 = n974 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:78  */
  assign n977 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:92  */
  assign n979 = n977 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:111  */
  assign n980 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:126  */
  assign n982 = n980 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:142  */
  assign n983 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:157  */
  assign n985 = n983 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:133  */
  assign n986 = n982 | n985;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:100  */
  assign n987 = n986 & n979;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:59:166  */
  assign n988 = n987 ? n976 : n1003;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:46  */
  assign n989 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:60  */
  assign n991 = n989 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:78  */
  assign n992 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:92  */
  assign n994 = n992 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:111  */
  assign n995 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:126  */
  assign n997 = n995 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:142  */
  assign n998 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:157  */
  assign n1000 = n998 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:133  */
  assign n1001 = n997 | n1000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:100  */
  assign n1002 = n1001 & n994;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:61:166  */
  assign n1003 = n1002 ? n991 : n1014;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:46  */
  assign n1004 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:60  */
  assign n1006 = n1004 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:78  */
  assign n1007 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:92  */
  assign n1009 = n1007 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:110  */
  assign n1010 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:125  */
  assign n1012 = n1010 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:100  */
  assign n1013 = n1012 & n1009;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:62:166  */
  assign n1014 = n1013 ? n1006 : n1025;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:46  */
  assign n1015 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:60  */
  assign n1017 = n1015 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:78  */
  assign n1018 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:92  */
  assign n1020 = n1018 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:110  */
  assign n1021 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:125  */
  assign n1023 = n1021 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:100  */
  assign n1024 = n1023 & n1020;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:64:133  */
  assign n1025 = n1024 ? n1017 : n1036;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:46  */
  assign n1026 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:60  */
  assign n1028 = n1026 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:78  */
  assign n1029 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:92  */
  assign n1031 = n1029 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:110  */
  assign n1032 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:125  */
  assign n1034 = n1032 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:100  */
  assign n1035 = n1034 & n1031;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:65:133  */
  assign n1036 = n1035 ? n1028 : n1047;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:46  */
  assign n1037 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:60  */
  assign n1039 = n1037 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:78  */
  assign n1040 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:92  */
  assign n1042 = n1040 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:110  */
  assign n1043 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:125  */
  assign n1045 = n1043 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:100  */
  assign n1046 = n1045 & n1042;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:66:133  */
  assign n1047 = n1046 ? n1039 : n1058;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:46  */
  assign n1048 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:60  */
  assign n1050 = n1048 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:78  */
  assign n1051 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:92  */
  assign n1053 = n1051 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:110  */
  assign n1054 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:125  */
  assign n1056 = n1054 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:100  */
  assign n1057 = n1056 & n1053;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:67:133  */
  assign n1058 = n1057 ? n1050 : n1069;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:46  */
  assign n1059 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:60  */
  assign n1061 = n1059 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:78  */
  assign n1062 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:92  */
  assign n1064 = n1062 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:110  */
  assign n1065 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:125  */
  assign n1067 = n1065 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:100  */
  assign n1068 = n1067 & n1064;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:69:133  */
  assign n1069 = n1068 ? n1061 : n1080;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:46  */
  assign n1070 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:60  */
  assign n1072 = n1070 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:78  */
  assign n1073 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:92  */
  assign n1075 = n1073 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:110  */
  assign n1076 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:125  */
  assign n1078 = n1076 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:100  */
  assign n1079 = n1078 & n1075;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:70:133  */
  assign n1080 = n1079 ? n1072 : n1091;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:46  */
  assign n1081 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:60  */
  assign n1083 = n1081 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:78  */
  assign n1084 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:92  */
  assign n1086 = n1084 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:110  */
  assign n1087 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:125  */
  assign n1089 = n1087 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:100  */
  assign n1090 = n1089 & n1086;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:71:133  */
  assign n1091 = n1090 ? n1083 : n1102;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:46  */
  assign n1092 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:60  */
  assign n1094 = n1092 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:78  */
  assign n1095 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:92  */
  assign n1097 = n1095 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:110  */
  assign n1098 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:125  */
  assign n1100 = n1098 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:100  */
  assign n1101 = n1100 & n1097;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:72:133  */
  assign n1102 = n1101 ? n1094 : n1113;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:46  */
  assign n1103 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:60  */
  assign n1105 = n1103 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:78  */
  assign n1106 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:92  */
  assign n1108 = n1106 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:110  */
  assign n1109 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:125  */
  assign n1111 = n1109 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:100  */
  assign n1112 = n1111 & n1108;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:74:133  */
  assign n1113 = n1112 ? n1105 : n1124;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:46  */
  assign n1114 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:60  */
  assign n1116 = n1114 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:78  */
  assign n1117 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:92  */
  assign n1119 = n1117 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:110  */
  assign n1120 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:125  */
  assign n1122 = n1120 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:100  */
  assign n1123 = n1122 & n1119;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:75:133  */
  assign n1124 = n1123 ? n1116 : n1135;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:46  */
  assign n1125 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:60  */
  assign n1127 = n1125 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:78  */
  assign n1128 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:92  */
  assign n1130 = n1128 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:110  */
  assign n1131 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:125  */
  assign n1133 = n1131 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:77:100  */
  assign n1134 = n1133 & n1130;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:76:133  */
  assign n1135 = n1134 ? n1127 : 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:46  */
  assign n1137 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:60  */
  assign n1139 = n1137 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:78  */
  assign n1140 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:92  */
  assign n1142 = n1140 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:111  */
  assign n1143 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:126  */
  assign n1145 = n1143 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:142  */
  assign n1146 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:157  */
  assign n1148 = n1146 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:133  */
  assign n1149 = n1145 | n1148;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:173  */
  assign n1150 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:188  */
  assign n1152 = n1150 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:164  */
  assign n1153 = n1149 | n1152;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:204  */
  assign n1154 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:219  */
  assign n1156 = n1154 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:195  */
  assign n1157 = n1153 | n1156;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:100  */
  assign n1158 = n1157 & n1142;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:65  */
  assign n1159 = n1158 ? n1139 : n1174;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:46  */
  assign n1160 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:60  */
  assign n1162 = n1160 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:78  */
  assign n1163 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:92  */
  assign n1165 = n1163 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:111  */
  assign n1166 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:126  */
  assign n1168 = n1166 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:142  */
  assign n1169 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:157  */
  assign n1171 = n1169 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:133  */
  assign n1172 = n1168 | n1171;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:100  */
  assign n1173 = n1172 & n1165;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:80:228  */
  assign n1174 = n1173 ? n1162 : n1189;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:46  */
  assign n1175 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:60  */
  assign n1177 = n1175 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:78  */
  assign n1178 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:92  */
  assign n1180 = n1178 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:111  */
  assign n1181 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:126  */
  assign n1183 = n1181 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:142  */
  assign n1184 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:157  */
  assign n1186 = n1184 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:133  */
  assign n1187 = n1183 | n1186;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:100  */
  assign n1188 = n1187 & n1180;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:82:166  */
  assign n1189 = n1188 ? n1177 : n1204;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:46  */
  assign n1190 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:60  */
  assign n1192 = n1190 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:78  */
  assign n1193 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:92  */
  assign n1195 = n1193 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:111  */
  assign n1196 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:126  */
  assign n1198 = n1196 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:142  */
  assign n1199 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:157  */
  assign n1201 = n1199 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:133  */
  assign n1202 = n1198 | n1201;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:100  */
  assign n1203 = n1202 & n1195;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:83:166  */
  assign n1204 = n1203 ? n1192 : n1219;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:46  */
  assign n1205 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:60  */
  assign n1207 = n1205 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:78  */
  assign n1208 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:92  */
  assign n1210 = n1208 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:111  */
  assign n1211 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:126  */
  assign n1213 = n1211 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:142  */
  assign n1214 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:157  */
  assign n1216 = n1214 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:133  */
  assign n1217 = n1213 | n1216;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:100  */
  assign n1218 = n1217 & n1210;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:85:166  */
  assign n1219 = n1218 ? n1207 : n1234;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:46  */
  assign n1220 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:60  */
  assign n1222 = n1220 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:78  */
  assign n1223 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:92  */
  assign n1225 = n1223 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:111  */
  assign n1226 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:126  */
  assign n1228 = n1226 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:142  */
  assign n1229 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:157  */
  assign n1231 = n1229 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:133  */
  assign n1232 = n1228 | n1231;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:100  */
  assign n1233 = n1232 & n1225;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:86:166  */
  assign n1234 = n1233 ? n1222 : n1249;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:46  */
  assign n1235 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:60  */
  assign n1237 = n1235 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:78  */
  assign n1238 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:92  */
  assign n1240 = n1238 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:111  */
  assign n1241 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:126  */
  assign n1243 = n1241 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:142  */
  assign n1244 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:157  */
  assign n1246 = n1244 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:133  */
  assign n1247 = n1243 | n1246;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:100  */
  assign n1248 = n1247 & n1240;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:88:166  */
  assign n1249 = n1248 ? n1237 : n1260;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:46  */
  assign n1250 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:60  */
  assign n1252 = n1250 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:78  */
  assign n1253 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:92  */
  assign n1255 = n1253 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:110  */
  assign n1256 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:125  */
  assign n1258 = n1256 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:100  */
  assign n1259 = n1258 & n1255;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:89:166  */
  assign n1260 = n1259 ? n1252 : n1271;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:46  */
  assign n1261 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:60  */
  assign n1263 = n1261 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:78  */
  assign n1264 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:92  */
  assign n1266 = n1264 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:110  */
  assign n1267 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:125  */
  assign n1269 = n1267 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:100  */
  assign n1270 = n1269 & n1266;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:91:133  */
  assign n1271 = n1270 ? n1263 : n1282;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:46  */
  assign n1272 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:60  */
  assign n1274 = n1272 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:78  */
  assign n1275 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:92  */
  assign n1277 = n1275 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:110  */
  assign n1278 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:125  */
  assign n1280 = n1278 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:100  */
  assign n1281 = n1280 & n1277;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:92:133  */
  assign n1282 = n1281 ? n1274 : n1293;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:46  */
  assign n1283 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:60  */
  assign n1285 = n1283 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:78  */
  assign n1286 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:92  */
  assign n1288 = n1286 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:110  */
  assign n1289 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:125  */
  assign n1291 = n1289 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:100  */
  assign n1292 = n1291 & n1288;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:93:133  */
  assign n1293 = n1292 ? n1285 : n1304;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:46  */
  assign n1294 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:60  */
  assign n1296 = n1294 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:78  */
  assign n1297 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:92  */
  assign n1299 = n1297 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:110  */
  assign n1300 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:125  */
  assign n1302 = n1300 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:100  */
  assign n1303 = n1302 & n1299;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:94:133  */
  assign n1304 = n1303 ? n1296 : n1315;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:46  */
  assign n1305 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:60  */
  assign n1307 = n1305 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:78  */
  assign n1308 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:92  */
  assign n1310 = n1308 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:110  */
  assign n1311 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:125  */
  assign n1313 = n1311 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:100  */
  assign n1314 = n1313 & n1310;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:96:133  */
  assign n1315 = n1314 ? n1307 : n1326;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:46  */
  assign n1316 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:60  */
  assign n1318 = n1316 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:78  */
  assign n1319 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:92  */
  assign n1321 = n1319 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:110  */
  assign n1322 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:125  */
  assign n1324 = n1322 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:100  */
  assign n1325 = n1324 & n1321;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:97:133  */
  assign n1326 = n1325 ? n1318 : n1337;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:46  */
  assign n1327 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:60  */
  assign n1329 = n1327 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:78  */
  assign n1330 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:92  */
  assign n1332 = n1330 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:110  */
  assign n1333 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:125  */
  assign n1335 = n1333 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:100  */
  assign n1336 = n1335 & n1332;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:98:133  */
  assign n1337 = n1336 ? n1329 : n1348;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:46  */
  assign n1338 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:60  */
  assign n1340 = n1338 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:78  */
  assign n1341 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:92  */
  assign n1343 = n1341 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:110  */
  assign n1344 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:125  */
  assign n1346 = n1344 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:100  */
  assign n1347 = n1346 & n1343;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:99:133  */
  assign n1348 = n1347 ? n1340 : n1359;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:46  */
  assign n1349 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:60  */
  assign n1351 = n1349 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:78  */
  assign n1352 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:92  */
  assign n1354 = n1352 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:110  */
  assign n1355 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:125  */
  assign n1357 = n1355 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:100  */
  assign n1358 = n1357 & n1354;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:101:133  */
  assign n1359 = n1358 ? n1351 : n1370;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:46  */
  assign n1360 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:60  */
  assign n1362 = n1360 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:78  */
  assign n1363 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:92  */
  assign n1365 = n1363 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:110  */
  assign n1366 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:125  */
  assign n1368 = n1366 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:100  */
  assign n1369 = n1368 & n1365;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:102:133  */
  assign n1370 = n1369 ? n1362 : n1381;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:46  */
  assign n1371 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:60  */
  assign n1373 = n1371 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:78  */
  assign n1374 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:92  */
  assign n1376 = n1374 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:110  */
  assign n1377 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:125  */
  assign n1379 = n1377 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:104:100  */
  assign n1380 = n1379 & n1376;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:103:133  */
  assign n1381 = n1380 ? n1373 : 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:46  */
  assign n1383 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:60  */
  assign n1385 = n1383 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:78  */
  assign n1386 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:92  */
  assign n1388 = n1386 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:111  */
  assign n1389 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:126  */
  assign n1391 = n1389 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:142  */
  assign n1392 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:157  */
  assign n1394 = n1392 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:133  */
  assign n1395 = n1391 | n1394;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:173  */
  assign n1396 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:188  */
  assign n1398 = n1396 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:164  */
  assign n1399 = n1395 | n1398;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:204  */
  assign n1400 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:219  */
  assign n1402 = n1400 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:195  */
  assign n1403 = n1399 | n1402;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:100  */
  assign n1404 = n1403 & n1388;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:65  */
  assign n1405 = n1404 ? n1385 : n1420;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:46  */
  assign n1406 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:60  */
  assign n1408 = n1406 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:78  */
  assign n1409 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:92  */
  assign n1411 = n1409 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:111  */
  assign n1412 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:126  */
  assign n1414 = n1412 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:142  */
  assign n1415 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:157  */
  assign n1417 = n1415 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:133  */
  assign n1418 = n1414 | n1417;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:100  */
  assign n1419 = n1418 & n1411;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:107:228  */
  assign n1420 = n1419 ? n1408 : n1435;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:46  */
  assign n1421 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:60  */
  assign n1423 = n1421 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:78  */
  assign n1424 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:92  */
  assign n1426 = n1424 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:111  */
  assign n1427 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:126  */
  assign n1429 = n1427 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:142  */
  assign n1430 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:157  */
  assign n1432 = n1430 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:133  */
  assign n1433 = n1429 | n1432;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:100  */
  assign n1434 = n1433 & n1426;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:109:166  */
  assign n1435 = n1434 ? n1423 : n1450;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:46  */
  assign n1436 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:60  */
  assign n1438 = n1436 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:78  */
  assign n1439 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:92  */
  assign n1441 = n1439 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:111  */
  assign n1442 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:126  */
  assign n1444 = n1442 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:142  */
  assign n1445 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:157  */
  assign n1447 = n1445 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:133  */
  assign n1448 = n1444 | n1447;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:100  */
  assign n1449 = n1448 & n1441;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:110:166  */
  assign n1450 = n1449 ? n1438 : n1465;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:46  */
  assign n1451 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:60  */
  assign n1453 = n1451 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:78  */
  assign n1454 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:92  */
  assign n1456 = n1454 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:111  */
  assign n1457 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:126  */
  assign n1459 = n1457 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:142  */
  assign n1460 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:157  */
  assign n1462 = n1460 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:133  */
  assign n1463 = n1459 | n1462;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:100  */
  assign n1464 = n1463 & n1456;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:112:166  */
  assign n1465 = n1464 ? n1453 : n1480;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:46  */
  assign n1466 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:60  */
  assign n1468 = n1466 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:78  */
  assign n1469 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:92  */
  assign n1471 = n1469 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:111  */
  assign n1472 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:126  */
  assign n1474 = n1472 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:142  */
  assign n1475 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:157  */
  assign n1477 = n1475 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:133  */
  assign n1478 = n1474 | n1477;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:100  */
  assign n1479 = n1478 & n1471;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:113:166  */
  assign n1480 = n1479 ? n1468 : n1495;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:46  */
  assign n1481 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:60  */
  assign n1483 = n1481 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:78  */
  assign n1484 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:92  */
  assign n1486 = n1484 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:111  */
  assign n1487 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:126  */
  assign n1489 = n1487 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:142  */
  assign n1490 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:157  */
  assign n1492 = n1490 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:133  */
  assign n1493 = n1489 | n1492;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:100  */
  assign n1494 = n1493 & n1486;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:115:166  */
  assign n1495 = n1494 ? n1483 : n1506;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:46  */
  assign n1496 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:60  */
  assign n1498 = n1496 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:78  */
  assign n1499 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:92  */
  assign n1501 = n1499 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:110  */
  assign n1502 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:125  */
  assign n1504 = n1502 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:100  */
  assign n1505 = n1504 & n1501;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:116:166  */
  assign n1506 = n1505 ? n1498 : n1517;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:46  */
  assign n1507 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:60  */
  assign n1509 = n1507 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:78  */
  assign n1510 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:92  */
  assign n1512 = n1510 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:110  */
  assign n1513 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:125  */
  assign n1515 = n1513 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:100  */
  assign n1516 = n1515 & n1512;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:118:133  */
  assign n1517 = n1516 ? n1509 : n1528;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:46  */
  assign n1518 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:60  */
  assign n1520 = n1518 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:78  */
  assign n1521 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:92  */
  assign n1523 = n1521 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:110  */
  assign n1524 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:125  */
  assign n1526 = n1524 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:100  */
  assign n1527 = n1526 & n1523;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:119:133  */
  assign n1528 = n1527 ? n1520 : n1539;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:46  */
  assign n1529 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:60  */
  assign n1531 = n1529 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:78  */
  assign n1532 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:92  */
  assign n1534 = n1532 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:110  */
  assign n1535 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:125  */
  assign n1537 = n1535 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:100  */
  assign n1538 = n1537 & n1534;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:120:133  */
  assign n1539 = n1538 ? n1531 : n1550;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:46  */
  assign n1540 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:60  */
  assign n1542 = n1540 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:78  */
  assign n1543 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:92  */
  assign n1545 = n1543 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:110  */
  assign n1546 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:125  */
  assign n1548 = n1546 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:100  */
  assign n1549 = n1548 & n1545;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:121:133  */
  assign n1550 = n1549 ? n1542 : n1561;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:46  */
  assign n1551 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:60  */
  assign n1553 = n1551 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:78  */
  assign n1554 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:92  */
  assign n1556 = n1554 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:110  */
  assign n1557 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:125  */
  assign n1559 = n1557 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:100  */
  assign n1560 = n1559 & n1556;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:123:133  */
  assign n1561 = n1560 ? n1553 : n1572;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:46  */
  assign n1562 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:60  */
  assign n1564 = n1562 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:78  */
  assign n1565 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:92  */
  assign n1567 = n1565 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:110  */
  assign n1568 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:125  */
  assign n1570 = n1568 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:100  */
  assign n1571 = n1570 & n1567;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:124:133  */
  assign n1572 = n1571 ? n1564 : n1583;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:46  */
  assign n1573 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:60  */
  assign n1575 = n1573 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:78  */
  assign n1576 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:92  */
  assign n1578 = n1576 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:110  */
  assign n1579 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:125  */
  assign n1581 = n1579 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:100  */
  assign n1582 = n1581 & n1578;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:125:133  */
  assign n1583 = n1582 ? n1575 : n1594;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:46  */
  assign n1584 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:60  */
  assign n1586 = n1584 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:78  */
  assign n1587 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:92  */
  assign n1589 = n1587 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:110  */
  assign n1590 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:125  */
  assign n1592 = n1590 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:100  */
  assign n1593 = n1592 & n1589;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:126:133  */
  assign n1594 = n1593 ? n1586 : n1605;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:46  */
  assign n1595 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:60  */
  assign n1597 = n1595 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:78  */
  assign n1598 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:92  */
  assign n1600 = n1598 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:110  */
  assign n1601 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:125  */
  assign n1603 = n1601 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:100  */
  assign n1604 = n1603 & n1600;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:128:133  */
  assign n1605 = n1604 ? n1597 : n1616;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:46  */
  assign n1606 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:60  */
  assign n1608 = n1606 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:78  */
  assign n1609 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:92  */
  assign n1611 = n1609 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:110  */
  assign n1612 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:125  */
  assign n1614 = n1612 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:100  */
  assign n1615 = n1614 & n1611;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:129:133  */
  assign n1616 = n1615 ? n1608 : n1627;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:46  */
  assign n1617 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:60  */
  assign n1619 = n1617 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:78  */
  assign n1620 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:92  */
  assign n1622 = n1620 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:110  */
  assign n1623 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:125  */
  assign n1625 = n1623 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:131:100  */
  assign n1626 = n1625 & n1622;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:130:133  */
  assign n1627 = n1626 ? n1619 : 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:46  */
  assign n1629 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:60  */
  assign n1631 = n1629 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:78  */
  assign n1632 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:92  */
  assign n1634 = n1632 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:111  */
  assign n1635 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:126  */
  assign n1637 = n1635 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:142  */
  assign n1638 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:157  */
  assign n1640 = n1638 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:133  */
  assign n1641 = n1637 | n1640;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:173  */
  assign n1642 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:188  */
  assign n1644 = n1642 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:164  */
  assign n1645 = n1641 | n1644;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:204  */
  assign n1646 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:219  */
  assign n1648 = n1646 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:195  */
  assign n1649 = n1645 | n1648;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:100  */
  assign n1650 = n1649 & n1634;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:65  */
  assign n1651 = n1650 ? n1631 : n1666;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:46  */
  assign n1652 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:60  */
  assign n1654 = n1652 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:78  */
  assign n1655 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:92  */
  assign n1657 = n1655 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:111  */
  assign n1658 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:126  */
  assign n1660 = n1658 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:142  */
  assign n1661 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:157  */
  assign n1663 = n1661 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:133  */
  assign n1664 = n1660 | n1663;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:100  */
  assign n1665 = n1664 & n1657;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:134:228  */
  assign n1666 = n1665 ? n1654 : n1681;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:46  */
  assign n1667 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:60  */
  assign n1669 = n1667 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:78  */
  assign n1670 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:92  */
  assign n1672 = n1670 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:111  */
  assign n1673 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:126  */
  assign n1675 = n1673 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:142  */
  assign n1676 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:157  */
  assign n1678 = n1676 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:133  */
  assign n1679 = n1675 | n1678;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:100  */
  assign n1680 = n1679 & n1672;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:136:166  */
  assign n1681 = n1680 ? n1669 : n1696;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:46  */
  assign n1682 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:60  */
  assign n1684 = n1682 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:78  */
  assign n1685 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:92  */
  assign n1687 = n1685 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:111  */
  assign n1688 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:126  */
  assign n1690 = n1688 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:142  */
  assign n1691 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:157  */
  assign n1693 = n1691 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:133  */
  assign n1694 = n1690 | n1693;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:100  */
  assign n1695 = n1694 & n1687;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:137:166  */
  assign n1696 = n1695 ? n1684 : n1711;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:46  */
  assign n1697 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:60  */
  assign n1699 = n1697 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:78  */
  assign n1700 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:92  */
  assign n1702 = n1700 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:111  */
  assign n1703 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:126  */
  assign n1705 = n1703 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:142  */
  assign n1706 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:157  */
  assign n1708 = n1706 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:133  */
  assign n1709 = n1705 | n1708;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:100  */
  assign n1710 = n1709 & n1702;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:139:166  */
  assign n1711 = n1710 ? n1699 : n1726;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:46  */
  assign n1712 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:60  */
  assign n1714 = n1712 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:78  */
  assign n1715 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:92  */
  assign n1717 = n1715 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:111  */
  assign n1718 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:126  */
  assign n1720 = n1718 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:142  */
  assign n1721 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:157  */
  assign n1723 = n1721 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:133  */
  assign n1724 = n1720 | n1723;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:100  */
  assign n1725 = n1724 & n1717;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:140:166  */
  assign n1726 = n1725 ? n1714 : n1741;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:46  */
  assign n1727 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:60  */
  assign n1729 = n1727 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:78  */
  assign n1730 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:92  */
  assign n1732 = n1730 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:111  */
  assign n1733 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:126  */
  assign n1735 = n1733 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:142  */
  assign n1736 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:157  */
  assign n1738 = n1736 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:133  */
  assign n1739 = n1735 | n1738;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:100  */
  assign n1740 = n1739 & n1732;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:142:166  */
  assign n1741 = n1740 ? n1729 : n1752;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:46  */
  assign n1742 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:60  */
  assign n1744 = n1742 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:78  */
  assign n1745 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:92  */
  assign n1747 = n1745 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:110  */
  assign n1748 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:125  */
  assign n1750 = n1748 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:100  */
  assign n1751 = n1750 & n1747;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:143:166  */
  assign n1752 = n1751 ? n1744 : n1763;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:46  */
  assign n1753 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:60  */
  assign n1755 = n1753 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:78  */
  assign n1756 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:92  */
  assign n1758 = n1756 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:110  */
  assign n1759 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:125  */
  assign n1761 = n1759 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:100  */
  assign n1762 = n1761 & n1758;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:145:133  */
  assign n1763 = n1762 ? n1755 : n1774;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:46  */
  assign n1764 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:60  */
  assign n1766 = n1764 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:78  */
  assign n1767 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:92  */
  assign n1769 = n1767 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:110  */
  assign n1770 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:125  */
  assign n1772 = n1770 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:100  */
  assign n1773 = n1772 & n1769;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:146:133  */
  assign n1774 = n1773 ? n1766 : n1785;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:46  */
  assign n1775 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:60  */
  assign n1777 = n1775 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:78  */
  assign n1778 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:92  */
  assign n1780 = n1778 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:110  */
  assign n1781 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:125  */
  assign n1783 = n1781 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:100  */
  assign n1784 = n1783 & n1780;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:147:133  */
  assign n1785 = n1784 ? n1777 : n1796;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:46  */
  assign n1786 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:60  */
  assign n1788 = n1786 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:78  */
  assign n1789 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:92  */
  assign n1791 = n1789 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:110  */
  assign n1792 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:125  */
  assign n1794 = n1792 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:100  */
  assign n1795 = n1794 & n1791;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:148:133  */
  assign n1796 = n1795 ? n1788 : n1807;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:46  */
  assign n1797 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:60  */
  assign n1799 = n1797 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:78  */
  assign n1800 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:92  */
  assign n1802 = n1800 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:110  */
  assign n1803 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:125  */
  assign n1805 = n1803 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:100  */
  assign n1806 = n1805 & n1802;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:150:133  */
  assign n1807 = n1806 ? n1799 : n1818;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:46  */
  assign n1808 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:60  */
  assign n1810 = n1808 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:78  */
  assign n1811 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:92  */
  assign n1813 = n1811 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:110  */
  assign n1814 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:125  */
  assign n1816 = n1814 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:100  */
  assign n1817 = n1816 & n1813;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:151:133  */
  assign n1818 = n1817 ? n1810 : n1829;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:46  */
  assign n1819 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:60  */
  assign n1821 = n1819 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:78  */
  assign n1822 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:92  */
  assign n1824 = n1822 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:110  */
  assign n1825 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:125  */
  assign n1827 = n1825 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:100  */
  assign n1828 = n1827 & n1824;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:152:133  */
  assign n1829 = n1828 ? n1821 : n1840;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:46  */
  assign n1830 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:60  */
  assign n1832 = n1830 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:78  */
  assign n1833 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:92  */
  assign n1835 = n1833 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:110  */
  assign n1836 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:125  */
  assign n1838 = n1836 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:100  */
  assign n1839 = n1838 & n1835;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:153:133  */
  assign n1840 = n1839 ? n1832 : n1851;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:46  */
  assign n1841 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:60  */
  assign n1843 = n1841 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:78  */
  assign n1844 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:92  */
  assign n1846 = n1844 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:110  */
  assign n1847 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:125  */
  assign n1849 = n1847 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:100  */
  assign n1850 = n1849 & n1846;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:155:133  */
  assign n1851 = n1850 ? n1843 : n1862;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:46  */
  assign n1852 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:60  */
  assign n1854 = n1852 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:78  */
  assign n1855 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:92  */
  assign n1857 = n1855 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:110  */
  assign n1858 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:125  */
  assign n1860 = n1858 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:100  */
  assign n1861 = n1860 & n1857;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:156:133  */
  assign n1862 = n1861 ? n1854 : n1873;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:46  */
  assign n1863 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:60  */
  assign n1865 = n1863 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:78  */
  assign n1866 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:92  */
  assign n1868 = n1866 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:110  */
  assign n1869 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:125  */
  assign n1871 = n1869 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:158:100  */
  assign n1872 = n1871 & n1868;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:157:133  */
  assign n1873 = n1872 ? n1865 : 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:46  */
  assign n1875 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:60  */
  assign n1877 = n1875 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:78  */
  assign n1878 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:92  */
  assign n1880 = n1878 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:111  */
  assign n1881 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:126  */
  assign n1883 = n1881 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:142  */
  assign n1884 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:157  */
  assign n1886 = n1884 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:133  */
  assign n1887 = n1883 | n1886;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:173  */
  assign n1888 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:188  */
  assign n1890 = n1888 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:164  */
  assign n1891 = n1887 | n1890;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:204  */
  assign n1892 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:219  */
  assign n1894 = n1892 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:195  */
  assign n1895 = n1891 | n1894;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:100  */
  assign n1896 = n1895 & n1880;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:65  */
  assign n1897 = n1896 ? n1877 : n1912;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:46  */
  assign n1898 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:60  */
  assign n1900 = n1898 + 4'b0010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:78  */
  assign n1901 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:92  */
  assign n1903 = n1901 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:111  */
  assign n1904 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:126  */
  assign n1906 = n1904 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:142  */
  assign n1907 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:157  */
  assign n1909 = n1907 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:133  */
  assign n1910 = n1906 | n1909;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:100  */
  assign n1911 = n1910 & n1903;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:161:228  */
  assign n1912 = n1911 ? n1900 : n1927;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:46  */
  assign n1913 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:60  */
  assign n1915 = n1913 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:78  */
  assign n1916 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:92  */
  assign n1918 = n1916 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:111  */
  assign n1919 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:126  */
  assign n1921 = n1919 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:142  */
  assign n1922 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:157  */
  assign n1924 = n1922 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:133  */
  assign n1925 = n1921 | n1924;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:100  */
  assign n1926 = n1925 & n1918;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:163:166  */
  assign n1927 = n1926 ? n1915 : n1942;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:46  */
  assign n1928 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:60  */
  assign n1930 = n1928 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:78  */
  assign n1931 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:92  */
  assign n1933 = n1931 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:111  */
  assign n1934 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:126  */
  assign n1936 = n1934 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:142  */
  assign n1937 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:157  */
  assign n1939 = n1937 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:133  */
  assign n1940 = n1936 | n1939;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:100  */
  assign n1941 = n1940 & n1933;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:164:166  */
  assign n1942 = n1941 ? n1930 : n1957;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:46  */
  assign n1943 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:60  */
  assign n1945 = n1943 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:78  */
  assign n1946 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:92  */
  assign n1948 = n1946 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:111  */
  assign n1949 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:126  */
  assign n1951 = n1949 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:142  */
  assign n1952 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:157  */
  assign n1954 = n1952 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:133  */
  assign n1955 = n1951 | n1954;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:100  */
  assign n1956 = n1955 & n1948;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:166:166  */
  assign n1957 = n1956 ? n1945 : n1972;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:46  */
  assign n1958 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:60  */
  assign n1960 = n1958 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:78  */
  assign n1961 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:92  */
  assign n1963 = n1961 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:111  */
  assign n1964 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:126  */
  assign n1966 = n1964 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:142  */
  assign n1967 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:157  */
  assign n1969 = n1967 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:133  */
  assign n1970 = n1966 | n1969;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:100  */
  assign n1971 = n1970 & n1963;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:167:166  */
  assign n1972 = n1971 ? n1960 : n1987;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:46  */
  assign n1973 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:60  */
  assign n1975 = n1973 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:78  */
  assign n1976 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:92  */
  assign n1978 = n1976 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:111  */
  assign n1979 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:126  */
  assign n1981 = n1979 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:142  */
  assign n1982 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:157  */
  assign n1984 = n1982 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:133  */
  assign n1985 = n1981 | n1984;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:100  */
  assign n1986 = n1985 & n1978;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:169:166  */
  assign n1987 = n1986 ? n1975 : n1998;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:46  */
  assign n1988 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:60  */
  assign n1990 = n1988 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:78  */
  assign n1991 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:92  */
  assign n1993 = n1991 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:110  */
  assign n1994 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:125  */
  assign n1996 = n1994 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:100  */
  assign n1997 = n1996 & n1993;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:170:166  */
  assign n1998 = n1997 ? n1990 : n2009;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:46  */
  assign n1999 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:60  */
  assign n2001 = n1999 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:78  */
  assign n2002 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:92  */
  assign n2004 = n2002 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:110  */
  assign n2005 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:125  */
  assign n2007 = n2005 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:100  */
  assign n2008 = n2007 & n2004;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:172:133  */
  assign n2009 = n2008 ? n2001 : n2020;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:46  */
  assign n2010 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:60  */
  assign n2012 = n2010 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:78  */
  assign n2013 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:92  */
  assign n2015 = n2013 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:110  */
  assign n2016 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:125  */
  assign n2018 = n2016 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:100  */
  assign n2019 = n2018 & n2015;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:173:133  */
  assign n2020 = n2019 ? n2012 : n2031;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:46  */
  assign n2021 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:60  */
  assign n2023 = n2021 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:78  */
  assign n2024 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:92  */
  assign n2026 = n2024 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:110  */
  assign n2027 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:125  */
  assign n2029 = n2027 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:100  */
  assign n2030 = n2029 & n2026;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:174:133  */
  assign n2031 = n2030 ? n2023 : n2042;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:46  */
  assign n2032 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:60  */
  assign n2034 = n2032 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:78  */
  assign n2035 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:92  */
  assign n2037 = n2035 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:110  */
  assign n2038 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:125  */
  assign n2040 = n2038 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:100  */
  assign n2041 = n2040 & n2037;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:175:133  */
  assign n2042 = n2041 ? n2034 : n2053;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:46  */
  assign n2043 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:60  */
  assign n2045 = n2043 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:78  */
  assign n2046 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:92  */
  assign n2048 = n2046 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:110  */
  assign n2049 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:125  */
  assign n2051 = n2049 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:100  */
  assign n2052 = n2051 & n2048;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:177:133  */
  assign n2053 = n2052 ? n2045 : n2064;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:46  */
  assign n2054 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:60  */
  assign n2056 = n2054 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:78  */
  assign n2057 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:92  */
  assign n2059 = n2057 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:110  */
  assign n2060 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:125  */
  assign n2062 = n2060 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:100  */
  assign n2063 = n2062 & n2059;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:178:133  */
  assign n2064 = n2063 ? n2056 : n2075;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:46  */
  assign n2065 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:60  */
  assign n2067 = n2065 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:78  */
  assign n2068 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:92  */
  assign n2070 = n2068 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:110  */
  assign n2071 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:125  */
  assign n2073 = n2071 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:100  */
  assign n2074 = n2073 & n2070;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:179:133  */
  assign n2075 = n2074 ? n2067 : n2086;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:46  */
  assign n2076 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:60  */
  assign n2078 = n2076 + 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:78  */
  assign n2079 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:92  */
  assign n2081 = n2079 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:110  */
  assign n2082 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:125  */
  assign n2084 = n2082 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:100  */
  assign n2085 = n2084 & n2081;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:180:133  */
  assign n2086 = n2085 ? n2078 : n2097;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:46  */
  assign n2087 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:60  */
  assign n2089 = n2087 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:78  */
  assign n2090 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:92  */
  assign n2092 = n2090 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:110  */
  assign n2093 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:125  */
  assign n2095 = n2093 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:100  */
  assign n2096 = n2095 & n2092;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:182:133  */
  assign n2097 = n2096 ? n2089 : n2108;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:46  */
  assign n2098 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:60  */
  assign n2100 = n2098 - 4'b0001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:78  */
  assign n2101 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:92  */
  assign n2103 = n2101 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:110  */
  assign n2104 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:125  */
  assign n2106 = n2104 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:100  */
  assign n2107 = n2106 & n2103;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:183:133  */
  assign n2108 = n2107 ? n2100 : n2119;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:46  */
  assign n2109 = lp_bus[3:0]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:60  */
  assign n2111 = n2109 + 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:78  */
  assign n2112 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:92  */
  assign n2114 = n2112 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:110  */
  assign n2115 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:125  */
  assign n2117 = n2115 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:185:100  */
  assign n2118 = n2117 & n2114;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:184:133  */
  assign n2119 = n2118 ? n2111 : 4'b0000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:46  */
  assign n2121 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:60  */
  assign n2123 = n2121 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:78  */
  assign n2124 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:92  */
  assign n2126 = n2124 == 3'b000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:111  */
  assign n2127 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:126  */
  assign n2129 = n2127 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:142  */
  assign n2130 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:157  */
  assign n2132 = n2130 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:133  */
  assign n2133 = n2129 | n2132;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:173  */
  assign n2134 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:188  */
  assign n2136 = n2134 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:164  */
  assign n2137 = n2133 | n2136;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:204  */
  assign n2138 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:219  */
  assign n2140 = n2138 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:195  */
  assign n2141 = n2137 | n2140;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:100  */
  assign n2142 = n2141 & n2126;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:65  */
  assign n2143 = n2142 ? n2123 : n2158;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:46  */
  assign n2144 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:60  */
  assign n2146 = n2144 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:78  */
  assign n2147 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:92  */
  assign n2149 = n2147 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:111  */
  assign n2150 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:126  */
  assign n2152 = n2150 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:142  */
  assign n2153 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:157  */
  assign n2155 = n2153 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:133  */
  assign n2156 = n2152 | n2155;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:100  */
  assign n2157 = n2156 & n2149;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:188:228  */
  assign n2158 = n2157 ? n2146 : n2173;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:46  */
  assign n2159 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:60  */
  assign n2161 = n2159 - 5'b00010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:78  */
  assign n2162 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:92  */
  assign n2164 = n2162 == 3'b001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:111  */
  assign n2165 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:126  */
  assign n2167 = n2165 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:142  */
  assign n2168 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:157  */
  assign n2170 = n2168 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:133  */
  assign n2171 = n2167 | n2170;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:100  */
  assign n2172 = n2171 & n2164;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:190:166  */
  assign n2173 = n2172 ? n2161 : n2188;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:46  */
  assign n2174 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:60  */
  assign n2176 = n2174 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:78  */
  assign n2177 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:92  */
  assign n2179 = n2177 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:111  */
  assign n2180 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:126  */
  assign n2182 = n2180 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:142  */
  assign n2183 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:157  */
  assign n2185 = n2183 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:133  */
  assign n2186 = n2182 | n2185;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:100  */
  assign n2187 = n2186 & n2179;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:191:166  */
  assign n2188 = n2187 ? n2176 : n2203;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:46  */
  assign n2189 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:60  */
  assign n2191 = n2189 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:78  */
  assign n2192 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:92  */
  assign n2194 = n2192 == 3'b010;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:111  */
  assign n2195 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:126  */
  assign n2197 = n2195 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:142  */
  assign n2198 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:157  */
  assign n2200 = n2198 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:133  */
  assign n2201 = n2197 | n2200;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:100  */
  assign n2202 = n2201 & n2194;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:193:166  */
  assign n2203 = n2202 ? n2191 : n2218;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:46  */
  assign n2204 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:60  */
  assign n2206 = n2204 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:78  */
  assign n2207 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:92  */
  assign n2209 = n2207 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:111  */
  assign n2210 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:126  */
  assign n2212 = n2210 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:142  */
  assign n2213 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:157  */
  assign n2215 = n2213 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:133  */
  assign n2216 = n2212 | n2215;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:100  */
  assign n2217 = n2216 & n2209;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:194:166  */
  assign n2218 = n2217 ? n2206 : n2233;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:46  */
  assign n2219 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:60  */
  assign n2221 = n2219 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:78  */
  assign n2222 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:92  */
  assign n2224 = n2222 == 3'b011;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:111  */
  assign n2225 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:126  */
  assign n2227 = n2225 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:142  */
  assign n2228 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:157  */
  assign n2230 = n2228 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:133  */
  assign n2231 = n2227 | n2230;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:100  */
  assign n2232 = n2231 & n2224;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:196:166  */
  assign n2233 = n2232 ? n2221 : n2244;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:46  */
  assign n2234 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:60  */
  assign n2236 = n2234 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:78  */
  assign n2237 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:92  */
  assign n2239 = n2237 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:110  */
  assign n2240 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:125  */
  assign n2242 = n2240 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:100  */
  assign n2243 = n2242 & n2239;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:197:166  */
  assign n2244 = n2243 ? n2236 : n2255;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:46  */
  assign n2245 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:60  */
  assign n2247 = n2245 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:78  */
  assign n2248 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:92  */
  assign n2250 = n2248 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:110  */
  assign n2251 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:125  */
  assign n2253 = n2251 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:100  */
  assign n2254 = n2253 & n2250;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:199:133  */
  assign n2255 = n2254 ? n2247 : n2266;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:46  */
  assign n2256 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:60  */
  assign n2258 = n2256 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:78  */
  assign n2259 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:92  */
  assign n2261 = n2259 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:110  */
  assign n2262 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:125  */
  assign n2264 = n2262 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:100  */
  assign n2265 = n2264 & n2261;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:200:133  */
  assign n2266 = n2265 ? n2258 : n2277;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:46  */
  assign n2267 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:60  */
  assign n2269 = n2267 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:78  */
  assign n2270 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:92  */
  assign n2272 = n2270 == 3'b100;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:110  */
  assign n2273 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:125  */
  assign n2275 = n2273 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:100  */
  assign n2276 = n2275 & n2272;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:201:133  */
  assign n2277 = n2276 ? n2269 : n2288;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:46  */
  assign n2278 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:60  */
  assign n2280 = n2278 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:78  */
  assign n2281 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:92  */
  assign n2283 = n2281 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:110  */
  assign n2284 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:125  */
  assign n2286 = n2284 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:100  */
  assign n2287 = n2286 & n2283;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:202:133  */
  assign n2288 = n2287 ? n2280 : n2299;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:46  */
  assign n2289 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:60  */
  assign n2291 = n2289 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:78  */
  assign n2292 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:92  */
  assign n2294 = n2292 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:110  */
  assign n2295 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:125  */
  assign n2297 = n2295 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:100  */
  assign n2298 = n2297 & n2294;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:204:133  */
  assign n2299 = n2298 ? n2291 : n2310;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:46  */
  assign n2300 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:60  */
  assign n2302 = n2300 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:78  */
  assign n2303 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:92  */
  assign n2305 = n2303 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:110  */
  assign n2306 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:125  */
  assign n2308 = n2306 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:100  */
  assign n2309 = n2308 & n2305;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:205:133  */
  assign n2310 = n2309 ? n2302 : n2321;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:46  */
  assign n2311 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:60  */
  assign n2313 = n2311 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:78  */
  assign n2314 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:92  */
  assign n2316 = n2314 == 3'b101;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:110  */
  assign n2317 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:125  */
  assign n2319 = n2317 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:100  */
  assign n2320 = n2319 & n2316;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:206:133  */
  assign n2321 = n2320 ? n2313 : n2332;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:46  */
  assign n2322 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:60  */
  assign n2324 = n2322 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:78  */
  assign n2325 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:92  */
  assign n2327 = n2325 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:110  */
  assign n2328 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:125  */
  assign n2330 = n2328 == 2'b00;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:100  */
  assign n2331 = n2330 & n2327;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:207:133  */
  assign n2332 = n2331 ? n2324 : n2343;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:46  */
  assign n2333 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:60  */
  assign n2335 = n2333 - 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:78  */
  assign n2336 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:92  */
  assign n2338 = n2336 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:110  */
  assign n2339 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:125  */
  assign n2341 = n2339 == 2'b01;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:100  */
  assign n2342 = n2341 & n2338;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:209:133  */
  assign n2343 = n2342 ? n2335 : n2354;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:46  */
  assign n2344 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:60  */
  assign n2346 = n2344 + 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:78  */
  assign n2347 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:92  */
  assign n2349 = n2347 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:110  */
  assign n2350 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:125  */
  assign n2352 = n2350 == 2'b10;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:100  */
  assign n2353 = n2352 & n2349;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:210:133  */
  assign n2354 = n2353 ? n2346 : n2365;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:46  */
  assign n2355 = lp_bus[8:4]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:60  */
  assign n2357 = n2355 + 5'b00001;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:78  */
  assign n2358 = lp_bus[11:9]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:92  */
  assign n2360 = n2358 == 3'b110;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:110  */
  assign n2361 = lp_bus[13:12]; // extract
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:125  */
  assign n2363 = n2361 == 2'b11;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:212:100  */
  assign n2364 = n2363 & n2360;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:211:133  */
  assign n2365 = n2364 ? n2357 : 5'b00000;
  /* ../../vhdl/rtl/GAME/lastpos/rtl/lastpos_ea.vhd:31:5  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n2367 <= 14'b00000000000000;
    else
      n2367 <= lp_bus_next;
endmodule

module control_ea
  (input  reset_i,
   input  clk_i,
   input  tick_i,
   input  ack_set_i,
   input  req_move_i,
   input  ack_check_i,
   input  ack_des_i,
   input  ack_del_i,
   output req_set_o,
   output ack_move_o,
   output req_check_o,
   output req_des_o,
   output req_del_o,
   input  frozen_i,
   input  game_over_i,
   input  finish_strb_i);
  wire [4:0] state;
  wire [4:0] next_state;
  wire [4:0] n756;
  wire n758;
  wire [4:0] n760;
  wire n762;
  wire [4:0] n764;
  wire n766;
  wire n768;
  wire [4:0] n771;
  wire n773;
  wire n775;
  wire n776;
  wire n777;
  wire n778;
  wire n779;
  wire n780;
  wire [4:0] n782;
  wire [4:0] n784;
  wire n786;
  wire n787;
  wire [4:0] n789;
  wire n791;
  wire [4:0] n793;
  wire n795;
  wire n797;
  wire [4:0] n799;
  wire [4:0] n801;
  wire n803;
  wire n804;
  wire [4:0] n806;
  wire [4:0] n808;
  wire n810;
  wire n811;
  wire [4:0] n813;
  wire n815;
  wire [4:0] n817;
  wire n819;
  wire n821;
  wire [4:0] n823;
  wire n825;
  wire n827;
  wire [16:0] n828;
  reg [4:0] n834;
  wire n838;
  wire n839;
  wire n843;
  wire n844;
  wire n848;
  wire n849;
  wire n853;
  wire n854;
  wire n858;
  wire n860;
  wire n861;
  wire n862;
  reg [4:0] n864;
  assign req_set_o = n839; //(module output)
  assign ack_move_o = n862; //(module output)
  assign req_check_o = n844; //(module output)
  assign req_des_o = n849; //(module output)
  assign req_del_o = n854; //(module output)
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:37:12  */
  assign state = n864; // (signal)
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:38:12  */
  assign next_state = n834; // (signal)
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:61:21  */
  assign n756 = finish_strb_i ? 5'b00001 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:60:17  */
  assign n758 = state == 5'b00000;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:65:21  */
  assign n760 = tick_i ? 5'b00010 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:64:17  */
  assign n762 = state == 5'b00001;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:70:21  */
  assign n764 = ack_set_i ? 5'b00011 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:69:17  */
  assign n766 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:74:17  */
  assign n768 = state == 5'b00011;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:77:21  */
  assign n771 = game_over_i ? 5'b10010 : 5'b00101;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:76:17  */
  assign n773 = state == 5'b00100;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:82:17  */
  assign n775 = state == 5'b00101;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:88:55  */
  assign n776 = ~frozen_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:88:42  */
  assign n777 = n776 & ack_check_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:90:45  */
  assign n778 = frozen_i & ack_check_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:90:78  */
  assign n779 = ~ack_del_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:90:64  */
  assign n780 = n779 & n778;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:90:21  */
  assign n782 = n780 ? 5'b01111 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:88:21  */
  assign n784 = n777 ? 5'b00111 : n782;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:87:17  */
  assign n786 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:94:34  */
  assign n787 = ~ack_des_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:94:21  */
  assign n789 = n787 ? 5'b01000 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:93:17  */
  assign n791 = state == 5'b00111;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:98:21  */
  assign n793 = ack_des_i ? 5'b01001 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:97:17  */
  assign n795 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:102:17  */
  assign n797 = state == 5'b01001;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:108:21  */
  assign n799 = req_move_i ? 5'b01011 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:105:21  */
  assign n801 = tick_i ? 5'b00110 : n799;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:104:17  */
  assign n803 = state == 5'b01010;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:114:38  */
  assign n804 = ~req_move_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:114:21  */
  assign n806 = n804 ? 5'b01010 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:112:21  */
  assign n808 = tick_i ? 5'b01110 : n806;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:111:17  */
  assign n810 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:119:35  */
  assign n811 = ~req_move_i;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:119:21  */
  assign n813 = n811 ? 5'b00110 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:118:17  */
  assign n815 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:124:21  */
  assign n817 = ack_del_i ? 5'b10000 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:123:17  */
  assign n819 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:128:17  */
  assign n821 = state == 5'b10000;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:131:21  */
  assign n823 = tick_i ? 5'b00010 : state;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:130:17  */
  assign n825 = state == 5'b10001;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:135:17  */
  assign n827 = state == 5'b10010;
  assign n828 = {n827, n825, n821, n819, n815, n810, n803, n797, n795, n791, n786, n775, n773, n768, n766, n762, n758};
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:59:13  */
  always @*
    case (n828)
      17'b10000000000000000: n834 = state;
      17'b01000000000000000: n834 = n823;
      17'b00100000000000000: n834 = 5'b10001;
      17'b00010000000000000: n834 = n817;
      17'b00001000000000000: n834 = n813;
      17'b00000100000000000: n834 = n808;
      17'b00000010000000000: n834 = n801;
      17'b00000001000000000: n834 = 5'b01010;
      17'b00000000100000000: n834 = n793;
      17'b00000000010000000: n834 = n789;
      17'b00000000001000000: n834 = n784;
      17'b00000000000100000: n834 = 5'b01010;
      17'b00000000000010000: n834 = n771;
      17'b00000000000001000: n834 = 5'b00100;
      17'b00000000000000100: n834 = n764;
      17'b00000000000000010: n834 = n760;
      17'b00000000000000001: n834 = n756;
      default: n834 = 5'b00000;
    endcase
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:143:33  */
  assign n838 = state == 5'b00010;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:143:22  */
  assign n839 = n838 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:145:35  */
  assign n843 = state == 5'b00110;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:145:24  */
  assign n844 = n843 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:147:33  */
  assign n848 = state == 5'b01000;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:147:22  */
  assign n849 = n848 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:149:33  */
  assign n853 = state == 5'b01111;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:149:22  */
  assign n854 = n853 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:151:34  */
  assign n858 = state == 5'b01011;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:151:49  */
  assign n860 = state == 5'b01110;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:151:40  */
  assign n861 = n858 | n860;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:151:23  */
  assign n862 = n861 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/control/rtl/control_ea.vhd:47:9  */
  always @(posedge clk_i or posedge reset_i)
    if (reset_i)
      n864 <= 5'b00000;
    else
      n864 <= next_state;
endmodule

module random_ea
  (input  clk_i,
   input  lr_i,
   input  rr_i,
   input  dn_i,
   input  dr_i,
   input  reset_i,
   input  tick_i,
   output [2:0] randtyp_o);
  wire [2:0] next_cnt;
  wire [2:0] cnt;
  wire [2:0] n718;
  wire n719;
  wire n720;
  wire n721;
  wire n722;
  wire n723;
  wire n725;
  wire n726;
  wire [2:0] n727;
  wire n730;
  wire n731;
  wire n732;
  wire n733;
  wire n734;
  wire n735;
  wire n736;
  wire [2:0] n737;
  wire n739;
  wire [2:0] n740;
  reg [2:0] n742;
  assign randtyp_o = cnt; //(module output)
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:19:10  */
  assign next_cnt = n727; // (signal)
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:20:10  */
  assign cnt = n742; // (signal)
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:19  */
  assign n718 = cnt + 3'b001;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:41  */
  assign n719 = lr_i | rr_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:55  */
  assign n720 = n719 | dn_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:69  */
  assign n721 = n720 | dr_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:83  */
  assign n722 = n721 | tick_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:99  */
  assign n723 = n722 | reset_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:125  */
  assign n725 = $unsigned(cnt) <= $unsigned(3'b101);
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:117  */
  assign n726 = n725 & n723;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:23  */
  assign n727 = n726 ? n718 : n737;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:30  */
  assign n730 = cnt == 3'b110;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:54  */
  assign n731 = lr_i | rr_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:68  */
  assign n732 = n731 | dn_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:82  */
  assign n733 = n732 | dr_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:96  */
  assign n734 = n733 | tick_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:112  */
  assign n735 = n734 | reset_i;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:38  */
  assign n736 = n735 & n730;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:32:135  */
  assign n737 = n736 ? 3'b000 : n740;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:34:28  */
  assign n739 = $unsigned(cnt) <= $unsigned(3'b110);
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:33:130  */
  assign n740 = n739 ? cnt : 3'b000;
  /* ../../vhdl/rtl/GAME/random/rtl/random_ea.vhd:27:5  */
  always @(posedge clk_i)
    n742 <= next_cnt;
endmodule

module timer_ea
  (input  rst_i,
   input  clock_i,
   input  game_speed_i,
   output tick_o,
   input  tick_reset_i);
  reg [25:0] cnt;
  reg [25:0] next_cnt;
  reg [25:0] downcnt;
  reg [25:0] next_downcnt;
  reg tick;
  reg [25:0] tick_time;
  wire [25:0] tickmintime;
  reg init;
  reg next_init;
  wire [25:0] n667;
  wire [25:0] n670;
  wire n685;
  wire n686;
  wire [25:0] n689;
  wire n691;
  wire [25:0] n692;
  wire [25:0] n694;
  wire n695;
  wire [25:0] n696;
  wire n699;
  wire [25:0] n701;
  wire n702;
  wire [25:0] n703;
  wire [25:0] n704;
  wire [25:0] n705;
  wire n707;
  reg [25:0] n709;
  reg [25:0] n710;
  reg n711;
  assign tick_o = tick; //(module output)
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:21:12  */
  always @*
    cnt = n709; // (isignal)
  initial
    cnt = 26'b00000000000000000000000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:22:12  */
  always @*
    next_cnt = n689; // (isignal)
  initial
    next_cnt = 26'b00000000000000000000000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:23:12  */
  always @*
    downcnt = n710; // (isignal)
  initial
    downcnt = 26'b00000000000000000000000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:24:12  */
  always @*
    next_downcnt = n705; // (isignal)
  initial
    next_downcnt = 26'b00000000000000000000000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:25:12  */
  always @*
    tick = n686; // (isignal)
  initial
    tick = 1'b0;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:26:12  */
  always @*
    tick_time = n667; // (isignal)
  initial
    tick_time = 26'b00000000000000000000000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:27:12  */
  assign tickmintime = n670; // (signal)
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:28:12  */
  always @*
    init = n711; // (isignal)
  initial
    init = 1'b0;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:28:18  */
  always @*
    next_init = n707; // (isignal)
  initial
    next_init = 1'b0;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:32:30  */
  assign n667 = game_speed_i ? 26'b00101001111101100011000000 : 26'b01010011111011000110000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:33:34  */
  assign n670 = game_speed_i ? 26'b00000011110100001001000000 : 26'b00000111101000010010000000;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:48:26  */
  assign n685 = cnt == downcnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:48:17  */
  assign n686 = n685 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:52:33  */
  assign n689 = tick_reset_i ? 26'b00000000000000000000000000 : n692;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:53:42  */
  assign n691 = cnt == downcnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:52:57  */
  assign n692 = n691 ? 26'b00000000000000000000000000 : n696;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:54:21  */
  assign n694 = cnt + 26'b00000000000000000000000001;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:54:34  */
  assign n695 = $unsigned(cnt) < $unsigned(downcnt);
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:53:52  */
  assign n696 = n695 ? n694 : cnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:62:17  */
  assign n699 = ~init;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:67:41  */
  assign n701 = downcnt - 26'b00000000000000000111110100;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:68:27  */
  assign n702 = $unsigned(downcnt) <= $unsigned(tickmintime);
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:68:13  */
  assign n703 = n702 ? tickmintime : downcnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:66:13  */
  assign n704 = tick ? n701 : n703;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:62:9  */
  assign n705 = n699 ? tick_time : n704;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:62:9  */
  assign n707 = n699 ? 1'b1 : init;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:41:9  */
  always @(posedge clock_i or posedge rst_i)
    if (rst_i)
      n709 <= 26'b00000000000000000000000000;
    else
      n709 <= next_cnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:41:9  */
  always @(posedge clock_i or posedge rst_i)
    if (rst_i)
      n710 <= 26'b00000000000000000000000000;
    else
      n710 <= next_downcnt;
  /* ../../vhdl/rtl/GAME/Timer/rtl/timer_ea.vhd:41:9  */
  always @(posedge clock_i or posedge rst_i)
    if (rst_i)
      n711 <= 1'b0;
    else
      n711 <= next_init;
endmodule

module debounce_ea
  (input  rr_i,
   input  lr_i,
   input  dnr_i,
   input  okr_i,
   input  reset_i,
   input  clock_i,
   output rr_o,
   output lr_o,
   output dnr_o,
   output okr_o,
   output reset_o);
  reg tast_lr;
  reg tast_rr;
  reg tast_dnr;
  reg tast_okr;
  reg tastentp_lr_next;
  reg tastentp_rr_next;
  reg tastentp_dnr_next;
  reg tastentp_okr_next;
  reg tastentp_lr;
  reg tastentp_rr;
  reg tastentp_dnr;
  reg tastentp_okr;
  reg tastentpnext_lr;
  reg tastentpnext_rr;
  reg tastentpnext_dnr;
  reg tastentpnext_okr;
  wire cntout_lr;
  wire cntout_rr;
  wire cntout_dnr;
  wire cntout_okr;
  wire [19:0] cntwert_lr;
  wire [19:0] cntwert_rr;
  wire [19:0] cntwert_dnr;
  wire [19:0] cntwert_okr;
  wire [19:0] cntwertnext_lr;
  wire [19:0] cntwertnext_rr;
  wire [19:0] cntwertnext_dnr;
  wire [19:0] cntwertnext_okr;
  wire [21:0] cnt_df_next_lr;
  wire [21:0] cnt_df_next_rr;
  wire [21:0] cnt_df_next_dnr;
  wire [21:0] cnt_df_lr;
  wire [21:0] cnt_df_rr;
  wire [21:0] cnt_df_dnr;
  wire cnt_df_out_lr;
  wire cnt_df_out_rr;
  wire cnt_df_out_dnr;
  wire cnt_df_en_lr;
  wire cnt_df_en_rr;
  wire cnt_df_en_dnr;
  wire [21:0] cnt_delay_next_lr;
  wire [21:0] cnt_delay_next_rr;
  wire [21:0] cnt_delay_next_dnr;
  wire [21:0] cnt_delay_lr;
  wire [21:0] cnt_delay_rr;
  wire [21:0] cnt_delay_dnr;
  wire n494;
  wire n496;
  wire n498;
  wire n500;
  wire n502;
  wire n504;
  wire n506;
  wire n508;
  wire [19:0] n510;
  wire n511;
  wire [19:0] n512;
  wire [19:0] n515;
  wire n516;
  wire [19:0] n517;
  wire [19:0] n520;
  wire n521;
  wire [19:0] n522;
  wire [19:0] n525;
  wire n526;
  wire [19:0] n527;
  wire n531;
  wire n532;
  wire n536;
  wire n537;
  wire n541;
  wire n542;
  wire n546;
  wire n547;
  wire [21:0] n550;
  wire n551;
  wire n552;
  wire [21:0] n553;
  wire [21:0] n556;
  wire n557;
  wire n558;
  wire [21:0] n559;
  wire [21:0] n562;
  wire n563;
  wire n564;
  wire [21:0] n565;
  wire n569;
  wire n570;
  wire n574;
  wire n575;
  wire n579;
  wire n580;
  wire n583;
  wire [21:0] n584;
  wire [21:0] n585;
  wire [21:0] n587;
  wire [21:0] n588;
  wire n591;
  wire [21:0] n592;
  wire [21:0] n593;
  wire [21:0] n595;
  wire [21:0] n596;
  wire n599;
  wire [21:0] n600;
  wire [21:0] n601;
  wire [21:0] n603;
  wire [21:0] n604;
  wire n608;
  wire n609;
  wire n613;
  wire n614;
  wire n618;
  wire n619;
  wire n621;
  wire n622;
  wire n623;
  wire n624;
  wire n625;
  wire n626;
  wire n627;
  wire n628;
  wire n629;
  wire n630;
  wire n631;
  reg n635;
  reg n636;
  reg n637;
  reg n638;
  reg n639;
  reg n640;
  reg n641;
  reg n642;
  reg n643;
  reg n644;
  reg n645;
  reg n646;
  reg [19:0] n647;
  reg [19:0] n648;
  reg [19:0] n649;
  reg [19:0] n650;
  reg [21:0] n651;
  reg [21:0] n652;
  reg [21:0] n653;
  reg [21:0] n654;
  reg [21:0] n655;
  reg [21:0] n656;
  assign rr_o = n626; //(module output)
  assign lr_o = n623; //(module output)
  assign dnr_o = n629; //(module output)
  assign okr_o = n631; //(module output)
  assign reset_o = reset_i; //(module output)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:18:12  */
  always @*
    tast_lr = n635; // (isignal)
  initial
    tast_lr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:18:21  */
  always @*
    tast_rr = n636; // (isignal)
  initial
    tast_rr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:18:30  */
  always @*
    tast_dnr = n637; // (isignal)
  initial
    tast_dnr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:18:40  */
  always @*
    tast_okr = n638; // (isignal)
  initial
    tast_okr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:19:12  */
  always @*
    tastentp_lr_next = n494; // (isignal)
  initial
    tastentp_lr_next = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:19:30  */
  always @*
    tastentp_rr_next = n498; // (isignal)
  initial
    tastentp_rr_next = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:19:48  */
  always @*
    tastentp_dnr_next = n506; // (isignal)
  initial
    tastentp_dnr_next = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:19:67  */
  always @*
    tastentp_okr_next = n502; // (isignal)
  initial
    tastentp_okr_next = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:21:12  */
  always @*
    tastentp_lr = n639; // (isignal)
  initial
    tastentp_lr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:21:25  */
  always @*
    tastentp_rr = n640; // (isignal)
  initial
    tastentp_rr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:21:38  */
  always @*
    tastentp_dnr = n641; // (isignal)
  initial
    tastentp_dnr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:21:52  */
  always @*
    tastentp_okr = n642; // (isignal)
  initial
    tastentp_okr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:22:12  */
  always @*
    tastentpnext_lr = n643; // (isignal)
  initial
    tastentpnext_lr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:22:29  */
  always @*
    tastentpnext_rr = n644; // (isignal)
  initial
    tastentpnext_rr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:22:46  */
  always @*
    tastentpnext_dnr = n645; // (isignal)
  initial
    tastentpnext_dnr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:22:64  */
  always @*
    tastentpnext_okr = n646; // (isignal)
  initial
    tastentpnext_okr = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:23:12  */
  assign cntout_lr = n532; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:23:23  */
  assign cntout_rr = n537; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:23:34  */
  assign cntout_dnr = n542; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:23:46  */
  assign cntout_okr = n547; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:24:12  */
  assign cntwert_lr = n647; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:24:24  */
  assign cntwert_rr = n648; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:24:36  */
  assign cntwert_dnr = n649; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:24:49  */
  assign cntwert_okr = n650; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:25:12  */
  assign cntwertnext_lr = n512; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:25:28  */
  assign cntwertnext_rr = n517; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:25:44  */
  assign cntwertnext_dnr = n522; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:25:61  */
  assign cntwertnext_okr = n527; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:26:12  */
  assign cnt_df_next_lr = n553; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:26:28  */
  assign cnt_df_next_rr = n559; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:26:44  */
  assign cnt_df_next_dnr = n565; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:27:12  */
  assign cnt_df_lr = n651; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:27:23  */
  assign cnt_df_rr = n652; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:27:34  */
  assign cnt_df_dnr = n653; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:28:12  */
  assign cnt_df_out_lr = n570; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:28:27  */
  assign cnt_df_out_rr = n575; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:28:42  */
  assign cnt_df_out_dnr = n580; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:29:12  */
  assign cnt_df_en_lr = n609; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:29:26  */
  assign cnt_df_en_rr = n614; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:29:40  */
  assign cnt_df_en_dnr = n619; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:30:12  */
  assign cnt_delay_next_lr = n584; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:30:31  */
  assign cnt_delay_next_rr = n592; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:30:50  */
  assign cnt_delay_next_dnr = n600; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:31:12  */
  assign cnt_delay_lr = n654; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:31:26  */
  assign cnt_delay_rr = n655; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:31:40  */
  assign cnt_delay_dnr = n656; // (signal)
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:81:29  */
  assign n494 = tast_lr ? 1'b1 : n496;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:81:48  */
  assign n496 = cntout_lr ? 1'b0 : tastentp_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:85:29  */
  assign n498 = tast_rr ? 1'b1 : n500;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:85:48  */
  assign n500 = cntout_rr ? 1'b0 : tastentp_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:89:30  */
  assign n502 = tast_okr ? 1'b1 : n504;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:89:50  */
  assign n504 = cntout_okr ? 1'b0 : tastentp_okr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:93:30  */
  assign n506 = tast_dnr ? 1'b1 : n508;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:93:50  */
  assign n508 = cntout_dnr ? 1'b0 : tastentp_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:102:34  */
  assign n510 = cntwert_lr + 20'b00000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:102:51  */
  assign n511 = ~tast_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:102:38  */
  assign n512 = n511 ? n510 : 20'b00000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:104:34  */
  assign n515 = cntwert_rr + 20'b00000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:104:51  */
  assign n516 = ~tast_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:104:38  */
  assign n517 = n516 ? n515 : 20'b00000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:106:36  */
  assign n520 = cntwert_dnr + 20'b00000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:106:54  */
  assign n521 = ~tast_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:106:40  */
  assign n522 = n521 ? n520 : 20'b00000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:108:36  */
  assign n525 = cntwert_okr + 20'b00000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:108:54  */
  assign n526 = ~tast_okr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:108:40  */
  assign n527 = n526 ? n525 : 20'b00000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:114:38  */
  assign n531 = cntwert_lr == 20'b10010010011111000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:114:22  */
  assign n532 = n531 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:117:38  */
  assign n536 = cntwert_rr == 20'b10010010011111000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:117:22  */
  assign n537 = n536 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:120:40  */
  assign n541 = cntwert_dnr == 20'b10010010011111000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:120:23  */
  assign n542 = n541 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:123:40  */
  assign n546 = cntwert_okr == 20'b10010010011111000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:123:23  */
  assign n547 = n546 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:130:33  */
  assign n550 = cnt_df_lr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:130:80  */
  assign n551 = ~cnt_df_out_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:130:62  */
  assign n552 = n551 & cnt_df_en_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:130:37  */
  assign n553 = n552 ? n550 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:132:33  */
  assign n556 = cnt_df_rr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:132:80  */
  assign n557 = ~cnt_df_out_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:132:62  */
  assign n558 = n557 & cnt_df_en_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:132:37  */
  assign n559 = n558 ? n556 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:134:35  */
  assign n562 = cnt_df_dnr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:134:84  */
  assign n563 = ~cnt_df_out_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:134:65  */
  assign n564 = n563 & cnt_df_en_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:134:39  */
  assign n565 = n564 ? n562 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:138:41  */
  assign n569 = cnt_df_lr == 22'b0101101110001101100000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:138:26  */
  assign n570 = n569 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:140:41  */
  assign n574 = cnt_df_rr == 22'b0101101110001101100000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:140:26  */
  assign n575 = n574 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:142:43  */
  assign n579 = cnt_df_dnr == 22'b0101101110001101100000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:142:27  */
  assign n580 = n579 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:146:64  */
  assign n583 = ~tastentp_lr_next;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:146:42  */
  assign n584 = n583 ? 22'b0000000000000000000000 : n585;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:146:70  */
  assign n585 = cnt_df_en_lr ? cnt_delay_lr : n588;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:148:39  */
  assign n587 = cnt_delay_lr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:147:63  */
  assign n588 = tastentp_lr_next ? n587 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:151:64  */
  assign n591 = ~tastentp_rr_next;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:151:42  */
  assign n592 = n591 ? 22'b0000000000000000000000 : n593;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:151:70  */
  assign n593 = cnt_df_en_rr ? cnt_delay_rr : n596;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:153:39  */
  assign n595 = cnt_delay_rr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:152:63  */
  assign n596 = tastentp_rr_next ? n595 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:156:66  */
  assign n599 = ~tastentp_dnr_next;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:156:43  */
  assign n600 = n599 ? 22'b0000000000000000000000 : n601;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:156:72  */
  assign n601 = cnt_df_en_dnr ? cnt_delay_dnr : n604;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:158:41  */
  assign n603 = cnt_delay_dnr + 22'b0000000000000000000001;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:157:66  */
  assign n604 = tastentp_dnr_next ? n603 : 22'b0000000000000000000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:162:43  */
  assign n608 = cnt_delay_lr == 22'b1111010000100100000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:162:25  */
  assign n609 = n608 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:164:43  */
  assign n613 = cnt_delay_rr == 22'b1111010000100100000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:164:25  */
  assign n614 = n613 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:166:45  */
  assign n618 = cnt_delay_dnr == 22'b1111010000100100000000;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:166:26  */
  assign n619 = n618 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:170:30  */
  assign n621 = ~tastentpnext_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:170:26  */
  assign n622 = tastentp_lr & n621;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:170:51  */
  assign n623 = n622 | cnt_df_out_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:171:30  */
  assign n624 = ~tastentpnext_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:171:26  */
  assign n625 = tastentp_rr & n624;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:171:51  */
  assign n626 = n625 | cnt_df_out_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:172:32  */
  assign n627 = ~tastentpnext_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:172:28  */
  assign n628 = tastentp_dnr & n627;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:172:54  */
  assign n629 = n628 | cnt_df_out_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:173:32  */
  assign n630 = ~tastentpnext_okr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:173:28  */
  assign n631 = tastentp_okr & n630;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n635 <= lr_i;
  initial
    n635 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n636 <= rr_i;
  initial
    n636 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n637 <= dnr_i;
  initial
    n637 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n638 <= okr_i;
  initial
    n638 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n639 <= tastentp_lr_next;
  initial
    n639 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n640 <= tastentp_rr_next;
  initial
    n640 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n641 <= tastentp_dnr_next;
  initial
    n641 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n642 <= tastentp_okr_next;
  initial
    n642 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n643 <= tastentp_lr;
  initial
    n643 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n644 <= tastentp_rr;
  initial
    n644 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n645 <= tastentp_dnr;
  initial
    n645 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n646 <= tastentp_okr;
  initial
    n646 = 1'b0;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n647 <= cntwertnext_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n648 <= cntwertnext_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n649 <= cntwertnext_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n650 <= cntwertnext_okr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n651 <= cnt_df_next_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n652 <= cnt_df_next_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n653 <= cnt_df_next_dnr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n654 <= cnt_delay_next_lr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n655 <= cnt_delay_next_rr;
  /* ../../vhdl/rtl/GAME/debounce/rtl/debounce_ea.vhd:37:9  */
  always @(posedge clock_i)
    n656 <= cnt_delay_next_dnr;
endmodule

module hdmi_tetris_ea
  (input  rst_i,
   input  clk51_i,
   output hsync_o,
   output vsync_o,
   output de_o,
   output vga_enable_o,
   output frame_finished_o,
   input  [4:0] data_b_i,
   output [5:0] data_o,
   output [10:0] x_cnt_o,
   output [10:0] y_cnt_o,
   input  [15:0] points_i);
  wire [10:0] x_cnt;
  wire [10:0] x_cnt_next;
  wire [10:0] y_cnt;
  wire [10:0] y_cnt_next;
  wire de;
  wire de_next_next;
  wire de_next;
  wire hsync;
  wire hsync_next_next;
  wire hsync_next;
  wire vsync;
  wire vsync_next_next;
  wire vsync_next;
  wire [4:0] data_b;
  wire [5:0] data_6;
  wire clk51;
  wire vga_enable;
  wire [3:0] ones;
  wire [3:0] tens;
  wire [3:0] hundreds;
  wire [3:0] thousands;
  wire [3:0] tenthousands;
  wire [3:0] next_ones;
  wire [3:0] next_tens;
  wire [3:0] next_hundreds;
  wire [3:0] next_thousands;
  wire [3:0] next_tenthousands;
  wire px0;
  wire px1;
  wire px2;
  wire px3;
  wire px4;
  localparam [10:0] n151 = 11'b01001000110;
  localparam [10:0] n152 = 11'b00001000110;
  localparam [10:0] n154 = 11'b01001101001;
  localparam [10:0] n156 = 11'b01010001100;
  localparam [10:0] n158 = 11'b01010101111;
  localparam [10:0] n160 = 11'b01011010010;
  wire n207;
  wire [10:0] n208;
  wire [10:0] n210;
  wire n213;
  wire n215;
  wire n216;
  wire [10:0] n217;
  wire [10:0] n219;
  wire n221;
  wire [10:0] n222;
  wire n238;
  wire n240;
  wire n241;
  wire n243;
  wire n245;
  wire n246;
  wire n247;
  wire n248;
  wire n252;
  wire n254;
  wire n255;
  wire n256;
  wire n260;
  wire n262;
  wire n263;
  wire n264;
  wire n268;
  wire n270;
  wire n271;
  wire n272;
  wire n276;
  wire n278;
  wire n279;
  wire n281;
  wire n283;
  wire n284;
  wire n285;
  wire n286;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire [4:0] n298;
  wire [4:0] n299;
  wire [4:0] n301;
  wire n305;
  wire [5:0] n306;
  wire n309;
  wire [5:0] n310;
  wire n313;
  wire [5:0] n314;
  wire n317;
  wire [5:0] n318;
  wire n321;
  wire [5:0] n322;
  wire n325;
  wire [5:0] n326;
  wire n329;
  wire [5:0] n330;
  wire n333;
  wire [5:0] n334;
  wire n337;
  wire [5:0] n338;
  wire n341;
  wire [5:0] n342;
  wire n345;
  wire [5:0] n346;
  wire n349;
  wire [5:0] n350;
  wire n353;
  wire [5:0] n354;
  wire n357;
  wire [5:0] n358;
  wire n361;
  wire [5:0] n362;
  wire n365;
  wire [5:0] n366;
  wire n369;
  wire [5:0] n370;
  wire n373;
  wire [5:0] n374;
  wire n377;
  wire [5:0] n378;
  wire n381;
  wire [5:0] n382;
  wire n385;
  wire [5:0] n386;
  wire n389;
  wire [5:0] n390;
  wire n393;
  wire [5:0] n394;
  wire n397;
  wire [5:0] n398;
  wire n401;
  wire [5:0] n402;
  wire n405;
  wire [5:0] n406;
  wire n409;
  wire [5:0] n410;
  wire n413;
  wire [5:0] n414;
  wire n417;
  wire [5:0] n418;
  reg [10:0] n425;
  reg [10:0] n426;
  reg n427;
  reg n428;
  reg n429;
  reg n430;
  reg n431;
  reg n432;
  reg [3:0] n433;
  reg [3:0] n434;
  reg [3:0] n435;
  reg [3:0] n436;
  reg [3:0] n437;
  assign hsync_o = hsync; //(module output)
  assign vsync_o = vsync; //(module output)
  assign de_o = de; //(module output)
  assign vga_enable_o = vga_enable; //(module output)
  assign frame_finished_o = n272; //(module output)
  assign data_o = data_6; //(module output)
  assign x_cnt_o = x_cnt; //(module output)
  assign y_cnt_o = y_cnt; //(module output)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:50:16  */
  assign x_cnt = n425; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:50:23  */
  assign x_cnt_next = n208; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:51:16  */
  assign y_cnt = n426; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:51:23  */
  assign y_cnt_next = n217; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:16  */
  assign de = n427; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:20  */
  assign de_next_next = n248; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:34  */
  assign de_next = n428; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:43  */
  assign hsync = n429; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:50  */
  assign hsync_next_next = n256; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:67  */
  assign hsync_next = n430; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:79  */
  assign vsync = n431; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:86  */
  assign vsync_next_next = n264; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:52:103  */
  assign vsync_next = n432; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:56:16  */
  assign data_b = n301; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:58:16  */
  assign data_6 = n306; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:60:16  */
  assign clk51 = clk51_i; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:61:16  */
  assign vga_enable = n286; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:63:16  */
  assign ones = n433; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:63:22  */
  assign tens = n434; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:63:28  */
  assign hundreds = n435; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:63:38  */
  assign thousands = n436; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:63:49  */
  assign tenthousands = n437; // (signal)
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:72:9  */
  bin2bcd bintobcb (
    .binary_i(points_i),
    .ones_o(next_ones),
    .tens_o(next_tens),
    .hundreds_o(next_hundreds),
    .thousands_o(next_thousands),
    .tenthousands_o(next_tenthousands));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:82:9  */
  digit_renderer digit0 (
    .clk(clk51),
    .rst(rst_i),
    .x(x_cnt),
    .y(y_cnt),
    .x_start(n151),
    .y_start(n152),
    .digit(tenthousands),
    .pixel_on(px0));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:94:9  */
  digit_renderer digit1 (
    .clk(clk51),
    .rst(rst_i),
    .x(x_cnt),
    .y(y_cnt),
    .x_start(n154),
    .y_start(n152),
    .digit(thousands),
    .pixel_on(px1));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:106:9  */
  digit_renderer digit2 (
    .clk(clk51),
    .rst(rst_i),
    .x(x_cnt),
    .y(y_cnt),
    .x_start(n156),
    .y_start(n152),
    .digit(hundreds),
    .pixel_on(px2));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:118:9  */
  digit_renderer digit3 (
    .clk(clk51),
    .rst(rst_i),
    .x(x_cnt),
    .y(y_cnt),
    .x_start(n158),
    .y_start(n152),
    .digit(tens),
    .pixel_on(px3));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:130:9  */
  digit_renderer digit4 (
    .clk(clk51),
    .rst(rst_i),
    .x(x_cnt),
    .y(y_cnt),
    .x_start(n160),
    .y_start(n152),
    .digit(ones),
    .pixel_on(px4));
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:181:50  */
  assign n207 = x_cnt == 11'b10000100000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:181:39  */
  assign n208 = n207 ? 11'b00000000000 : n210;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:182:23  */
  assign n210 = x_cnt + 11'b00000000001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:184:51  */
  assign n213 = x_cnt == 11'b10000100000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:184:113  */
  assign n215 = y_cnt == 11'b01001110100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:184:103  */
  assign n216 = n215 & n213;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:184:39  */
  assign n217 = n216 ? 11'b00000000000 : n222;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:185:23  */
  assign n219 = y_cnt + 11'b00000000001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:185:39  */
  assign n221 = x_cnt == 11'b10000100000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:184:167  */
  assign n222 = n221 ? n219 : y_cnt;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:41  */
  assign n238 = $unsigned(x_cnt) < $unsigned(11'b01101001000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:81  */
  assign n240 = $unsigned(x_cnt) > $unsigned(11'b00000101000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:71  */
  assign n241 = n240 & n238;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:109  */
  assign n243 = $unsigned(y_cnt) < $unsigned(11'b01001011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:150  */
  assign n245 = $unsigned(y_cnt) > $unsigned(11'b00000000001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:140  */
  assign n246 = n245 & n243;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:98  */
  assign n247 = n246 & n241;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:191:29  */
  assign n248 = n247 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:193:44  */
  assign n252 = $unsigned(x_cnt) >= $unsigned(11'b01101001000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:193:87  */
  assign n254 = $unsigned(x_cnt) < $unsigned(11'b01111001000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:193:76  */
  assign n255 = n254 & n252;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:193:32  */
  assign n256 = n255 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:195:44  */
  assign n260 = $unsigned(y_cnt) >= $unsigned(11'b01001011001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:195:88  */
  assign n262 = $unsigned(y_cnt) < $unsigned(11'b01001011101);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:195:77  */
  assign n263 = n262 & n260;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:195:32  */
  assign n264 = n263 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:200:45  */
  assign n268 = x_cnt == 11'b01101001000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:200:85  */
  assign n270 = y_cnt == 11'b01001011001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:200:75  */
  assign n271 = n270 & n268;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:200:33  */
  assign n272 = n271 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:203:40  */
  assign n276 = $unsigned(x_cnt) >= $unsigned(11'b00011111010);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:203:62  */
  assign n278 = $unsigned(x_cnt) < $unsigned(11'b01000010010);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:203:52  */
  assign n279 = n278 & n276;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:204:24  */
  assign n281 = $unsigned(y_cnt) >= $unsigned(11'b00000100001);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:204:46  */
  assign n283 = $unsigned(y_cnt) <= $unsigned(11'b01001010000);
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:204:36  */
  assign n284 = n283 & n281;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:203:89  */
  assign n285 = n284 & n279;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:203:27  */
  assign n286 = n285 ? 1'b1 : 1'b0;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:42  */
  assign n290 = ~vga_enable;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:63  */
  assign n291 = px0 | px1;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:76  */
  assign n292 = n291 | px2;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:89  */
  assign n293 = n292 | px3;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:102  */
  assign n294 = n293 | px4;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:48  */
  assign n295 = n294 & n290;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:219:25  */
  assign n298 = n295 ? 5'b00000 : 5'b00011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:217:25  */
  assign n299 = vga_enable ? data_b_i : n298;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:216:17  */
  assign n301 = de ? n299 : 5'b00000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:229:45  */
  assign n305 = data_b == 5'b00000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:229:33  */
  assign n306 = n305 ? 6'b000000 : n310;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:230:48  */
  assign n309 = data_b == 5'b00001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:229:59  */
  assign n310 = n309 ? 6'b001111 : n314;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:231:48  */
  assign n313 = data_b == 5'b00010;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:230:67  */
  assign n314 = n313 ? 6'b011111 : n318;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:232:52  */
  assign n317 = data_b == 5'b00011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:231:67  */
  assign n318 = n317 ? 6'b001011 : n322;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:233:47  */
  assign n321 = data_b == 5'b00100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:232:75  */
  assign n322 = n321 ? 6'b000110 : n326;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:234:50  */
  assign n325 = data_b == 5'b00101;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:233:65  */
  assign n326 = n325 ? 6'b111100 : n330;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:235:50  */
  assign n329 = data_b == 5'b00110;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:234:71  */
  assign n330 = n329 ? 6'b111101 : n334;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:236:54  */
  assign n333 = data_b == 5'b00111;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:235:71  */
  assign n334 = n333 ? 6'b101000 : n338;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:237:49  */
  assign n337 = data_b == 5'b01000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:236:79  */
  assign n338 = n337 ? 6'b100100 : n342;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:238:50  */
  assign n341 = data_b == 5'b01001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:237:69  */
  assign n342 = n341 ? 6'b100011 : n346;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:239:50  */
  assign n345 = data_b == 5'b01010;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:238:71  */
  assign n346 = n345 ? 6'b110111 : n350;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:240:54  */
  assign n349 = data_b == 5'b01011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:239:71  */
  assign n350 = n349 ? 6'b100010 : n354;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:241:49  */
  assign n353 = data_b == 5'b01100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:240:79  */
  assign n354 = n353 ? 6'b010010 : n358;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:242:49  */
  assign n357 = data_b == 5'b01101;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:241:69  */
  assign n358 = n357 ? 6'b001100 : n362;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:243:49  */
  assign n361 = data_b == 5'b01110;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:242:69  */
  assign n362 = n361 ? 6'b011101 : n366;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:244:53  */
  assign n365 = data_b == 5'b01111;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:243:69  */
  assign n366 = n365 ? 6'b001000 : n370;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:245:48  */
  assign n369 = data_b == 5'b10000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:244:77  */
  assign n370 = n369 ? 6'b000100 : n374;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:246:47  */
  assign n373 = data_b == 5'b10001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:245:67  */
  assign n374 = n373 ? 6'b110000 : n378;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:247:47  */
  assign n377 = data_b == 5'b10010;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:246:65  */
  assign n378 = n377 ? 6'b110101 : n382;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:248:51  */
  assign n381 = data_b == 5'b10011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:247:65  */
  assign n382 = n381 ? 6'b100000 : n386;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:249:46  */
  assign n385 = data_b == 5'b10100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:248:73  */
  assign n386 = n385 ? 6'b100001 : n390;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:250:48  */
  assign n389 = data_b == 5'b10101;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:249:63  */
  assign n390 = n389 ? 6'b000011 : n394;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:251:48  */
  assign n393 = data_b == 5'b10110;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:250:67  */
  assign n394 = n393 ? 6'b010111 : n398;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:252:52  */
  assign n397 = data_b == 5'b10111;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:251:67  */
  assign n398 = n397 ? 6'b000010 : n402;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:253:47  */
  assign n401 = data_b == 5'b11000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:252:75  */
  assign n402 = n401 ? 6'b000001 : n406;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:254:50  */
  assign n405 = data_b == 5'b11001;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:253:65  */
  assign n406 = n405 ? 6'b111000 : n410;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:255:50  */
  assign n409 = data_b == 5'b11010;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:254:71  */
  assign n410 = n409 ? 6'b111001 : n414;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:256:54  */
  assign n413 = data_b == 5'b11011;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:255:71  */
  assign n414 = n413 ? 6'b101000 : n418;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:257:49  */
  assign n417 = data_b == 5'b11100;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:256:79  */
  assign n418 = n417 ? 6'b100100 : 6'b000000;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n425 <= 11'b00000000000;
    else
      n425 <= x_cnt_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n426 <= 11'b00000000000;
    else
      n426 <= y_cnt_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n427 <= 1'b0;
    else
      n427 <= de_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n428 <= 1'b0;
    else
      n428 <= de_next_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n429 <= 1'b0;
    else
      n429 <= hsync_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n430 <= 1'b0;
    else
      n430 <= hsync_next_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n431 <= 1'b0;
    else
      n431 <= vsync_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n432 <= 1'b0;
    else
      n432 <= vsync_next_next;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n433 <= 4'b0000;
    else
      n433 <= next_ones;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n434 <= 4'b0000;
    else
      n434 <= next_tens;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n435 <= 4'b0000;
    else
      n435 <= next_hundreds;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n436 <= 4'b0000;
    else
      n436 <= next_thousands;
  /* ../../vhdl/rtl/Hdmi-Gesamt/HDMI_Gesamt/rtl/HDMI_Tetris_ea.vhd:161:17  */
  always @(posedge clk51 or posedge rst_i)
    if (rst_i)
      n437 <= 4'b0000;
    else
      n437 <= next_tenthousands;
endmodule

module game_toplevel_ea
  (input  clk_i,
   input  game_speed_i,
   input  lr_i,
   input  rr_i,
   input  dnr_i,
   input  okr_i,
   input  reset_i,
   input  vga_en_i,
   input  frame_finished_i,
   input  [10:0] x_cnt_i,
   input  [10:0] y_cnt_i,
   output [15:0] points_o,
   output [4:0] data_o);
  wire rst;
  wire iokr;
  wire ilr;
  wire irr;
  wire idnr;
  wire tick;
  wire [2:0] randtyp;
  wire ack_set;
  wire req_move;
  wire ack_check;
  wire ack_des;
  wire ack_del;
  wire req_set;
  wire ack_move;
  wire req_check;
  wire req_des;
  wire req_del;
  wire frozen;
  wire game_over;
  wire finish_strb;
  wire [14:0] lp_m;
  wire [14:0] lp_d;
  wire [14:0] lp_s;
  wire [13:0] lp_bus;
  wire [3:0] b1_x;
  wire [3:0] b2_x;
  wire [3:0] b3_x;
  wire [3:0] b4_x;
  wire [4:0] b1_y;
  wire [4:0] b2_y;
  wire [4:0] b3_y;
  wire [4:0] b4_y;
  wire [7:0] d_rd;
  wire [7:0] adr_set;
  wire [7:0] data_set;
  wire we_set;
  wire [7:0] adr_move;
  wire [7:0] data_move;
  wire we_move;
  wire [7:0] adr_check;
  wire [7:0] data_check;
  wire we_check;
  wire [7:0] adr_des;
  wire [7:0] data_des;
  wire we_des;
  wire [7:0] adr_del;
  wire [7:0] data_del;
  wire we_del;
  wire pg_we;
  wire [7:0] d_pg_rd;
  wire [7:0] pg_wr;
  wire [7:0] pg_adr;
  wire we;
  reg [7:0] adr;
  reg [7:0] adr_mux_next;
  reg [7:0] adr_mux;
  wire [7:0] d_wr;
  wire [7:0] d_wr_mux_next;
  wire [7:0] d_wr_mux;
  wire [15:0] points_del_i;
  wire [15:0] points_move_i;
  wire [15:0] points_del;
  wire [15:0] points_move;
  wire [15:0] points_next;
  wire [15:0] points;
  wire timer_reset;
  wire [4:0] \pixgen.data_pg_o ;
  wire [15:0] n107;
  wire [15:0] n108;
  wire n109;
  wire n110;
  wire n111;
  wire n112;
  wire [7:0] n113;
  wire [7:0] n114;
  wire [7:0] n115;
  wire [7:0] n116;
  wire [7:0] n117;
  wire [7:0] n118;
  wire [7:0] n119;
  wire [7:0] n120;
  wire [7:0] n121;
  wire [7:0] n122;
  wire n131;
  wire [7:0] n132;
  reg [7:0] n133;
  wire n134;
  wire [7:0] n135;
  reg [7:0] n136;
  reg [15:0] n137;
  assign points_o = points; //(module output)
  assign data_o = \pixgen.data_pg_o ; //(module output)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:64:12  */
  assign we = n112; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:65:12  */
  always @*
    adr = n113; // (isignal)
  initial
    adr = 8'b00000000;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:65:17  */
  always @*
    adr_mux_next = adr; // (isignal)
  initial
    adr_mux_next = 8'b00000000;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:65:31  */
  always @*
    adr_mux = n133; // (isignal)
  initial
    adr_mux = 8'b00000000;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:66:12  */
  assign d_wr = n118; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:66:18  */
  assign d_wr_mux_next = d_wr; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:66:33  */
  assign d_wr_mux = n136; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:68:12  */
  assign points_del = points_del_i; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:68:24  */
  assign points_move = points_move_i; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:68:37  */
  assign points_next = n108; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:68:50  */
  assign points = n137; // (signal)
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:72:5  */
  debounce_ea debounce (
    .rr_i(rr_i),
    .lr_i(lr_i),
    .dnr_i(dnr_i),
    .okr_i(okr_i),
    .reset_i(reset_i),
    .clock_i(clk_i),
    .rr_o(irr),
    .lr_o(ilr),
    .dnr_o(idnr),
    .okr_o(iokr),
    .reset_o(rst));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:87:5  */
  timer_ea timer (
    .rst_i(rst),
    .clock_i(clk_i),
    .game_speed_i(game_speed_i),
    .tick_reset_i(timer_reset),
    .tick_o(tick));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:96:5  */
  random_ea random (
    .clk_i(clk_i),
    .lr_i(lr_i),
    .rr_i(rr_i),
    .dn_i(dnr_i),
    .dr_i(okr_i),
    .reset_i(reset_i),
    .tick_i(tick),
    .randtyp_o(randtyp));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:108:5  */
  control_ea control (
    .reset_i(rst),
    .clk_i(clk_i),
    .tick_i(tick),
    .ack_set_i(ack_set),
    .req_move_i(req_move),
    .ack_check_i(ack_check),
    .ack_des_i(ack_des),
    .ack_del_i(ack_del),
    .frozen_i(frozen),
    .game_over_i(game_over),
    .finish_strb_i(finish_strb),
    .req_set_o(req_set),
    .ack_move_o(ack_move),
    .req_check_o(req_check),
    .req_des_o(req_des),
    .req_del_o(req_del));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:131:5  */
  lastpos_ea last_pos (
    .clk_i(clk_i),
    .reset_i(rst),
    .lp_m_i(lp_m),
    .lp_d_i(lp_d),
    .lp_s_i(lp_s),
    .lp_bus_o(lp_bus),
    .b1_x_o(b1_x),
    .b2_x_o(b2_x),
    .b3_x_o(b3_x),
    .b4_x_o(b4_x),
    .b1_y_o(b1_y),
    .b2_y_o(b2_y),
    .b3_y_o(b3_y),
    .b4_y_o(b4_y));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:150:5  */
  set_ea set_figure (
    .reset_i(rst),
    .req_set_i(req_set),
    .clk_i(clk_i),
    .typ_s_i(randtyp),
    .block1_x_i(b1_x),
    .block2_x_i(b2_x),
    .block3_x_i(b3_x),
    .block4_x_i(b4_x),
    .block1_y_i(b1_y),
    .block2_y_i(b2_y),
    .block3_y_i(b3_y),
    .block4_y_i(b4_y),
    .d_rd_i(d_rd),
    .ack_set_o(ack_set),
    .game_over_o(game_over),
    .lp_s_o(lp_s),
    .adr_set_o(adr_set),
    .data_set_o(data_set),
    .we_set_o(we_set));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:176:5  */
  move_ea move (
    .reset_i(rst),
    .clk_i(clk_i),
    .ack_move_i(ack_move),
    .lr_i(ilr),
    .rr_i(irr),
    .dnr_i(idnr),
    .drr_i(iokr),
    .lp_m_i(lp_bus),
    .block1_x_i(b1_x),
    .block2_x_i(b2_x),
    .block3_x_i(b3_x),
    .block4_x_i(b4_x),
    .block1_y_i(b1_y),
    .block2_y_i(b2_y),
    .block3_y_i(b3_y),
    .block4_y_i(b4_y),
    .d_rd_i(d_rd),
    .req_move_o(req_move),
    .lp_m_o(lp_m),
    .adr_move_o(adr_move),
    .data_move_o(data_move),
    .we_move_o(we_move),
    .points_move(points_move_i),
    .timer_reset_o(timer_reset));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:208:5  */
  check_ea check (
    .clk_i(clk_i),
    .reset_i(rst),
    .req_check_i(req_check),
    .block1_x_i(b1_x),
    .block2_x_i(b2_x),
    .block3_x_i(b3_x),
    .block4_x_i(b4_x),
    .block1_y_i(b1_y),
    .block2_y_i(b2_y),
    .block3_y_i(b3_y),
    .block4_y_i(b4_y),
    .d_rd_i(d_rd),
    .ack_check_o(ack_check),
    .frozen_o(frozen),
    .we_check_o(we_check),
    .data_check_o(data_check),
    .check_adr_o(adr_check));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:229:5  */
  descend_ea descend (
    .reset_i(rst),
    .clk_i(clk_i),
    .req_des_i(req_des),
    .lp_d_i(lp_bus),
    .block1_x_i(b1_x),
    .block2_x_i(b2_x),
    .block3_x_i(b3_x),
    .block4_x_i(b4_x),
    .block1_y_i(b1_y),
    .block2_y_i(b2_y),
    .block3_y_i(b3_y),
    .block4_y_i(b4_y),
    .d_rd_i(d_rd),
    .ack_des_o(ack_des),
    .lp_d_o(lp_d),
    .adr_des_o(adr_des),
    .data_des_o(data_des),
    .we_des_o(we_des));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:254:5  */
  delete_ea delete (
    .reset_i(rst),
    .clk_i(clk_i),
    .req_del_i(req_del),
    .block1_y_i(b1_y),
    .block2_y_i(b2_y),
    .block3_y_i(b3_y),
    .block4_y_i(b4_y),
    .d_rd_i(d_rd),
    .ack_del_o(ack_del),
    .adr_del_o(adr_del),
    .data_del_o(data_del),
    .we_del_o(we_del),
    .points_del(points_del_i));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:274:5  */
  pixgen_ea pixgen (
    .clk_i(clk_i),
    .rst_i(rst),
    .vga_en_i(vga_en_i),
    .frame_finished_i(frame_finished_i),
    .pg_rd_i(d_pg_rd),
    .x_counter_i(x_cnt_i),
    .y_counter_i(y_cnt_i),
    .pg_we_o(pg_we),
    .adr_cnt_finished_o(finish_strb),
    .pg_wr_o(pg_wr),
    .pg_adr_o(pg_adr),
    .data_pg_o(\pixgen.data_pg_o ));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:290:5  */
  tdp_ram_ea_8_8 dpram (
    .a_clock_i(clk_i),
    .a_write_i(we),
    .a_addr_i(adr),
    .a_data_i(d_wr),
    .b_clock_i(clk_i),
    .b_write_i(pg_we),
    .b_addr_i(pg_adr),
    .b_data_i(pg_wr),
    .a_data_o(d_rd),
    .b_data_o(d_pg_rd));
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:325:31  */
  assign n107 = points_del + points_move;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:325:45  */
  assign n108 = n107 + points;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:330:18  */
  assign n109 = we_set | we_move;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:330:29  */
  assign n110 = n109 | we_check;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:330:41  */
  assign n111 = n110 | we_des;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:330:51  */
  assign n112 = n111 | we_del;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:331:20  */
  assign n113 = req_set ? adr_set : n114;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:331:39  */
  assign n114 = ack_move ? adr_move : n115;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:332:41  */
  assign n115 = req_check ? adr_check : n116;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:333:43  */
  assign n116 = req_des ? adr_des : n117;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:334:39  */
  assign n117 = req_del ? adr_del : adr_mux;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:338:22  */
  assign n118 = we_set ? data_set : n119;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:338:40  */
  assign n119 = we_move ? data_move : n120;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:339:42  */
  assign n120 = we_check ? data_check : n121;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:340:44  */
  assign n121 = we_des ? data_des : n122;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:341:40  */
  assign n122 = we_del ? data_del : d_wr_mux;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:65:31  */
  assign n131 = ~rst;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:312:9  */
  assign n132 = n131 ? adr_mux_next : adr_mux;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:312:9  */
  always @(posedge clk_i)
    n133 <= n132;
  initial
    n133 = 8'b00000000;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:66:33  */
  assign n134 = ~rst;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:312:9  */
  assign n135 = n134 ? d_wr_mux_next : d_wr_mux;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:312:9  */
  always @(posedge clk_i)
    n136 <= n135;
  /* ../../vhdl/rtl/GAME/game_toplevel/rtl/game_toplevel_ea.vhd:312:9  */
  always @(posedge clk_i or posedge rst)
    if (rst)
      n137 <= 16'b0000000000000000;
    else
      n137 <= points_next;
endmodule

module tetris
  (input  CLK_i,
   input  reset_i,
   input  up_r_i,
   input  down_r_i,
   input  left_r_i,
   input  right_r_i,
   input  game_speed_i,
   output [5:0] Data_o,
   output hsync_o,
   output vsync_o,
   output video_active_o,
   output pix_clk_o);
  wire clk_pix;
  wire vsync;
  wire hsync;
  wire [4:0] data_a;
  wire vga_enable;
  wire frame_finished;
  wire de;
  reg [1:0] rst_reg;
  reg [1:0] next_rst_reg;
  wire rst;
  wire [10:0] x_cnt;
  wire [10:0] y_cnt;
  wire [15:0] points;
  wire n8;
  wire n14;
  wire n16;
  wire [1:0] n18;
  wire [5:0] \hdmi.data_o ;
  reg [1:0] n35;
  assign Data_o = \hdmi.data_o ; //(module output)
  assign hsync_o = hsync; //(module output)
  assign vsync_o = vsync; //(module output)
  assign video_active_o = de; //(module output)
  assign pix_clk_o = clk_pix; //(module output)
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:26:12  */
  assign clk_pix = CLK_i; // (signal)
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:37:12  */
  always @*
    rst_reg = n35; // (isignal)
  initial
    rst_reg = 2'b00;
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:37:21  */
  always @*
    next_rst_reg = n18; // (isignal)
  initial
    next_rst_reg = 2'b00;
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:38:12  */
  assign rst = n14; // (signal)
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:47:20  */
  assign n8 = ~reset_i;
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:54:19  */
  assign n14 = rst_reg[1]; // extract
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:58:32  */
  assign n16 = rst_reg[0]; // extract
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:58:36  */
  assign n18 = {n16, 1'b1};
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:63:5  */
  game_toplevel_ea game_toplevel (
    .clk_i(clk_pix),
    .game_speed_i(game_speed_i),
    .lr_i(left_r_i),
    .rr_i(right_r_i),
    .dnr_i(down_r_i),
    .okr_i(up_r_i),
    .reset_i(rst),
    .vga_en_i(vga_enable),
    .frame_finished_i(frame_finished),
    .x_cnt_i(x_cnt),
    .y_cnt_i(y_cnt),
    .points_o(points),
    .data_o(data_a));
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:80:5  */
  hdmi_tetris_ea hdmi (
    .rst_i(rst),
    .clk51_i(clk_pix),
    .data_b_i(data_a),
    .points_i(points),
    .hsync_o(hsync),
    .vsync_o(vsync),
    .de_o(de),
    .vga_enable_o(vga_enable),
    .frame_finished_o(frame_finished),
    .data_o(\hdmi.data_o ),
    .x_cnt_o(x_cnt),
    .y_cnt_o(y_cnt));
  /* ../../vhdl/rtl/toplevel/rtl/tetris_TOP_ea.vhd:49:9  */
  always @(posedge clk_pix or posedge n8)
    if (n8)
      n35 <= 2'b00;
    else
      n35 <= next_rst_reg;
endmodule

