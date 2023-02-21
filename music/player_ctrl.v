module player_control #(parameter LEN = 256) (
	input clk, 
	input reset, 
    input en,
	output reg [11:0] ibeat,
	output reg ending
);

	always @(posedge clk, posedge reset) begin
		if(reset) ibeat <= 0;
		else begin
			if(ibeat < LEN-1  && en)  ibeat <= ibeat +1;
			else ibeat <= 0;
		end
	end

	always @(posedge clk, posedge reset) begin
		if(reset) ending <= 0;
		else begin
			if(ibeat == LEN-1) ending <= 1;
			else ending <= 0;
		end
	end

endmodule
