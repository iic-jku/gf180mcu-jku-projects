// SPDX-FileCopyrightText: © 2025 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module chip_core #(
    parameter NUM_INPUT_PADS,
    parameter NUM_BIDIR_PADS,
    parameter NUM_ANALOG_PADS
) (
`ifdef USE_POWER_PINS
    inout wire VDD,
    inout wire VSS,
`endif

    input wire clk,   // clock
    input wire rst_n, // reset (active low)

    input  wire [NUM_INPUT_PADS-1:0] input_in,  // Input value
    output wire [NUM_INPUT_PADS-1:0] input_pu,  // Pull-up
    output wire [NUM_INPUT_PADS-1:0] input_pd,  // Pull-down

    input  wire [NUM_BIDIR_PADS-1:0] bidir_in,   // Input value
    output wire [NUM_BIDIR_PADS-1:0] bidir_out,  // Output value
    output wire [NUM_BIDIR_PADS-1:0] bidir_oe,   // Output enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_cs,   // Input type (0=CMOS Buffer, 1=Schmitt Trigger)
    output wire [NUM_BIDIR_PADS-1:0] bidir_sl,   // Slew rate (0=fast, 1=slow)
    output wire [NUM_BIDIR_PADS-1:0] bidir_ie,   // Input enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_pu,   // Pull-up
    output wire [NUM_BIDIR_PADS-1:0] bidir_pd    // Pull-down
);

  // See here for usage: https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/IO/gf180mcu_fd_io/digital.html

  // Disable pull-up and pull-down for input
  assign input_pu = '0;
  assign input_pd = '0;

  // Set the bidir as output
  assign bidir_oe[17:10] = -1;
  assign bidir_oe[8:0] = -1;
  assign bidir_cs = '0;
  assign bidir_sl = '0;
  assign bidir_ie = ~bidir_oe;
  assign bidir_pu = '0;
  assign bidir_pd = '0;

  logic _unused;
  assign _unused = &bidir_in;

  cpu cpu (
      .clk(clk),
      .reset(rst_n),
      .intr_ext(input_in[0]),
      .so(input_in[1]),
      .gpio_in(input_in[5:2]),

      .si(bidir_out[0]),
      .sclk(bidir_out[1]),
      .sram_ce(bidir_out[2]),
      .tx(bidir_out[3]),
      .rx(input_in[7]),
      .gpio_out(bidir_out[7:4]),

      .scl(bidir_out[8]),
      .sda_i(input_in[6]),
      .sda_o(bidir_out[9]),
      .sda_oe(bidir_oe[9]),

      .cos_ds(bidir_out[10]),
      .cos_ds_n(bidir_out[11]),
      .sin_ds(bidir_out[12]),
      .sin_ds_n(bidir_out[13]),
      .lo_i(bidir_out[14]),
      .lo_q(bidir_out[15]),
      .lo_ix(bidir_out[16]),
      .lo_qx(bidir_out[17])
  );

endmodule

`default_nettype wire
