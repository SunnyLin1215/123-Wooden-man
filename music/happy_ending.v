`define c   32'd261   // C3
`define d_flat   32'd277
`define d   32'd294
`define e   32'd330
`define e_flat   32'd311
`define f   32'd349
`define g   32'd392   // G3
`define g_sharp   32'd416   // G3
`define a_flat   32'd415
`define a   32'd440
`define b_flat   32'd466
`define b   32'd494
`define hc  32'd524   // C4
`define hd  32'd588   // D4
`define hd_sharp  32'd623   // D4
`define he_flat  32'd622   // E4
`define he  32'd659   // E4
`define hf  32'd698   // F4
`define hf_sharp  32'd740   // F4
`define hg  32'd784   // G4
`define ha  32'd880   // G4
`define hhc  32'd1047   // C4

`define lb_flat   32'd233
`define la_flat   32'd208
`define lg   32'd196
`define lf   32'd174
`define le_flat   32'd156
`define ld   32'd147
`define llc   32'd131
`define llb_flat   32'd117
`define lla_flat   32'd104
`define llg   32'd98

`define sil   32'd50000000 // slience

module happy_ending (
	input [11:0] ibeatNum,
	output reg [31:0] toneL, 
    output reg [31:0] toneR
);

    always @* begin
        case(ibeatNum)
            // --- Measure 1 ---
            // 1st bar
            12'd0: toneR = `hc;            12'd1: toneR = `hc; 
            12'd2: toneR = `hc;            12'd3: toneR = `hc;
            12'd4: toneR = `hc;            12'd5: toneR = `hc; 
            12'd6: toneR = `hc;            12'd7: toneR = `hc;
            12'd8: toneR = `sil;       12'd9: toneR = `sil;
            12'd10: toneR = `sil;      12'd11: toneR = `sil;
            12'd12: toneR = `g;      12'd13: toneR = `g;
            12'd14: toneR = `g;      12'd15: toneR = `g;
            12'd16: toneR = `g;          12'd17: toneR = `g; 
            12'd18: toneR = `g;          12'd19: toneR = `g;
            12'd20: toneR = `sil;          12'd21: toneR = `sil;
            12'd22: toneR = `sil;          12'd23: toneR = `sil; 
            12'd24: toneR = `e;          12'd25: toneR = `e;
            12'd26: toneR = `e;          12'd27: toneR = `e;
            12'd28: toneR = `e;      12'd29: toneR = `e; 
            12'd30: toneR = `e;      12'd31: toneR = `e; 
            12'd32: toneR = `sil;      12'd33: toneR = `sil;
            12'd34: toneR = `sil;      12'd35: toneR = `sil; 
            12'd36: toneR = `a;      12'd37: toneR = `a; 
            12'd38: toneR = `a;      12'd39: toneR = `a;
            12'd40: toneR = `a;           12'd41: toneR = `a;
            12'd42: toneR = `a;           12'd43: toneR = `a;
            12'd44: toneR = `b;           12'd45: toneR = `b;
            12'd46: toneR = `b;           12'd47: toneR = `b;
            12'd48: toneR = `b;           12'd49: toneR = `b;
            12'd50: toneR = `b;           12'd51: toneR = `b;
            12'd52: toneR = `b_flat;           12'd53: toneR = `b_flat;
            12'd54: toneR = `b_flat;           12'd55: toneR = `b_flat;
            12'd56: toneR = `a;      12'd57: toneR = `a;
            12'd58: toneR = `a;      12'd59: toneR = `a;
            12'd60: toneR = `sil;      12'd61: toneR = `sil;
            12'd62: toneR = `sil;      12'd63: toneR = `sil;

            // 2nd bar
            12'd64: toneR = `g;     12'd65: toneR = `g;
            12'd66: toneR = `g;     12'd67: toneR = `g;
            12'd68: toneR = `g;     12'd69: toneR = `g;
            12'd70: toneR = `g;     12'd71: toneR = `g;
            12'd72: toneR = `he;     12'd73: toneR = `he;
            12'd74:  toneR = `he;     12'd75: toneR = `he;
            12'd76: toneR = `hg;     12'd77: toneR = `hg;
            12'd78:  toneR = `hg;     12'd79: toneR = `hg;
            12'd80: toneR = `ha;     12'd81: toneR = `ha;
            12'd82: toneR = `ha;     12'd83: toneR = `ha;
            12'd84: toneR = `ha;     12'd85: toneR = `ha;
            12'd86: toneR = `ha;     12'd87: toneR = `ha;
            12'd88: toneR = `hf;     12'd89: toneR = `hf;
            12'd90: toneR = `hf;     12'd91: toneR = `hf;
            12'd92: toneR = `hg;     12'd93: toneR = `hg; 
            12'd94: toneR = `hg;     12'd95: toneR = `hg; 
            12'd96: toneR = `hg;     12'd97: toneR = `hg;
            12'd98: toneR = `hg;     12'd99: toneR = `hg; 
            12'd100: toneR = `he;     12'd101: toneR = `he; 
            12'd102: toneR = `he;     12'd103: toneR = `he;
            12'd104: toneR = `he;     12'd105: toneR = `he;
            12'd106: toneR = `he;     12'd107: toneR = `he;
            12'd108: toneR = `hc;     12'd109: toneR = `hc;
            12'd110: toneR = `hc;     12'd111: toneR = `hc;
            12'd112: toneR = `hd;     12'd113: toneR = `hd;
            12'd114: toneR = `hd;     12'd115: toneR = `hd;
            12'd116: toneR = `b;     12'd117: toneR = `b;
            12'd118: toneR = `b;     12'd119: toneR = `b;
            12'd120: toneR = `sil;     12'd121: toneR = `sil;
            12'd122: toneR = `sil;     12'd123: toneR = `sil;
            12'd124: toneR = `sil;     12'd125: toneR = `sil;
            12'd126: toneR = `sil;     12'd127: toneR = `sil;

            // --- Measure 2 ---
            // 3rd bar
            12'd128: toneR = `hc;     12'd129: toneR = `hc; 
            12'd130: toneR = `hc;     12'd131: toneR = `hc;
            12'd132: toneR = `hc;     12'd133: toneR = `hc; 
            12'd134: toneR = `hc;     12'd135: toneR = `hc;
            12'd136: toneR = `sil;     12'd137: toneR = `sil;
            12'd138: toneR = `sil;     12'd139: toneR = `sil;
            12'd140: toneR = `g;     12'd141: toneR = `g;
            12'd142: toneR = `g;     12'd143: toneR = `g;
            12'd144: toneR = `g;     12'd145: toneR = `g; 
            12'd146: toneR = `g;     12'd147: toneR = `g;
            12'd148: toneR = `sil;     12'd149: toneR = `sil;
            12'd150: toneR = `sil;     12'd151: toneR = `sil; 
            12'd152: toneR = `e;     12'd153: toneR = `e; 
            12'd154: toneR = `e;     12'd155: toneR = `e;
            12'd156: toneR = `e;     12'd157: toneR = `e;
            12'd158: toneR = `e;     12'd159: toneR = `e;
            12'd160: toneR = `sil;     12'd161: toneR = `sil;
            12'd162: toneR = `sil;     12'd163: toneR = `sil;
            12'd164: toneR = `a;     12'd165: toneR = `a; 
            12'd166: toneR = `a;     12'd167: toneR = `a;
            12'd168: toneR = `a;     12'd169: toneR = `a;
            12'd170: toneR = `a;     12'd171: toneR = `a;
            12'd172: toneR = `b;     12'd173: toneR = `b;
            12'd174: toneR = `b;     12'd175: toneR = `b;
            12'd176: toneR = `b;     12'd177: toneR = `b; 
            12'd178: toneR = `b;     12'd179: toneR = `b;
            12'd180: toneR = `b_flat;     12'd181: toneR = `b_flat; 
            12'd182: toneR = `b_flat;     12'd183: toneR = `b_flat;
            12'd184: toneR = `a;     12'd185: toneR = `a;
            12'd186: toneR = `a;     12'd187: toneR = `a;
            12'd188: toneR = `sil;     12'd189: toneR = `sil;
            12'd190: toneR = `sil;     12'd191: toneR = `sil;

            // 4th bar
            12'd192: toneR = `g;     12'd193: toneR = `g; 
            12'd194: toneR = `g;     12'd195: toneR = `g;
            12'd196: toneR = `g;     12'd197: toneR = `g;
            12'd198: toneR = `g;     12'd199: toneR = `g;
            12'd200: toneR = `he;    12'd201: toneR = `he;
            12'd202: toneR = `he;    12'd203: toneR = `he; //
            12'd204: toneR = `hg;    12'd205: toneR = `hg;
            12'd206: toneR = `hg;    12'd207: toneR = `hg; 
            12'd208: toneR = `ha;    12'd209: toneR = `ha; // HG (half-beat)
            12'd210: toneR = `ha;    12'd211: toneR = `ha;
            12'd212: toneR = `ha;    12'd213: toneR = `ha;
            12'd214: toneR = `ha;    12'd215: toneR = `ha; // HG (half-beat)
            12'd216: toneR = `hf;    12'd217: toneR = `hf;
            12'd218: toneR = `hf;    12'd219: toneR = `hf;
            12'd220: toneR = `hg;    12'd221: toneR = `hg; // (Short break for repetitive notes: high D)
            12'd222: toneR = `hg;    12'd223: toneR = `hg; // HG (one-beat)
            12'd224: toneR = `hg;    12'd225: toneR = `hg;
            12'd226: toneR = `hg;    12'd227: toneR = `hg; // (Short break for repetitive notes: high D)
            12'd228: toneR = `he;    12'd229: toneR = `he; // HG (one-beat)
            12'd230: toneR = `he;    12'd231: toneR = `he;
            12'd232: toneR = `he;    12'd233: toneR = `he;
            12'd234: toneR = `he;    12'd235: toneR = `he;
            12'd236: toneR = `hc;    12'd237: toneR = `hc;
            12'd238: toneR = `hc;    12'd239: toneR = `hc;//
            12'd240: toneR = `hd;    12'd241: toneR = `hd;
            12'd242: toneR = `hd;    12'd243: toneR = `hd;
            12'd244: toneR = `b;    12'd245: toneR = `b;
            12'd246: toneR = `b;    12'd247: toneR = `b;
            12'd248: toneR = `sil;    12'd249: toneR = `sil;
            12'd250: toneR = `sil;    12'd251: toneR = `sil;
            12'd252: toneR = `sil;    12'd253: toneR = `sil;
            12'd254: toneR = `sil;    12'd255: toneR = `sil;

            //5th bar
            12'd256: toneR = `sil;    12'd257: toneR = `sil; 
            12'd258: toneR = `sil;    12'd259: toneR = `sil;
            12'd260: toneR = `sil;    12'd261: toneR = `sil; 
            12'd262:  toneR = `sil;    12'd263: toneR = `sil;
            12'd264: toneR = `hg;    12'd265: toneR = `hg;
            12'd266: toneR = `hg;    12'd267: toneR = `hg; 
            12'd268: toneR = `hf_sharp;    12'd269: toneR = `hf_sharp;
            12'd270: toneR = `hf_sharp;    12'd271: toneR = `hf_sharp; 
            12'd272: toneR = `hf;    12'd273: toneR = `hf;
            12'd274: toneR = `hf;    12'd275: toneR = `hf;
            12'd276: toneR = `hd_sharp;    12'd277: toneR = `hd_sharp;
            12'd278: toneR = `hd_sharp;    12'd279: toneR = `hd_sharp;
            12'd280: toneR = `sil;    12'd281: toneR = `sil;
            12'd282: toneR = `sil;    12'd283: toneR = `sil;
            12'd284: toneR = `he;    12'd285: toneR = `he;
            12'd286: toneR = `he;    12'd287: toneR = `he;
            12'd288: toneR = `sil;    12'd289: toneR = `sil;
            12'd290: toneR = `sil;    12'd291: toneR = `sil; 
            12'd292: toneR = `g_sharp;    12'd293: toneR = `g_sharp; 
            12'd294: toneR = `g_sharp;    12'd295: toneR = `g_sharp;
            12'd296: toneR = `a;     12'd297: toneR = `a;
            12'd298: toneR = `a;     12'd299: toneR = `a;
            12'd300: toneR = `hc;     12'd301: toneR = `hc;
            12'd302: toneR = `hc;     12'd303: toneR = `hc;
            12'd304: toneR = `sil;    12'd305: toneR = `sil;
            12'd306: toneR = `sil;    12'd307: toneR = `sil;
            12'd308: toneR = `a;    12'd309: toneR = `a;
            12'd310: toneR = `a;    12'd311: toneR = `a;
            12'd312: toneR = `hc;     12'd313: toneR = `hc;
            12'd314: toneR = `hc;     12'd315: toneR = `hc;
            12'd316: toneR = `hd;     12'd317: toneR = `hd;
            12'd318: toneR = `hd;     12'd319: toneR = `hd;

            //6th bar
            12'd320: toneR = `sil;    12'd321: toneR = `sil; //
            12'd322: toneR = `sil;    12'd323: toneR = `sil;
            12'd324: toneR = `sil;    12'd325: toneR = `sil; 
            12'd326: toneR = `sil;    12'd327: toneR = `sil;//
            12'd328: toneR = `hg;     12'd329: toneR = `hg;
            12'd330: toneR = `hg;     12'd331: toneR = `hg; //
            12'd332: toneR = `hf_sharp;     12'd333: toneR = `hf_sharp;
            12'd334: toneR = `hf_sharp;     12'd335: toneR = `hf_sharp; //
            12'd336: toneR = `hf;     12'd337: toneR = `hf;
            12'd338: toneR = `hf;     12'd339: toneR = `hf;//
            12'd340: toneR = `hd_sharp;     12'd341: toneR = `hd_sharp;
            12'd342: toneR = `hd_sharp;     12'd343: toneR = `hd_sharp;//
            12'd344: toneR = `sil;    12'd345: toneR = `sil;
            12'd346: toneR = `sil;    12'd347: toneR = `sil; //
            12'd348: toneR = `he;    12'd349: toneR = `he;
            12'd350: toneR = `he;    12'd351: toneR = `he; 
            12'd352: toneR = `sil;    12'd353: toneR = `sil; 
            12'd354: toneR = `sil;    12'd355: toneR = `sil;
            12'd356: toneR = `hhc;    12'd357: toneR = `hhc; 
            12'd358: toneR = `hhc;    12'd359: toneR = `hhc;
            12'd360: toneR = `hhc;    12'd361: toneR = `hhc;
            12'd362: toneR = `hhc;    12'd363: toneR = `sil;
            12'd364: toneR = `hhc;    12'd365: toneR = `hhc;
            12'd366: toneR = `hhc;    12'd367: toneR = `sil;
            12'd368: toneR = `hhc;    12'd369: toneR = `hhc;
            12'd370: toneR = `hhc;    12'd371: toneR = `hhc;
            12'd372: toneR = `hhc;    12'd373: toneR = `hhc;
            12'd374: toneR = `hhc;    12'd375: toneR = `hhc;
            12'd376: toneR = `sil;     12'd377: toneR = `sil;
            12'd378: toneR = `sil;     12'd379: toneR = `sil;
            12'd380: toneR = `sil;     12'd381: toneR = `sil;
            12'd382: toneR = `sil;     12'd383: toneR = `sil;

            //7th bar
            12'd384: toneR = `sil;    12'd385: toneR = `sil; 
            12'd386: toneR = `sil;    12'd387: toneR = `sil;
            12'd388: toneR = `sil;    12'd389: toneR = `sil; 
            12'd390: toneR = `sil;    12'd391: toneR = `sil;
            12'd392: toneR = `hg;    12'd393: toneR = `hg;
            12'd394: toneR = `hg;    12'd395: toneR = `hg; //
            12'd396: toneR = `hf_sharp;    12'd397: toneR = `hf_sharp;
            12'd398: toneR = `hf_sharp;    12'd399: toneR = `hf_sharp;//
            12'd400: toneR = `hf;    12'd401: toneR = `hf; 
            12'd402: toneR = `hf;    12'd403: toneR = `hf;//
            12'd404: toneR = `hd_sharp;    12'd405: toneR = `hd_sharp;
            12'd406: toneR = `hd_sharp;    12'd407: toneR = `hd_sharp; //
            12'd408: toneR = `sil;    12'd409: toneR = `sil; 
            12'd410: toneR = `sil;    12'd411: toneR = `sil;//
            12'd412: toneR = `he;    12'd413: toneR = `he;
            12'd414: toneR = `he;    12'd415: toneR = `he;
            12'd416: toneR = `sil;    12'd417: toneR = `sil; 
            12'd418: toneR = `sil;    12'd419: toneR = `sil;
            12'd420: toneR = `g_sharp;    12'd421: toneR = `g_sharp;
            12'd422: toneR = `g_sharp;    12'd423: toneR = `g_sharp; //
            12'd424: toneR = `a;    12'd425: toneR = `a; 
            12'd426: toneR = `a;    12'd427: toneR = `a;//
            12'd428: toneR = `hc;    12'd429: toneR = `hc;
            12'd430: toneR = `hc;    12'd431: toneR = `hc;//
            12'd432: toneR = `sil;    12'd433: toneR = `sil;
            12'd434: toneR = `sil;    12'd435: toneR = `sil;
            12'd436: toneR = `a;    12'd437: toneR = `a;
            12'd438: toneR = `a;    12'd439: toneR = `a;
            12'd440: toneR = `hc;     12'd441: toneR = `hc;
            12'd442: toneR = `hc;     12'd443: toneR = `hc;
            12'd444: toneR = `hd;     12'd445: toneR = `hd;
            12'd446: toneR = `hd;     12'd447: toneR = `hd;

            //8th bar
            12'd448: toneR = `sil;    12'd449: toneR = `sil; //
            12'd450: toneR = `sil;    12'd451: toneR = `sil;
            12'd452: toneR = `sil;    12'd453: toneR = `sil; 
            12'd454: toneR = `sil;    12'd455: toneR = `sil;//
            12'd456: toneR = `he_flat;    12'd457: toneR = `he_flat;
            12'd458: toneR = `he_flat;    12'd459: toneR = `he_flat;
            12'd460: toneR = `he_flat;    12'd461: toneR = `he_flat;
            12'd462: toneR = `he_flat;    12'd463: toneR = `he_flat;
            12'd464: toneR = `sil;    12'd465: toneR = `sil;
            12'd466: toneR = `sil;    12'd467: toneR = `sil;
            12'd468: toneR = `hd;    12'd469: toneR = `hd; 
            12'd470: toneR = `hd;    12'd471: toneR = `hd; 
            12'd472: toneR = `sil;    12'd473: toneR = `sil;
            12'd474: toneR = `sil;    12'd475: toneR = `sil;
            12'd476: toneR = `sil;    12'd477: toneR = `sil;
            12'd478: toneR = `sil;    12'd479: toneR = `sil;
            12'd480: toneR = `hc;    12'd481: toneR = `hc;
            12'd482: toneR = `hc;    12'd483: toneR = `hc;
            12'd484: toneR = `hc;    12'd485: toneR = `hc;
            12'd486: toneR = `hc;    12'd487: toneR = `hc;
            12'd488: toneR = `hc;    12'd489: toneR = `hc;
            12'd490: toneR = `hc;    12'd491: toneR = `hc;
            12'd492: toneR = `hc;    12'd493: toneR = `hc; 
            12'd494: toneR = `hc;    12'd495: toneR = `hc; 
            12'd496: toneR = `sil;    12'd497: toneR = `sil;
            12'd498: toneR = `sil;    12'd499: toneR = `sil;
            12'd500: toneR = `sil;    12'd501: toneR = `sil;
            12'd502: toneR = `sil;    12'd503: toneR = `sil;
            12'd504: toneR = `sil;   12'd505: toneR = `sil;
            12'd506: toneR = `sil;   12'd507: toneR = `sil;
            12'd508: toneR = `sil;   12'd509: toneR = `sil;
            12'd510: toneR = `sil;   12'd511: toneR = `sil;

            default: toneR = `sil;
        endcase
    end

    always @(*) begin
        case(ibeatNum)
            // --- Measure 1 ---
            // 1st bar
            12'd0: toneL = `e;            12'd1: toneL = `e; 
            12'd2: toneL = `e;            12'd3: toneL = `e;
            12'd4: toneL = `e;            12'd5: toneL = `e; 
            12'd6: toneL = `e;            12'd7: toneL = `e;
            12'd8: toneL = `sil;       12'd9: toneL = `sil;
            12'd10: toneL = `sil;      12'd11: toneL = `sil;
            12'd12: toneL = `c;      12'd13: toneL = `c;
            12'd14: toneL = `c;      12'd15: toneL = `c;
            12'd16: toneL = `c;          12'd17: toneL = `c; 
            12'd18: toneL = `c;          12'd19: toneL = `c;
            12'd20: toneL = `sil;          12'd21: toneL = `sil;
            12'd22: toneL = `sil;          12'd23: toneL = `sil; 
            12'd24: toneL = `lg;          12'd25: toneL = `lg;
            12'd26: toneL = `lg;          12'd27: toneL = `lg;
            12'd28: toneL = `lg;      12'd29: toneL = `lg; 
            12'd30: toneL = `lg;      12'd31: toneL = `lg; 
            12'd32: toneL = `sil;      12'd33: toneL = `sil;
            12'd34: toneL = `sil;      12'd35: toneL = `sil; 
            12'd36: toneL = `c;      12'd37: toneL = `c; 
            12'd38: toneL = `c;      12'd39: toneL = `c;
            12'd40: toneL = `c;           12'd41: toneL = `c;
            12'd42: toneL = `c;           12'd43: toneL = `c;
            12'd44: toneL = `d;           12'd45: toneL = `d;
            12'd46: toneL = `d;           12'd47: toneL = `d;//
            12'd48: toneL = `d;           12'd49: toneL = `d;
            12'd50: toneL = `d;           12'd51: toneL = `d;
            12'd52: toneL = `d_flat;           12'd53: toneL = `d_flat;
            12'd54: toneL = `d_flat;           12'd55: toneL = `d_flat;
            12'd56: toneL = `c;      12'd57: toneL = `c;
            12'd58: toneL = `c;      12'd59: toneL = `c;
            12'd60: toneL = `sil;      12'd61: toneL = `sil;
            12'd62: toneL = `sil;      12'd63: toneL = `sil;

            // 2nd bar
            12'd64: toneL = `c;     12'd65: toneL = `c;
            12'd66: toneL = `c;     12'd67: toneL = `c;
            12'd68: toneL = `c;     12'd69: toneL = `c;
            12'd70: toneL = `c;     12'd71: toneL = `c;
            12'd72: toneL = `g;     12'd73: toneL = `g;
            12'd74:  toneL = `g;     12'd75: toneL = `g;
            12'd76: toneL = `b;     12'd77: toneL = `b;
            12'd78:  toneL = `b;     12'd79: toneL = `b;
            12'd80: toneL = `hc;     12'd81: toneL = `hc;
            12'd82: toneL = `hc;     12'd83: toneL = `hc;
            12'd84: toneL = `hc;     12'd85: toneL = `hc;
            12'd86: toneL = `hc;     12'd87: toneL = `hc;
            12'd88: toneL = `a;     12'd89: toneL = `a;
            12'd90: toneL = `a;     12'd91: toneL = `a;
            12'd92: toneL = `b;     12'd93: toneL = `b; 
            12'd94: toneL = `b;     12'd95: toneL = `b; 
            12'd96: toneL = `b;     12'd97: toneL = `b;
            12'd98: toneL = `b;     12'd99: toneL = `b; 
            12'd100: toneL = `a;     12'd101: toneL = `a; 
            12'd102: toneL = `a;     12'd103: toneL = `a;
            12'd104: toneL = `a;     12'd105: toneL = `a;
            12'd106: toneL = `a;     12'd107: toneL = `a;
            12'd108: toneL = `e;     12'd109: toneL = `e;
            12'd110: toneL = `e;     12'd111: toneL = `e;//
            12'd112: toneL = `f;     12'd113: toneL = `f;
            12'd114: toneL = `f;     12'd115: toneL = `f;
            12'd116: toneL = `d;     12'd117: toneL = `d;
            12'd118: toneL = `d;     12'd119: toneL = `d;
            12'd120: toneL = `sil;     12'd121: toneL = `sil;
            12'd122: toneL = `sil;     12'd123: toneL = `sil;
            12'd124: toneL = `sil;     12'd125: toneL = `sil;
            12'd126: toneL = `sil;     12'd127: toneL = `sil;

            // --- Measure 2 ---
            // 3rd bar
            12'd128: toneL = `e;     12'd129: toneL = `e; 
            12'd130: toneL = `e;     12'd131: toneL = `e;
            12'd132: toneL = `e;     12'd133: toneL = `e;
            12'd134: toneL = `e;     12'd135: toneL = `e;
            12'd136: toneL = `sil;     12'd137: toneL = `sil;
            12'd138: toneL = `sil;     12'd139: toneL = `sil;
            12'd140: toneL = `c;     12'd141: toneL = `c;
            12'd142: toneL = `c;     12'd143: toneL = `c;
            12'd144: toneL = `c;     12'd145: toneL = `c; 
            12'd146: toneL = `c;     12'd147: toneL = `c;//
            12'd148: toneL = `sil;     12'd149: toneL = `sil;
            12'd150: toneL = `sil;     12'd151: toneL = `sil; 
            12'd152: toneL = `lg;     12'd153: toneL = `lg;
            12'd154: toneL = `lg;     12'd155: toneL = `lg;
            12'd156: toneL = `lg;     12'd157: toneL = `lg;
            12'd158: toneL = `lg;     12'd159: toneL = `lg; 
            12'd160: toneL = `sil;     12'd161: toneL = `sil;
            12'd162: toneL = `sil;     12'd163: toneL = `sil;
            12'd164: toneL = `c;     12'd165: toneL = `c; 
            12'd166: toneL = `c;     12'd167: toneL = `c;
            12'd168: toneL = `c;     12'd169: toneL = `c;
            12'd170: toneL = `c;     12'd171: toneL = `c;
            12'd172: toneL = `d;     12'd173: toneL = `d;
            12'd174: toneL = `d;     12'd175: toneL = `d; 
            12'd176: toneL = `d;     12'd177: toneL = `d; 
            12'd178: toneL = `d;     12'd179: toneL = `d;//
            12'd180: toneL = `d_flat;     12'd181: toneL = `d_flat; 
            12'd182: toneL = `d_flat;     12'd183: toneL = `d_flat;
            12'd184: toneL = `c;     12'd185: toneL = `c;
            12'd186: toneL = `c;     12'd187: toneL = `c;
            12'd188: toneL = `sil;     12'd189: toneL = `sil;
            12'd190: toneL = `sil;     12'd191: toneL = `sil;//

            // 4th bar
            12'd192: toneL = `c;     12'd193: toneL = `c; 
            12'd194: toneL = `c;     12'd195: toneL = `c;
            12'd196: toneL = `c;     12'd197: toneL = `c;
            12'd198: toneL = `c;     12'd199: toneL = `c;
            12'd200: toneL = `g;    12'd201: toneL = `g;
            12'd202: toneL = `g;    12'd203: toneL = `g; 
            12'd204: toneL = `b;    12'd205: toneL = `b;
            12'd206: toneL = `b;    12'd207: toneL = `b; //
            12'd208: toneL = `hc;    12'd209: toneL = `hc; 
            12'd210: toneL = `hc;    12'd211: toneL = `hc;
            12'd212: toneL = `hc;    12'd213: toneL = `hc;
            12'd214: toneL = `hc;    12'd215: toneL = `hc; 
            12'd216: toneL = `a;    12'd217: toneL = `a;
            12'd218: toneL = `a;    12'd219: toneL = `a;
            12'd220: toneL = `b;    12'd221: toneL = `b; 
            12'd222: toneL = `b;    12'd223: toneL = `b; 
            12'd224: toneL = `b;    12'd225: toneL = `b;
            12'd226: toneL = `b;    12'd227: toneL = `b; 
            12'd228: toneL = `a;    12'd229: toneL = `a; 
            12'd230: toneL = `a;    12'd231: toneL = `a;
            12'd232: toneL = `a;    12'd233: toneL = `a;
            12'd234: toneL = `a;    12'd235: toneL = `a;
            12'd236: toneL = `e;    12'd237: toneL = `e;
            12'd238: toneL = `e;    12'd239: toneL = `e;//
            12'd240: toneL = `f;    12'd241: toneL = `f;
            12'd242: toneL = `f;    12'd243: toneL = `f;
            12'd244: toneL = `d;    12'd245: toneL = `d;
            12'd246: toneL = `d;    12'd247: toneL = `d;
            12'd248: toneL = `sil;    12'd249: toneL = `sil;
            12'd250: toneL = `sil;    12'd251: toneL = `sil;
            12'd252: toneL = `sil;    12'd253: toneL = `sil;
            12'd254: toneL = `sil;    12'd255: toneL = `sil;//

            //5th bar
            12'd256: toneL = `c;    12'd257: toneL = `c; 
            12'd258: toneL = `c;    12'd259: toneL = `c;
            12'd260: toneL = `c;    12'd261: toneL = `c; 
            12'd262:  toneL = `c;    12'd263: toneL = `c;
            12'd264: toneL = `sil;    12'd265: toneL = `sil;
            12'd266: toneL = `sil;    12'd267: toneL = `sil; 
            12'd268: toneL = `g;    12'd269: toneL = `g;
            12'd270: toneL = `g;    12'd271: toneL = `g;//
            12'd272: toneL = `sil;    12'd273: toneL = `sil;
            12'd274: toneL = `sil;    12'd275: toneL = `sil;
            12'd276: toneL = `sil;    12'd277: toneL = `sil;
            12'd278: toneL = `sil;    12'd279: toneL = `sil;//
            12'd280: toneL = `hc;    12'd281: toneL = `hc;
            12'd282: toneL = `hc;    12'd283: toneL = `hc;
            12'd284: toneL = `hc;    12'd285: toneL = `hc; 
            12'd286: toneL = `hc;    12'd287: toneL = `hc; 
            12'd288: toneL = `f;    12'd289: toneL = `f;
            12'd290: toneL = `f;    12'd291: toneL = `f; 
            12'd292: toneL = `f;    12'd293: toneL = `f; 
            12'd294: toneL = `f;    12'd295: toneL = `f;//
            12'd296: toneL = `sil;     12'd297: toneL = `sil;
            12'd298: toneL = `sil;     12'd299: toneL = `sil;
            12'd300: toneL = `c;     12'd301: toneL = `c;
            12'd302: toneL = `c;     12'd303: toneL = `c;//
            12'd304: toneL = `sil;    12'd305: toneL = `sil;
            12'd306: toneL = `sil;    12'd307: toneL = `sil;
            12'd308: toneL = `sil;    12'd309: toneL = `sil;
            12'd310: toneL = `sil;    12'd311: toneL = `sil;
            12'd312: toneL = `f;     12'd313: toneL = `f;
            12'd314: toneL = `f;     12'd315: toneL = `f;
            12'd316: toneL = `f;     12'd317: toneL = `f;
            12'd318: toneL = `f;     12'd319: toneL = `f;//

            //6th bar
            12'd320: toneL = `c;    12'd321: toneL = `c; 
            12'd322: toneL = `c;    12'd323: toneL = `c;
            12'd324: toneL = `c;    12'd325: toneL = `c; 
            12'd326: toneL = `c;    12'd327: toneL = `c;
            12'd328: toneL = `sil;     12'd329: toneL = `sil;
            12'd330: toneL = `sil;     12'd331: toneL = `sil; 
            12'd332: toneL = `g;     12'd333: toneL = `g;
            12'd334: toneL = `g;     12'd335: toneL = `g;
            12'd336: toneL = `sil;     12'd337: toneL = `sil;
            12'd338: toneL = `sil;     12'd339: toneL = `sil;
            12'd340: toneL = `sil;     12'd341: toneL = `sil;
            12'd342: toneL = `sil;     12'd343: toneL = `sil;//
            12'd344: toneL = `g;    12'd345: toneL = `g;
            12'd346: toneL = `g;    12'd347: toneL = `g; 
            12'd348: toneL = `hc;    12'd349: toneL = `hc;
            12'd350: toneL = `hc;    12'd351: toneL = `hc; //
            12'd352: toneL = `sil;    12'd353: toneL = `sil;
            12'd354: toneL = `sil;    12'd355: toneL = `sil;
            12'd356: toneL = `hc;    12'd357: toneL = `hc; 
            12'd358: toneL = `hc;    12'd359: toneL = `hc;//
            12'd360: toneL = `hc;    12'd361: toneL = `hc;
            12'd362: toneL = `hc;    12'd363: toneL = `sil;//
            12'd364: toneL = `hc;    12'd365: toneL = `hc;
            12'd366: toneL = `hc;    12'd367: toneL = `sil;//
            12'd368: toneL = `hc;    12'd369: toneL = `hc;
            12'd370: toneL = `hc;    12'd371: toneL = `hc;
            12'd372: toneL = `hc;    12'd373: toneL = `hc;
            12'd374: toneL = `hc;    12'd375: toneL = `hc;
            12'd376: toneL = `sil;     12'd377: toneL = `sil;
            12'd378: toneL = `sil;     12'd379: toneL = `sil;
            12'd380: toneL = `sil;     12'd381: toneL = `sil;
            12'd382: toneL = `sil;     12'd383: toneL = `sil;

            //7th bar
            12'd384: toneL = `c;    12'd385: toneL = `c; 
            12'd386: toneL = `c;    12'd387: toneL = `c;
            12'd388: toneL = `c;    12'd389: toneL = `c; 
            12'd390: toneL = `c;    12'd391: toneL = `c;//
            12'd392: toneL = `sil;    12'd393: toneL = `sil;
            12'd394: toneL = `sil;    12'd395: toneL = `sil; 
            12'd396: toneL = `g;    12'd397: toneL = `g;
            12'd398: toneL = `g;    12'd399: toneL = `g;
            12'd400: toneL = `sil;    12'd401: toneL = `sil; 
            12'd402: toneL = `sil;    12'd403: toneL = `sil;
            12'd404: toneL = `sil;    12'd405: toneL = `sil;
            12'd406: toneL = `sil;    12'd407: toneL = `sil; 
            12'd408: toneL = `hc;    12'd409: toneL = `hc; 
            12'd410: toneL = `hc;    12'd411: toneL = `hc;
            12'd412: toneL = `hc;    12'd413: toneL = `hc;
            12'd414: toneL = `hc;    12'd415: toneL = `hc;
            12'd416: toneL = `f;    12'd417: toneL = `f; 
            12'd418: toneL = `f;    12'd419: toneL = `f;
            12'd420: toneL = `f;    12'd421: toneL = `f;
            12'd422: toneL = `f;    12'd423: toneL = `f; 
            12'd424: toneL = `sil;    12'd425: toneL = `sil; 
            12'd426: toneL = `sil;    12'd427: toneL = `sil;
            12'd428: toneL = `c;    12'd429: toneL = `c;
            12'd430: toneL = `c;    12'd431: toneL = `c;//
            12'd432: toneL = `sil;    12'd433: toneL = `sil;
            12'd434: toneL = `sil;    12'd435: toneL = `sil;
            12'd436: toneL = `sil;    12'd437: toneL = `sil;
            12'd438: toneL = `sil;    12'd439: toneL = `sil;
            12'd440: toneL = `f;     12'd441: toneL = `f;
            12'd442: toneL = `f;     12'd443: toneL = `f;
            12'd444: toneL = `f;     12'd445: toneL = `f;
            12'd446: toneL = `f;     12'd447: toneL = `f;//

            //8th bar
            12'd448: toneL = `c;    12'd449: toneL = `c; 
            12'd450: toneL = `c;    12'd451: toneL = `c;
            12'd452: toneL = `c;    12'd453: toneL = `c; 
            12'd454: toneL = `c;    12'd455: toneL = `c;
            12'd456: toneL = `la_flat;    12'd457: toneL = `la_flat;
            12'd458: toneL = `la_flat;    12'd459: toneL = `la_flat;
            12'd460: toneL = `la_flat;    12'd461: toneL = `la_flat;
            12'd462: toneL = `la_flat;    12'd463: toneL = `la_flat;
            12'd464: toneL = `sil;    12'd465: toneL = `sil;
            12'd466: toneL = `sil;    12'd467: toneL = `sil;
            12'd468: toneL = `lb_flat;    12'd469: toneL = `lb_flat; 
            12'd470: toneL = `lb_flat;    12'd471: toneL = `lb_flat; 
            12'd472: toneL = `lb_flat;    12'd473: toneL = `lb_flat;
            12'd474: toneL = `lb_flat;    12'd475: toneL = `lb_flat;
            12'd476: toneL = `sil;    12'd477: toneL = `sil;
            12'd478: toneL = `sil;    12'd479: toneL = `sil;
            12'd480: toneL = `c;    12'd481: toneL = `c;
            12'd482: toneL = `c;    12'd483: toneL = `c;
            12'd484: toneL = `c;    12'd485: toneL = `c;
            12'd486: toneL = `c;    12'd487: toneL = `c;
            12'd488: toneL = `c;    12'd489: toneL = `c;
            12'd490: toneL = `c;    12'd491: toneL = `c;
            12'd492: toneL = `c;    12'd493: toneL = `c; 
            12'd494: toneL = `c;    12'd495: toneL = `c;
            12'd496: toneL = `sil;    12'd497: toneL = `sil;
            12'd498: toneL = `sil;    12'd499: toneL = `sil;
            12'd500: toneL = `sil;    12'd501: toneL = `sil;
            12'd502: toneL = `sil;    12'd503: toneL = `sil;
            12'd504: toneL = `sil;   12'd505: toneL = `sil;
            12'd506: toneL = `sil;   12'd507: toneL = `sil;
            12'd508: toneL = `sil;   12'd509: toneL = `sil;
            12'd510: toneL = `sil;   12'd511: toneL = `sil;//

            default : toneL = `sil;
        endcase
    end
endmodule