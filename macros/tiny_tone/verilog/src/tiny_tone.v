// ============================================================
// tiny_tone.v
// wafer.space GF180 Tapeout, TinyTone
// Description: 
//      Generates a PWM audio output from a sequence of 
//      64 notes. 
//      Plays the 'Super Mario Bros.' theme song on a piezo 
//      buzzer.
// Author: Jakob Schaumberger
// Last edited: 09.11.2025
// ============================================================

`include "StrobeGenerator.v"
`include "NotesRom.v"
`include "SequenceCounter.v"
`include "PwmModulator.v"

`default_nettype none
`ifndef __TT_UM_TINYTONE__
`define __TT_UM_TINYTONE__

module tiny_tone
# (
    parameter [23:0] NOTE_DURATION = 24'd2400000   // Strobe period ~0.25s
)
(
    // inputs
    input wire clk,    // input clock          
    input wire rst_n,  // input reset_n (active low)
	
    // outputs
	output wire sound_out,
);

wire rst = ~rst_n;

wire sound_o;
wire strb;
wire [15:0] dividerValue;
wire [5:0]  noteIndex;

// assign outputs
assign sound_out = sound_o;

// ------------------------------------------------------------
// Strobe generator
// ------------------------------------------------------------
StrbGenerator #(
    .BW(24)
) u_strbGen (
    .clk_i(clk),
    .rst_i(rst),
    .counter_maxVal(NOTE_DURATION),
    .strb_o(strb)
);

// ------------------------------------------------------------
// Notes ROM
// ------------------------------------------------------------
NotesRom #(
    .BW(16)
) u_notesRom (
    .noteIndex_i(noteIndex),
    .dividerValue_o(dividerValue)
);

// ------------------------------------------------------------
// Sequence counter
// ------------------------------------------------------------
SequenceCounter #(
    .BW(6),
    .SEQ_LEN(64)
) u_sequenceCounter (
    .clk_i(clk),
    .rst_i(rst),
    .strb_i(strb),
    .noteIndex_o(noteIndex)
);

// ------------------------------------------------------------
// PWM modulator
// ------------------------------------------------------------
PwmModulator #(
    .BW(16)
) u_pwmModulator (
    .clk_i(clk),
    .rst_i(rst),
    .period_i(dividerValue),
    .dutyCycle_i(dividerValue >> 1),

    .pwm_o(sound_o)
);

endmodule   // SoundGenerator

`endif
`default_nettype wire