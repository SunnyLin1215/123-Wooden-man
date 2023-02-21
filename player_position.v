module Player_position(
    input clk,
    input rst, 
    input en,    
    input allow,     //move will die
    inout PS2_DATA, 
    inout PS2_CLK, 
    output reg p1_move, 
    output reg p2_move, 
    output reg p1_die, 
    output reg p2_die,  
    output reg [4:0] p1_pos, //from 26 to 0, distance between the player and the finish line
    output reg [4:0] p2_pos);


    reg [1:0] key_num, key, last_key;
    wire [511:0] key_down;    //keyboard
    wire [8:0] last_change;
    wire been_ready;

    reg [5:0] p1_counter = 0, p2_counter = 0;

    wire clk_26;
    reg last_clk_26;
    reg p1_flag = 0, p2_flag = 0;


    initial begin
        p1_move = 0;
        p2_move = 0;
        p1_die = 0;
        p2_die = 0;
        p1_pos = 5'd26;
        p2_pos = 5'd26;
    end

    clock_divider #(24) c1(clk, clk_26);
    
    KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)               
    );

    always @ (*) begin
		case (last_change)
			9'h15 : key_num = 2'b01;  //Q
			9'h4D : key_num = 2'b10;  //P
			default: key_num = 2'b00;
		endcase
	end

    always @ (posedge clk) begin   //update key
        key <= 2'b00;    //nothing pressed or invalid
        if (been_ready && key_down[last_change] == 1'b1) begin
            key <= key_num;
        end
    end

    always @(posedge clk, posedge rst) begin //update p1_counter, p2_counter, p1_pos, p2_pos
        if(rst) begin
            p1_pos <= 5'd26;
            p2_pos <= 5'd26;
            p1_counter <= 0;
            p2_counter <= 0;
        end
        else begin
            p1_pos <= p1_pos;
            p2_pos <= p2_pos;
            p1_counter <= p1_counter;
            p2_counter <= p2_counter;
            if(allow && en) begin
                if(key == 2'b01 && last_key == 2'b00 && p1_pos > 0 && p1_die == 0) begin
                    if(p1_counter == 9) begin
                        p1_counter <= 0;
                        p1_pos <= p1_pos - 1;
                    end
                    else p1_counter <= p1_counter + 1;
                end 
                else if(key == 2'b10 && last_key == 2'b00 && p2_pos > 0 && p2_die == 0) begin
                    if(p2_counter == 9) begin
                        p2_counter <= 0;
                        p2_pos <= p2_pos - 1;
                    end
                    else p2_counter <= p2_counter + 1;
                end
                else begin end
            end else begin end
        end
        last_key <= key;
    end

    always@* begin
        if(rst) begin
            p1_die = 0;
            p2_die = 0;
        end
        else if(en == 1 && allow == 0) begin
            if(key == 2'b01) p1_die = 1;
            else if(key == 2'b10) p2_die = 1;
            else begin end
        end
        else begin end
    end

    always @ (posedge clk, posedge rst) begin    //p1_move, p2_move
        p1_flag <= p1_flag;
        p2_flag <= p2_flag;
        p1_move <= p1_move;
        p2_move <= p2_move;
        if(rst) begin
            p1_move <= 0;
            p2_move <= 0;
        end
        else begin
            if(allow && en) begin
                if(key == 2'b01 && last_key == 2'b00 && p1_pos > 0 && p1_die == 0) begin
                    p1_flag <= 1;
                end
                else if(key == 2'b10 && last_key == 2'b00 && p2_pos > 0 && p2_die == 0) begin
                    p2_flag <= 1;
                end else begin end
            end

            if(last_clk_26 == 0 && clk_26 == 1) begin
                if(p1_flag == 1) p1_move <= 1;
                else p1_move <= 0;

                if(p2_flag == 1) p2_move <= 1;
                else p2_move <= 0;
                
                p1_flag <= 0;
                p2_flag <= 0;
            end
            else begin end
        end
        last_clk_26 <= clk_26;
    end

endmodule

