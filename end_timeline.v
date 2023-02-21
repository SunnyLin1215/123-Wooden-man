module End_timeline(
    input [5:0] end_counter,
    output reg [3:0] end_now
);

    always@(*) begin
        case(end_counter)
            6'd0: end_now = 4'd0;        6'd1: end_now = 4'd0;
            6'd2: end_now = 4'd0;        6'd3: end_now = 4'd0;
            6'd4: end_now = 4'd0;        6'd5: end_now = 4'd1;
            6'd6: end_now = 4'd2;        6'd7: end_now = 4'd3;
            6'd8: end_now = 4'd2;        6'd9: end_now = 4'd2;
            6'd10: end_now = 4'd2;        6'd11: end_now = 4'd2;
            6'd12: end_now = 4'd3;        6'd13: end_now = 4'd2;
            6'd14: end_now = 4'd2;        6'd15: end_now = 4'd2;
            6'd16: end_now = 4'd2;        6'd17: end_now = 4'd3;
            6'd18: end_now = 4'd2;        6'd19: end_now = 4'd2;
            6'd20: end_now = 4'd2;        6'd21: end_now = 4'd2;
            6'd22: end_now = 4'd3;        6'd23: end_now = 4'd2;
            6'd24: end_now = 4'd2;        6'd25: end_now = 4'd2;
            6'd26: end_now = 4'd2;        6'd27: end_now = 4'd3;
            6'd28: end_now = 4'd2;        6'd29: end_now = 4'd2;
            6'd30: end_now = 4'd2;        6'd31: end_now = 4'd2;
            6'd32: end_now = 4'd2;        6'd33: end_now = 4'd2;
            6'd34: end_now = 4'd2;        6'd35: end_now = 4'd2;
            6'd36: end_now = 4'd2;        6'd37: end_now = 4'd2;
            6'd38: end_now = 4'd4;        default: end_now = 4'd2;
        endcase
    end

endmodule