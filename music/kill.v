`define sil 32'd50000000 // slience
`define k 32'd69

module kill (
    input [11:0] ibeatNum,
	output reg [31:0] toneL, 
    output reg [31:0] toneR
);

always @(*) begin
    case(ibeatNum)
        12'd0: toneR = `k;
        12'd1: toneR = `k;
        12'd2: toneR = `k;
        12'd3: toneR = `k;
        12'd4: toneR = `sil;
        12'd5: toneR = `sil;
        12'd6: toneR = `k;
        12'd7: toneR = `k;
        12'd8: toneR = `sil;
        12'd9: toneR = `sil;

    default : toneR = `sil;
    endcase
end

always @(*) begin
    case(ibeatNum)
        12'd0: toneL = `k;
        12'd1: toneL = `k;
        12'd2: toneL = `k;
        12'd3: toneL = `k;
        12'd4: toneL = `sil;
        12'd5: toneL = `sil;
        12'd6: toneL = `k;
        12'd7: toneL = `k;
        12'd8: toneL = `sil;
        12'd9: toneL = `sil;
    endcase
end
    
endmodule