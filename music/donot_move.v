`define he_flat 32'd622
`define hd_flat 32'd554
`define b_flat 32'd466
`define sil 32'd50000000 // slience
`define la 32'd110
`define lg_flat 32'd92
`define la_flat 32'd104

module donot_move (
    input [11:0] ibeatNum,
	output reg [31:0] toneL, 
    output reg [31:0] toneR
);

always @(*) begin
    case(ibeatNum)
        12'd0: toneR = `b_flat;   12'd1: toneR = `b_flat;
        12'd2: toneR = `b_flat;   12'd3: toneR = `b_flat;
        12'd4: toneR = `sil;   12'd5: toneR = `sil;
        12'd6: toneR = `sil;   12'd7: toneR = `sil;
        12'd8: toneR = `he_flat;   12'd9: toneR = `he_flat;
        12'd10: toneR = `he_flat;   12'd11: toneR = `he_flat;
        12'd12: toneR = `sil;   12'd13: toneR = `sil;
        12'd14: toneR = `sil;   12'd15: toneR = `sil;


        12'd16: toneR = `he_flat;   12'd17: toneR = `he_flat;
        12'd18: toneR = `he_flat;   12'd19: toneR = `he_flat;
        12'd20: toneR = `he_flat;   12'd21: toneR = `he_flat;
        12'd22: toneR = `he_flat;   12'd23: toneR = `he_flat;
        12'd24: toneR = `he_flat;   12'd25: toneR = `he_flat;
        12'd26: toneR = `he_flat;   12'd27: toneR = `he_flat;
        12'd28: toneR = `he_flat;   12'd29: toneR = `he_flat;
        12'd30: toneR = `he_flat;   12'd31: toneR = `sil;

        12'd32: toneR = `he_flat;   12'd33: toneR = `he_flat;
        12'd34: toneR = `he_flat;   12'd35: toneR = `he_flat;
        12'd36: toneR = `he_flat;   12'd37: toneR = `he_flat;
        12'd38: toneR = `he_flat;   12'd39: toneR = `he_flat;
        12'd40: toneR = `he_flat;   12'd41: toneR = `he_flat;
        12'd42: toneR = `he_flat;   12'd43: toneR = `he_flat;
        12'd44: toneR = `he_flat;   12'd45: toneR = `he_flat;
        12'd46: toneR = `he_flat;   12'd47: toneR = `he_flat;

        12'd48: toneR = `hd_flat;   12'd49: toneR = `hd_flat;
        12'd50: toneR = `hd_flat;   12'd51: toneR = `hd_flat;
        12'd52: toneR = `hd_flat;   12'd53: toneR = `hd_flat;
        12'd54: toneR = `hd_flat;   12'd55: toneR = `hd_flat;
        12'd56: toneR = `hd_flat;   12'd57: toneR = `hd_flat;
        12'd58: toneR = `hd_flat;   12'd59: toneR = `hd_flat;
        12'd60: toneR = `hd_flat;   12'd61: toneR = `hd_flat;
        12'd62: toneR = `hd_flat;   12'd63: toneR = `hd_flat;


        12'd64: toneR = `he_flat;   12'd65: toneR = `he_flat;
        12'd66: toneR = `he_flat;   12'd67: toneR = `he_flat;
        12'd68: toneR = `sil;   12'd69: toneR = `sil;
        12'd70: toneR = `sil;   12'd71: toneR = `sil;
        12'd72: toneR = `he_flat;   12'd73: toneR = `he_flat;
        12'd74: toneR = `he_flat;   12'd75: toneR = `he_flat;
        12'd76: toneR = `sil;   12'd77: toneR = `sil;
        12'd78: toneR = `sil;   12'd79: toneR = `sil;
        12'd80: toneR = `b_flat;   12'd81: toneR = `b_flat;
        12'd82: toneR = `b_flat;   12'd83: toneR = `b_flat;
        12'd84: toneR = `sil;   12'd85: toneR = `sil;
        12'd86: toneR = `sil;   12'd87: toneR = `sil;
        12'd88: toneR = `b_flat;   12'd89: toneR = `b_flat;
        12'd90: toneR = `b_flat;   12'd91: toneR = `b_flat;
        12'd92: toneR = `sil;   12'd93: toneR = `sil;
        12'd94: toneR = `sil;   12'd95: toneR = `sil;

        12'd96: toneR = `hd_flat;   12'd97: toneR = `hd_flat;
        12'd98: toneR = `hd_flat;   12'd99: toneR = `hd_flat;
        12'd100: toneR = `hd_flat;   12'd101: toneR = `hd_flat;
        12'd102: toneR = `hd_flat;   12'd103: toneR = `hd_flat;
        12'd104: toneR = `sil;   12'd105: toneR = `sil;
        12'd106: toneR = `sil;   12'd107: toneR = `sil;
        12'd108: toneR = `sil;   12'd109: toneR = `sil;
        12'd110: toneR = `sil;   12'd111: toneR = `sil;

    endcase
end

always @(*) begin
    case(ibeatNum)
        12'd0: toneL = `b_flat;   12'd1: toneL = `b_flat;
        12'd2: toneL = `b_flat;   12'd3: toneL = `b_flat;
        12'd4: toneL = `sil;   12'd5: toneL = `sil;
        12'd6: toneL = `sil;   12'd7: toneL = `sil;
        12'd8: toneL = `he_flat;   12'd9: toneL = `he_flat;
        12'd10: toneL = `he_flat;   12'd11: toneL = `he_flat;
        12'd12: toneL = `sil;   12'd13: toneL = `sil;
        12'd14: toneL = `sil;   12'd15: toneL = `sil;


        12'd16: toneL = `he_flat;   12'd17: toneL = `he_flat;
        12'd18: toneL = `he_flat;   12'd19: toneL = `he_flat;
        12'd20: toneL = `he_flat;   12'd21: toneL = `he_flat;
        12'd22: toneL = `he_flat;   12'd23: toneL = `he_flat;
        12'd24: toneL = `he_flat;   12'd25: toneL = `he_flat;
        12'd26: toneL = `he_flat;   12'd27: toneL = `he_flat;
        12'd28: toneL = `he_flat;   12'd29: toneL = `he_flat;
        12'd30: toneL = `he_flat;   12'd31: toneL = `sil;

        12'd32: toneL = `he_flat;   12'd33: toneL = `he_flat;
        12'd34: toneL = `he_flat;   12'd35: toneL = `he_flat;
        12'd36: toneL = `he_flat;   12'd37: toneL = `he_flat;
        12'd38: toneL = `he_flat;   12'd39: toneL = `he_flat;
        12'd40: toneL = `he_flat;   12'd41: toneL = `he_flat;
        12'd42: toneL = `he_flat;   12'd43: toneL = `he_flat;
        12'd44: toneL = `he_flat;   12'd45: toneL = `he_flat;
        12'd46: toneL = `he_flat;   12'd47: toneL = `he_flat;

        12'd48: toneL = `hd_flat;   12'd49: toneL = `hd_flat;
        12'd50: toneL = `hd_flat;   12'd51: toneL = `hd_flat;
        12'd52: toneL = `hd_flat;   12'd53: toneL = `hd_flat;
        12'd54: toneL = `hd_flat;   12'd55: toneL = `hd_flat;
        12'd56: toneL = `hd_flat;   12'd57: toneL = `hd_flat;
        12'd58: toneL = `hd_flat;   12'd59: toneL = `hd_flat;
        12'd60: toneL = `hd_flat;   12'd61: toneL = `hd_flat;
        12'd62: toneL = `hd_flat;   12'd63: toneL = `hd_flat;


        12'd64: toneL = `he_flat;   12'd65: toneL = `he_flat;
        12'd66: toneL = `he_flat;   12'd67: toneL = `he_flat;
        12'd68: toneL = `sil;   12'd69: toneL = `sil;
        12'd70: toneL = `sil;   12'd71: toneL = `sil;
        12'd72: toneL = `he_flat;   12'd73: toneL = `he_flat;
        12'd74: toneL = `he_flat;   12'd75: toneL = `he_flat;
        12'd76: toneL = `sil;   12'd77: toneL = `sil;
        12'd78: toneL = `sil;   12'd79: toneL = `sil;
        12'd80: toneL = `b_flat;   12'd81: toneL = `b_flat;
        12'd82: toneL = `b_flat;   12'd83: toneL = `b_flat;
        12'd84: toneL = `sil;   12'd85: toneL = `sil;
        12'd86: toneL = `sil;   12'd87: toneL = `sil;
        12'd88: toneL = `b_flat;   12'd89: toneL = `b_flat;
        12'd90: toneL = `b_flat;   12'd91: toneL = `b_flat;
        12'd92: toneL = `sil;   12'd93: toneL = `sil;
        12'd94: toneL = `sil;   12'd95: toneL = `sil;

        12'd96: toneL = `hd_flat;   12'd97: toneL = `hd_flat;
        12'd98: toneL = `hd_flat;   12'd99: toneL = `hd_flat;
        12'd100: toneL = `hd_flat;   12'd101: toneL = `hd_flat;
        12'd102: toneL = `hd_flat;   12'd103: toneL = `hd_flat;
        12'd104: toneL = `sil;   12'd105: toneL = `sil;
        12'd106: toneL = `sil;   12'd107: toneL = `sil;
        12'd108: toneL = `sil;   12'd109: toneL = `sil;
        12'd110: toneL = `sil;   12'd111: toneL = `sil;

    endcase
end
    
endmodule