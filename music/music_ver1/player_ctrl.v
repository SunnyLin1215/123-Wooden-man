module player_control #(parameter LEN = 256) (
	input clk, 
	input reset, 
    input en,
	output reg [11:0] ibeat,
	output reg ending
);
    reg [11:0] next_ibeat;

	always @(posedge clk, posedge reset) begin
		if (reset) begin
			ibeat <= 0;
			ending <= 0;
		end 
        else begin
			ending <= ending;

            if(en) ibeat <= next_ibeat;
			else begin
				ibeat <= 0;
				ending <= 0;
			end
		end
	end

    always @* begin
        next_ibeat = (ibeat + 1 < LEN) ? (ibeat + 1) : ibeat;
    end

	always @(*) begin
		ending = (ibeat==LEN) ? 1:0;
	end

endmodule
