`define he 32'd660
`define hg 32'd784
`define ha 32'd880
`define hb 32'd988
`define hhd_sharp 32'd1244
`define sil 32'd50000000 // slience
`define le 32'd165
`define lg 32'd196
`define la 32'd220
`define lb 32'd247
`define d_sharp 32'd311

module wayback (
    input [11:0] ibeatNum,
	output reg [31:0] toneL, 
    output reg [31:0] toneR
);
    always @(*) begin
        case(ibeatNum)
        //
                    12'd0: toneR = `hb;
                    12'd1: toneR = `hb;
                    12'd2: toneR = `hb;
                    12'd3: toneR = `hb;
                    12'd4: toneR = `hb;
                    12'd5: toneR = `hb;
                    12'd6: toneR = `hb;
                    12'd7: toneR = `sil;
                    //
                    12'd8: toneR = `hb;
                    12'd9: toneR = `hb;
                    12'd10: toneR = `hb;
                    12'd11: toneR = `hb;
                    12'd12: toneR = `hb;
                    12'd13: toneR = `hb;
                    12'd14: toneR = `hb;
                    12'd15: toneR = `sil;
                    //
                    12'd16: toneR = `hb;
                    12'd17: toneR = `hb;
                    12'd18: toneR = `hb;
                    12'd19: toneR = `hb;
                    12'd20: toneR = `hb;
                    12'd21: toneR = `hb;
                    12'd22: toneR = `hb;
                    12'd23: toneR = `hb;
                    12'd24: toneR = `hb;
                    12'd25: toneR = `hb;
                    12'd26: toneR = `hb;
                    12'd27: toneR = `hb;
                    12'd28: toneR = `hb;
                    12'd29: toneR = `hb;
                    12'd30: toneR = `hb;
                    12'd31: toneR = `sil;

                    //
                    12'd32: toneR = `hb;
                    12'd33: toneR = `hb;
                    12'd34: toneR = `hb;
                    12'd35: toneR = `hb;
                    12'd36: toneR = `hb;
                    12'd37: toneR = `hb;
                    12'd38: toneR = `hb;
                    12'd39: toneR = `sil;
                    //
                    12'd40: toneR = `hb;
                    12'd41: toneR = `hb;
                    12'd42: toneR = `hb;
                    12'd43: toneR = `hb;
                    12'd44: toneR = `hb;
                    12'd45: toneR = `hb;
                    12'd46: toneR = `hb;
                    12'd47: toneR = `sil;
                    //
                    12'd48: toneR = `hb;
                    12'd49: toneR = `hb;
                    12'd50: toneR = `hb;
                    12'd51: toneR = `hb;
                    12'd52: toneR = `hb;
                    12'd53: toneR = `hb;
                    12'd54: toneR = `hb;
                    12'd55: toneR = `hb;
                    12'd56: toneR = `hb;
                    12'd57: toneR = `hb;
                    12'd58: toneR = `hb;
                    12'd59: toneR = `hb;
                    12'd60: toneR = `hb;
                    12'd61: toneR = `hb;
                    12'd62: toneR = `hb;
                    12'd63: toneR = `sil;
                    // d#
                    12'd64: toneR = `hhd_sharp;
                    12'd65: toneR = `hhd_sharp;
                    12'd66: toneR = `hhd_sharp;
                    12'd67: toneR = `hhd_sharp;
                    12'd68: toneR = `hhd_sharp;
                    12'd69: toneR = `hhd_sharp;
                    12'd70: toneR = `hhd_sharp;
                    12'd71: toneR = `hhd_sharp;
                    // hb
                    12'd72: toneR = `hb;
                    12'd73: toneR = `hb;
                    12'd74: toneR = `hb;
                    12'd75: toneR = `hb;
                    12'd76: toneR = `hb;
                    12'd77: toneR = `hb;
                    12'd78: toneR = `hb;
                    12'd79: toneR = `sil;
                    //
                    12'd80: toneR = `hb;
                    12'd81: toneR = `hb;
                    12'd82: toneR = `hb;
                    12'd83: toneR = `hb;
                    12'd84: toneR = `hb;
                    12'd85: toneR = `hb;
                    12'd86: toneR = `hb;
                    12'd87: toneR = `hb;
                    //
                    12'd88: toneR = `ha;
                    12'd89: toneR = `ha;
                    12'd90: toneR = `ha;
                    12'd91: toneR = `ha;
                    12'd92: toneR = `ha;
                    12'd93: toneR = `ha;
                    12'd94: toneR = `ha;
                    12'd95: toneR = `ha;
                    //
                    12'd96: toneR = `hg;
                    12'd97: toneR = `hg;
                    12'd98: toneR = `hg;
                    12'd99: toneR = `hg;
                    12'd100: toneR = `hg;
                    12'd101: toneR = `hg;
                    12'd102: toneR = `hg;
                    12'd103: toneR = `hg;
                    //
                    12'd104: toneR = `ha;
                    12'd105: toneR = `ha;
                    12'd106: toneR = `ha;
                    12'd107: toneR = `ha;
                    12'd108: toneR = `ha;
                    12'd109: toneR = `ha;
                    12'd110: toneR = `ha;
                    12'd111: toneR = `ha;
                    //
                    12'd112: toneR = `hb;
                    12'd113: toneR = `hb;
                    12'd114: toneR = `hb;
                    12'd115: toneR = `hb;
                    12'd116: toneR = `hb;
                    12'd117: toneR = `hb;
                    12'd118: toneR = `hb;
                    12'd119: toneR = `hb;
                    12'd120: toneR = `hb;
                    12'd121: toneR = `hb;
                    12'd122: toneR = `hb;
                    12'd123: toneR = `hb;
                    12'd124: toneR = `hb;
                    12'd125: toneR = `hb;
                    12'd126: toneR = `hb;
                    12'd127: toneR = `sil;


                    //
                    12'd128: toneR = `hb;
                    12'd129: toneR = `hb;
                    12'd130: toneR = `hb;
                    12'd131: toneR = `hb;
                    12'd132: toneR = `hb;
                    12'd133: toneR = `hb;
                    12'd134: toneR = `hb;
                    12'd135: toneR = `sil;
                    //
                    12'd136: toneR = `hb;
                    12'd137: toneR = `hb;
                    12'd138: toneR = `hb;
                    12'd139: toneR = `hb;
                    12'd140: toneR = `hb;
                    12'd141: toneR = `hb;
                    12'd142: toneR = `hb;
                    12'd143: toneR = `sil;
                    //
                    12'd144: toneR = `hb;
                    12'd145: toneR = `hb;
                    12'd146: toneR = `hb;
                    12'd147: toneR = `hb;
                    12'd148: toneR = `hb;
                    12'd149: toneR = `hb;
                    12'd150: toneR = `hb;
                    12'd151: toneR = `hb;
                    12'd152: toneR = `hb;
                    12'd153: toneR = `hb;
                    12'd154: toneR = `hb;
                    12'd155: toneR = `hb;
                    12'd156: toneR = `hb;
                    12'd157: toneR = `hb;
                    12'd158: toneR = `hb;
                    12'd159: toneR = `sil;


                    //
                    12'd160: toneR = `hb;
                    12'd161: toneR = `hb;
                    12'd162: toneR = `hb;
                    12'd163: toneR = `hb;
                    12'd164: toneR = `hb;
                    12'd165: toneR = `hb;
                    12'd166: toneR = `hb;
                    12'd167: toneR = `sil;
                    //
                    12'd168: toneR = `hb;
                    12'd169: toneR = `hb;
                    12'd170: toneR = `hb;
                    12'd171: toneR = `hb;
                    12'd172: toneR = `hb;
                    12'd173: toneR = `hb;
                    12'd174: toneR = `hb;
                    12'd175: toneR = `sil;
                    //
                    12'd176: toneR = `hb;
                    12'd177: toneR = `hb;
                    12'd178: toneR = `hb;
                    12'd179: toneR = `hb;
                    12'd180: toneR = `hb;
                    12'd181: toneR = `hb;
                    12'd182: toneR = `hb;
                    12'd183: toneR = `hb;
                    12'd184: toneR = `hb;
                    12'd185: toneR = `hb;
                    12'd186: toneR = `hb;
                    12'd187: toneR = `hb;
                    12'd188: toneR = `hb;
                    12'd189: toneR = `hb;
                    12'd190: toneR = `hb;
                    12'd191: toneR = `sil;


                    //
                    12'd192: toneR = `hb;
                    12'd193: toneR = `hb;
                    12'd194: toneR = `hb;
                    12'd195: toneR = `hb;
                    12'd196: toneR = `hb;
                    12'd197: toneR = `hb;
                    12'd198: toneR = `hb;
                    12'd199: toneR = `hb;
                    //
                    12'd200: toneR = `ha;
                    12'd201: toneR = `ha;
                    12'd202: toneR = `ha;
                    12'd203: toneR = `ha;
                    12'd204: toneR = `ha;
                    12'd205: toneR = `ha;
                    12'd206: toneR = `ha;
                    12'd207: toneR = `ha;
                    //
                    12'd208: toneR = `hg;
                    12'd209: toneR = `hg;
                    12'd210: toneR = `hg;
                    12'd211: toneR = `hg;
                    12'd212: toneR = `hg;
                    12'd213: toneR = `hg;
                    12'd214: toneR = `hg;
                    12'd215: toneR = `hg;
                    //
                    12'd216: toneR = `ha;
                    12'd217: toneR = `ha;
                    12'd218: toneR = `ha;
                    12'd219: toneR = `ha;
                    12'd220: toneR = `ha;
                    12'd221: toneR = `ha;
                    12'd222: toneR = `ha;
                    12'd223: toneR = `ha;
                    //
                    12'd224: toneR = `hg;
                    12'd225: toneR = `hg;
                    12'd226: toneR = `hg;
                    12'd227: toneR = `hg;
                    12'd228: toneR = `hg;
                    12'd229: toneR = `hg;
                    12'd230: toneR = `hg;
                    12'd231: toneR = `hg;
                    //
                    12'd232: toneR = `he;
                    12'd233: toneR = `he;
                    12'd234: toneR = `he;
                    12'd235: toneR = `he;
                    12'd236: toneR = `he;
                    12'd237: toneR = `he;
                    12'd238: toneR = `he;
                    12'd239: toneR = `sil;
                    //
                    12'd240: toneR = `he;
                    12'd241: toneR = `he;
                    12'd242: toneR = `he;
                    12'd243: toneR = `he;
                    12'd244: toneR = `he;
                    12'd245: toneR = `he;
                    12'd246: toneR = `he;
                    12'd247: toneR = `he;
                    12'd248: toneR = `he;
                    12'd249: toneR = `he;
                    12'd250: toneR = `he;
                    12'd251: toneR = `he;
                    12'd252: toneR = `he;
                    12'd253: toneR = `he;
                    12'd254: toneR = `he;
                    12'd255: toneR = `he;
                    default : toneR = `sil;
        endcase

    end

    always @(*) begin
        case(ibeatNum)
                //
            12'd0: toneL = `lb;   12'd1: toneL = `lb;
            12'd2: toneL = `lb;   12'd3: toneL = `lb;
            12'd4: toneL = `lb;   12'd5: toneL = `lb;
            12'd6: toneL = `lb;   12'd7: toneL = `sil;
            //
            12'd8: toneL = `lb;   12'd9: toneL = `lb;
            12'd10: toneL = `lb;   12'd11: toneL = `lb;
            12'd12: toneL = `lb;   12'd13: toneL = `lb;
            12'd14: toneL = `lb;   12'd15: toneL = `sil;
            //
            12'd16: toneL = `lb;   12'd17: toneL = `lb;
            12'd18: toneL = `lb;   12'd19: toneL = `lb;
            12'd20: toneL = `lb;   12'd21: toneL = `lb;
            12'd22: toneL = `lb;   12'd23: toneL = `lb;
            12'd24: toneL = `lb;   12'd25: toneL = `lb;
            12'd26: toneL = `lb;   12'd27: toneL = `lb;
            12'd28: toneL = `lb;   12'd29: toneL = `lb;
            12'd30: toneL = `lb;   12'd31: toneL = `sil;

            //
            12'd32: toneL = `lb;   12'd33: toneL = `lb;
            12'd34: toneL = `lb;   12'd35: toneL = `lb;
            12'd36: toneL = `lb;   12'd37: toneL = `lb;
            12'd38: toneL = `lb;   12'd39: toneL = `sil;
            //
            12'd40: toneL = `lb;   12'd41: toneL = `lb;
            12'd42: toneL = `lb;   12'd43: toneL = `lb;
            12'd44: toneL = `lb;   12'd45: toneL = `lb;
            12'd46: toneL = `lb;   12'd47: toneL = `sil;
            //
            12'd48: toneL = `lb;   12'd49: toneL = `lb;
            12'd50: toneL = `lb;   12'd51: toneL = `lb;
            12'd52: toneL = `lb;   12'd53: toneL = `lb;
            12'd54: toneL = `lb;   12'd55: toneL = `lb;
            12'd56: toneL = `lb;   12'd57: toneL = `lb;
            12'd58: toneL = `lb;   12'd59: toneL = `lb;
            12'd60: toneL = `lb;   12'd61: toneL = `lb;
            12'd62: toneL = `lb;   12'd63: toneL = `lb;



            //
            12'd64: toneL = `d_sharp;   12'd65: toneL = `d_sharp;
            12'd66: toneL = `d_sharp;   12'd67: toneL = `d_sharp;
            12'd68: toneL = `d_sharp;   12'd69: toneL = `d_sharp;
            12'd70: toneL = `d_sharp;   12'd71: toneL = `d_sharp;
            //
            12'd72: toneL = `lb;   12'd73: toneL = `lb;
            12'd74: toneL = `lb;   12'd75: toneL = `lb;
            12'd76: toneL = `lb;   12'd77: toneL = `lb;
            12'd78: toneL = `lb;   12'd79: toneL = `sil;
            //
            12'd80: toneL = `lb;   12'd81: toneL = `lb;
            12'd82: toneL = `lb;   12'd83: toneL = `lb;
            12'd84: toneL = `lb;   12'd85: toneL = `lb;
            12'd86: toneL = `lb;   12'd87: toneL = `lb;
            //
            12'd88: toneL = `la;   12'd89: toneL = `la;
            12'd90: toneL = `la;   12'd91: toneL = `la;
            12'd92: toneL = `la;   12'd93: toneL = `la;
            12'd94: toneL = `la;   12'd95: toneL = `la;
            //
            12'd96: toneL = `lg;   12'd97: toneL = `lg;
            12'd98: toneL = `lg;   12'd99: toneL = `lg;
            12'd100: toneL = `lg;   12'd101: toneL = `lg;
            12'd102: toneL = `lg;   12'd103: toneL = `lg;
            //
            12'd104: toneL = `la;   12'd105: toneL = `la;
            12'd106: toneL = `la;   12'd107: toneL = `la;
            12'd108: toneL = `la;   12'd109: toneL = `la;
            12'd110: toneL = `la;   12'd111: toneL = `la;
            //
            12'd112: toneL = `lb;   12'd113: toneL = `lb;
            12'd114: toneL = `lb;   12'd115: toneL = `lb;
            12'd116: toneL = `lb;   12'd117: toneL = `lb;
            12'd118: toneL = `lb;   12'd119: toneL = `lb;
            12'd120: toneL = `lb;   12'd121: toneL = `lb;
            12'd122: toneL = `lb;   12'd123: toneL = `lb;
            12'd124: toneL = `lb;   12'd125: toneL = `lb;
            12'd126: toneL = `lb;   12'd127: toneL = `sil;



            //
            12'd128: toneL = `lb;   12'd129: toneL = `lb;
            12'd130: toneL = `lb;   12'd131: toneL = `lb;
            12'd132: toneL = `lb;   12'd133: toneL = `lb;
            12'd134: toneL = `lb;   12'd135: toneL = `sil;
            //
            12'd136: toneL = `lb;   12'd137: toneL = `lb;
            12'd138: toneL = `lb;   12'd139: toneL = `lb;
            12'd140: toneL = `lb;   12'd141: toneL = `lb;
            12'd142: toneL = `lb;   12'd143: toneL = `sil;
            //
            12'd144: toneL = `lb;   12'd145: toneL = `lb;
            12'd146: toneL = `lb;   12'd147: toneL = `lb;
            12'd148: toneL = `lb;   12'd149: toneL = `lb;
            12'd150: toneL = `lb;   12'd151: toneL = `lb;
            12'd152: toneL = `lb;   12'd153: toneL = `lb;
            12'd154: toneL = `lb;   12'd155: toneL = `lb;
            12'd156: toneL = `lb;   12'd157: toneL = `lb;
            12'd158: toneL = `lb;   12'd159: toneL = `sil;



            //
            12'd160: toneL = `lb;   12'd161: toneL = `lb;
            12'd162: toneL = `lb;   12'd163: toneL = `lb;
            12'd164: toneL = `lb;   12'd165: toneL = `lb;
            12'd166: toneL = `lb;   12'd167: toneL = `sil;
            //
            12'd168: toneL = `lb;   12'd169: toneL = `lb;
            12'd170: toneL = `lb;   12'd171: toneL = `lb;
            12'd172: toneL = `lb;   12'd173: toneL = `lb;
            12'd174: toneL = `lb;   12'd175: toneL = `sil;
            //
            12'd176: toneL = `lb;   12'd177: toneL = `lb;
            12'd178: toneL = `lb;   12'd179: toneL = `lb;
            12'd180: toneL = `lb;   12'd181: toneL = `lb;
            12'd182: toneL = `lb;   12'd183: toneL = `lb;
            12'd184: toneL = `lb;   12'd185: toneL = `lb;
            12'd186: toneL = `lb;   12'd187: toneL = `lb;
            12'd188: toneL = `lb;   12'd189: toneL = `lb;
            12'd190: toneL = `lb;   12'd191: toneL = `sil;


            //
            12'd192: toneL = `lb;   12'd193: toneL = `lb;
            12'd194: toneL = `lb;   12'd195: toneL = `lb;
            12'd196: toneL = `lb;   12'd197: toneL = `lb;
            12'd198: toneL = `lb;   12'd199: toneL = `lb;
            //
            12'd200: toneL = `la;   12'd201: toneL = `la;
            12'd202: toneL = `la;   12'd203: toneL = `la;
            12'd204: toneL = `la;   12'd205: toneL = `la;
            12'd206: toneL = `la;   12'd207: toneL = `la;
            //
            12'd208: toneL = `lg;   12'd209: toneL = `lg;
            12'd210: toneL = `lg;   12'd211: toneL = `lg;
            12'd212: toneL = `lg;   12'd213: toneL = `lg;
            12'd214: toneL = `lg;   12'd215: toneL = `lg;
            //
            12'd216: toneL = `la;   12'd217: toneL = `la;
            12'd218: toneL = `la;   12'd219: toneL = `la;
            12'd220: toneL = `la;   12'd221: toneL = `la;
            12'd222: toneL = `la;   12'd223: toneL = `la;
            //
            12'd224: toneL = `lg;   12'd225: toneL = `lg;
            12'd226: toneL = `lg;   12'd227: toneL = `lg;
            12'd228: toneL = `lg;   12'd229: toneL = `lg;
            12'd230: toneL = `lg;   12'd231: toneL = `lg;
            //
            12'd232: toneL = `le;   12'd233: toneL = `le;
            12'd234: toneL = `le;   12'd235: toneL = `le;
            12'd236: toneL = `le;   12'd237: toneL = `le;
            12'd238: toneL = `le;   12'd239: toneL = `sil;
            //
            12'd240: toneL = `le;   12'd241: toneL = `le;
            12'd242: toneL = `le;   12'd243: toneL = `le;
            12'd244: toneL = `le;   12'd245: toneL = `le;
            12'd246: toneL = `le;   12'd247: toneL = `le;
            12'd248: toneL = `le;   12'd249: toneL = `le;
            12'd250: toneL = `le;   12'd251: toneL = `le;
            12'd252: toneL = `le;   12'd253: toneL = `le;
            12'd254: toneL = `le;   12'd255: toneL = `le;

        default toneL = `sil;
        endcase
    end
endmodule