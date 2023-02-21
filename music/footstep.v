`define low 32'd 10
`define sil 32'd50000000 // slience

module footstep (
    input [11:0] ibeatNum,
	output reg [31:0] toneL, 
    output reg [31:0] toneR
);

always @(*) begin
    case(ibeatNum)
        12'd0: toneR = `low;
        12'd1: toneR = `low;
        12'd2: toneR = `low;
        12'd3: toneR = `low;
        12'd4: toneR = `sil;
        12'd5: toneR = `sil;
        12'd6: toneR = `sil;
        12'd7: toneR = `sil;

    default : toneR = `sil;
    endcase
end

always @(*) begin
    case(ibeatNum)
        
        12'd0: toneL = `sil;
        12'd1: toneL = `sil;
        12'd2: toneL = `sil;
        12'd3: toneL = `sil;
        12'd4: toneL = `low;
        12'd5: toneL = `low;
        12'd6: toneL = `low;
        12'd7: toneL = `low;
    default : toneL = `sil;
    endcase
end

endmodule