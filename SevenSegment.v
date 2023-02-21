module SevenSegment(
	output reg [6:0] display,
	output reg [3:0] digit,
	input wire [15:0] nums,
	input wire rst,
	input wire clk
    );
    
    reg [15:0] clk_divider;
    reg [3:0] display_num;
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		clk_divider <= 15'b0;
    	end else begin
    		clk_divider <= clk_divider + 15'b1;
    	end
    end
    
    always @ (posedge clk_divider[15], posedge rst) begin
    	if (rst) begin
    		display_num <= 4'b0000;
    		digit <= 4'b1111;
    	end else begin
    		case (digit)
    			4'b1110 : begin
    					display_num <= nums[7:4];
    					digit <= 4'b1101;
    				end
    			4'b1101 : begin
						display_num <= nums[11:8];
						digit <= 4'b1011;
					end
    			4'b1011 : begin
						display_num <= nums[15:12];
						digit <= 4'b0111;
					end
    			4'b0111 : begin
						display_num <= nums[3:0];
						digit <= 4'b1110;
					end
    			default : begin
						display_num <= nums[3:0];
						digit <= 4'b1110;
					end				
    		endcase
    	end
    end
    
    always@* begin                         //update DISPLAY
        case (display_num)
            4'b0000: display = 7'b1000000; // "0"  
            4'b0001: display = 7'b1111001; // "1" 
            4'b0010: display = 7'b0100100; // "2" 
            4'b0011: display = 7'b0110000; // "3" 
            4'b0100: display = 7'b0011001; // "4" 
            4'b0101: display = 7'b0010010; // "5" 
            4'b0110: display = 7'b0000010; // "6" 
            4'b0111: display = 7'b1111000; // "7" 
            4'b1000: display = 7'b0000000; // "8"  
            4'b1001: display = 7'b0010000; // "9" 
            4'b1010: display = 7'b0001000; //A           //還沒改
            4'b1011: display = 7'b0010010; //S
            4'b1100: display = 7'b1000110; //C
            4'b1101: display = 7'b0111111; //-
            4'b1110: display = 7'b1111111;  // nothing
            default: display = 7'b1111111; //nothing
        endcase
    end
    
endmodule
