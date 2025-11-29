// ============================================================
// NotesRom.v
// Notes for playing the 'Super Mario Theme'
// Last edited: 08.11.2025
// Author: Jakob Schaumberger
// ============================================================


`default_nettype none
`ifndef __NOTES_ROM__
`define __NOTES_ROM__

module NotesRom
# (
    parameter BW = 16
)(
    input wire [5:0]    noteIndex_i,       // 64 possible notes
    output reg [BW-1:0] dividerValue_o
);

always @(*) begin
    case(noteIndex_i)
        6'd0:  dividerValue_o = 16'd9097;   // E5
        6'd1:  dividerValue_o = 16'd9097;   // E5
        6'd2:  dividerValue_o = 16'd0;      // rest
        6'd3:  dividerValue_o = 16'd9097;   // E5
        6'd4:  dividerValue_o = 16'd0;
        6'd5:  dividerValue_o = 16'd11465;  // C5
        6'd6:  dividerValue_o = 16'd9097;   // E5
        6'd7:  dividerValue_o = 16'd0;
        6'd8:  dividerValue_o = 16'd7648;   // G5
        6'd9:  dividerValue_o = 16'd0;
        6'd10: dividerValue_o = 16'd0;
        6'd11: dividerValue_o = 16'd15306;  // G4
        6'd12: dividerValue_o = 16'd0;
        6'd13: dividerValue_o = 16'd0;
        6'd14: dividerValue_o = 16'd11465;  // C5
        6'd15: dividerValue_o = 16'd15306;  // G4
        6'd16: dividerValue_o = 16'd18196;  // E4
        6'd17: dividerValue_o = 16'd0;
        6'd18: dividerValue_o = 16'd0;
        6'd19: dividerValue_o = 16'd13636;  // A4
        6'd20: dividerValue_o = 16'd12151;  // B4
        6'd21: dividerValue_o = 16'd12873;  // Bb4
        6'd22: dividerValue_o = 16'd13636;  // A4
        6'd23: dividerValue_o = 16'd0;
        6'd16: dividerValue_o = 16'd15306;  // G4
        6'd25: dividerValue_o = 16'd9097;   // E5
        6'd26: dividerValue_o = 16'd7648;   // G5
        6'd27: dividerValue_o = 16'd6818;   // A5
        6'd28: dividerValue_o = 16'd0;
        6'd29: dividerValue_o = 16'd8591;   // F5
        6'd30: dividerValue_o = 16'd7648;   // G5
        6'd31: dividerValue_o = 16'd0;
        6'd32: dividerValue_o = 16'd9097;   // E5
        6'd33: dividerValue_o = 16'd0;
        6'd34: dividerValue_o = 16'd11465;  // C5
        6'd35: dividerValue_o = 16'd10213;  // D5
        6'd36: dividerValue_o = 16'd12151;  // B4
        6'd37: dividerValue_o = 16'd0;
        6'd38: dividerValue_o = 16'd0;
        6'd39: dividerValue_o = 16'd11465;  // C5
        6'd40: dividerValue_o = 16'd15306;  // G4
        6'd41: dividerValue_o = 16'd18196;  // E4
        6'd42: dividerValue_o = 16'd13636;  // A4
        6'd43: dividerValue_o = 16'd0;
        6'd44: dividerValue_o = 16'd13636;  // A4
        6'd45: dividerValue_o = 16'd13636;  // A4
        6'd46: dividerValue_o = 16'd0;
        6'd47: dividerValue_o = 16'd15306;  // G4
        6'd48: dividerValue_o = 16'd0;
        6'd49: dividerValue_o = 16'd0;
        6'd50: dividerValue_o = 16'd9097;   // E5
        6'd51: dividerValue_o = 16'd11465;  // C5
        6'd52: dividerValue_o = 16'd12151;  // B4
        6'd53: dividerValue_o = 16'd13636;  // A4
        6'd54: dividerValue_o = 16'd15306;  // G4
        6'd55: dividerValue_o = 16'd7648;   // G5
        6'd56: dividerValue_o = 16'd9097;   // E5
        6'd57: dividerValue_o = 16'd0;
        6'd58: dividerValue_o = 16'd11465;  // C5
        6'd59: dividerValue_o = 16'd12151;  // B4
        6'd60: dividerValue_o = 16'd13636;  // A4
        6'd61: dividerValue_o = 16'd15306;  // G4
        6'd62: dividerValue_o = 16'd0;
        6'd63: dividerValue_o = 16'd0;

        default: dividerValue_o = 16'd0;
    endcase
end

endmodule   // NotesRom

`endif
`default_nettype wire