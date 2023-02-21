module Control(
    input clk, 
    input rst, 
    input p1_move, 
    input p2_move, 
    input p1_die,  
    input p2_die, 
    input [4:0] p1_pos, 
    input [4:0] p2_pos, 

    input [11:0] data0,// <- input
    input [11:0] data1,
    input [11:0] data2,
    input [11:0] data3,
    input [11:0] data4,
    input [11:0] data5,
    input [11:0] data6,
    input [11:0] data7,
    input [11:0] data8,
    input [11:0] data9,
    input [11:0] data10,
    input [11:0] data11,
    input [11:0] data12,

    output reg en,              //when time is counting
    output reg allow,           //only when singing smida
    output reg [8:0] music, 
    output reg turn,      //for motor
    output wire [3:0] vgaRed, 
    output wire [3:0] vgaGreen, 
    output wire [3:0] vgaBlue, 
    output hsync, 
    output vsync,
    output wire [3:0] now_state
);

    //wire [3:0] now_state;
    reg [3:0] last_state;
    reg [9:0] time_counter = 0;

    reg head_front = 0;

    reg black = 0;      //only the very end of game
    reg [3:0] sec1 = 4'd4;
    reg [3:0] sec0 = 4'd5;
    reg minute = 1;
    reg [3:0] remain1 = 4;
    reg [3:0] remain0 = 0;
    reg [2:0] p1_pic = 1, p2_pic = 1;     //0 die, 1 left, 2 mid, 3 right, 4 mid
    reg [1:0] p1_cond = 0, p2_cond = 0;   //0 nothing 1 survive 2 die

    reg time_end = 0;
    reg time_start = 0;

    wire [3:0] end_state;    //nothing
    reg [3:0] last_end_state;
    reg [5:0] end_counter = 0;
    reg flag = 0;

    reg [3:0] p1_die_state = 0, p2_die_state = 0, last_p1_die_state = 0, last_p2_die_state = 0;
    reg p1_die_process = 0, p2_die_process = 0;
    
    wire clk_point2_sec;
    wire clk_1sec, clk_point4_sec;


    initial begin
        allow = 0;  
        en = 0;    
        music = 9'b000000000;
        turn = 0;
    end

    clock_divider_accur #(30'd20000000) c1(clk, clk_point2_sec);
    clock_divider_accur #(30'd100000000) c2(clk, clk_1sec);
    clock_divider_accur #(30'd40000000) c3(clk, clk_point4_sec);

    Timeline t(
        .time_counter(time_counter),
        .now(now_state)
    );
    End_timeline t2(
        .end_counter(end_counter),
        .end_now(end_state)
    );

    Screen s(
        .clk(clk),
        .rst(rst),
        .black(black),
        .sec1(sec1),
        .sec0(sec0),
        .minute(minute),
        .remain1(remain1),
        .remain0(remain0),
        .p1_pos(p1_pos),
        .p2_pos(p2_pos),
        .p1_pic(p1_pic),
        .p2_pic(p2_pic),
        .p1_cond(p1_cond),
        .p2_cond(p2_cond),

        .data0(data0),// <- input
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .data8(data8),
        .data9(data9),
        .data10(data10),
        .data11(data11),
        .data12(data12),

        .vgaRed(vgaRed), 
        .vgaGreen(vgaGreen), 
        .vgaBlue(vgaBlue),
        .hsync(hsync), 
        .vsync(vsync)
    );
    
    always@* begin
        if(rst) en = 0;

        if(time_start == 1 && time_end == 0) begin
            en = 1;
        end
        else en = 0;
    end

    always @* begin
        if(rst) allow = 0;  
        else if(now_state >= 3 && now_state <= 6) allow = 1;
        else allow = 0;
    end

    
    always @* begin
        if(rst) begin
            time_start <= 0;
        end
        else if(now_state == 2) time_start <= 1;
        else time_start <= time_start;
    end

    always @(posedge clk_1sec, posedge rst) begin
        if(rst) begin
            sec0 <= 5;
            sec1 <= 4;
            minute <=  1;
        end
        else begin
            sec0 <= sec0;
            sec1 <= sec1;
            minute <=  minute;
            if(time_start == 1 && time_end == 0) begin
                if(sec0 > 0) sec0 <= sec0 - 1;
                else begin
                    sec0 <= 9;
                    if(sec1 > 0) sec1 <= sec1 - 1;
                    else begin
                        sec1 <= 5;
                        minute <= 0;
                    end
                end
            end else begin end
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) time_end <= 0;
        else if(sec1 == 0 && sec0 == 0 && minute == 0) time_end <= 1;
        else time_end <= time_end;
    end

    always @(posedge clk_point2_sec, posedge rst) begin
        if(rst) time_counter <= 0;
        else if(p1_die_process == 1 || p2_die_process == 1) begin
            time_counter <= time_counter;
        end
        else if(time_end == 1) begin
            time_counter <= time_counter;
        end
        else if(time_counter == 10'd582) time_counter <= time_counter;
        else time_counter <= time_counter + 1;
    end

    always @(posedge clk_point2_sec, posedge rst) begin
        if(rst) end_counter <= 0;
        else if(p1_die_process == 1 || p2_die_process == 1) begin
            end_counter <= end_counter;
        end
        else if(time_end == 0) begin
            end_counter <= end_counter;
        end
        else if(end_counter == 6'd38) end_counter <= end_counter;
        else end_counter <= end_counter + 1;
    end


    always@* begin
        if(rst) flag = 0;
        else if(end_state == 1) flag = 1;
        else flag = flag;
    end

    always @* begin
        if(rst) begin
            p1_die_process = 0;
            p2_die_process = 0;
        end
        else begin
            if(p1_die == 1 && p1_die_state != 4) p1_die_process = 1;
            else if(p1_die == 0 && p1_pos != 0 && flag && p1_die_state != 4) p1_die_process = 1;
            else p1_die_process = 0;

            if(p2_die == 1 && p2_die_state != 4) p2_die_process = 1;
            else if(p2_die == 0 && p2_pos != 0 && flag && p2_die_state != 4) p2_die_process = 1;
            else p2_die_process = 0;
        end
    end

    always @(posedge clk_point4_sec, posedge rst) begin
        if(rst) begin
            p1_die_state <= 0;
            p2_die_state <= 0;
        end
        else begin
            if(p1_die_process == 1)  p1_die_state <= p1_die_state + 1;
            else p1_die_state <= p1_die_state;
            if(p2_die_process == 1)  p2_die_state <= p2_die_state + 1;
            else p2_die_state <= p2_die_state;    
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) music <= 9'b000000000;
        else begin
            music <= 9'b000000000;
            if(now_state == 1 && last_state == 8) music <= 9'b0_1000_0000;     //開場音樂
            else if(now_state == 3 && last_state != 3) music <= 9'b00000_0001;   //speed slowest
            else if(now_state == 4 && last_state != 4) music <= 9'b00000_0010;   //speed1
            else if(now_state == 5 && last_state != 5) music <= 9'b00000_0100;   //speed2
            else if(now_state == 6 && last_state != 6) music <= 9'b00000_1000;   //speed fastest
            else if(now_state == 7 && last_state != 7) music[4] <= 1;    //gun
            else begin end

            if((p1_die_state == 1 && last_p1_die_state == 0)|| (p2_die_state == 1 && last_p2_die_state  == 0)) music[4] <= 1;    //gun
            if(p1_move || p2_move) music[5] <= 1;         //walk_sound
            
            if(end_state == 3 && last_end_state != 3) music[4] <= 1;    //gun
            else if(end_state == 4 && last_end_state != 4) music <= 9'b10000_0000;    //round1
            else begin end           
        end
        last_state <= now_state;
        last_end_state <= end_state;
        last_p1_die_state <= p1_die_state;
        last_p2_die_state <= p2_die_state;
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            remain0 <= 0;
            remain1 <= 4;
        end
        else if( (now_state == 7 && last_state != 7) || 
            ((p1_die_state == 1 && last_p1_die_state == 0)|| (p2_die_state == 1 && last_p2_die_state  == 0)) ||
            (end_state == 3 && last_end_state != 3)) begin
            if(remain0 > 0) remain0 <= remain0 - 1;
            else begin
                remain0 <= 9;
                remain1 <= remain1 - 1;
            end
        end
        else begin
            remain0 <= remain0;
            remain1 <= remain1;
        end
    end

    always@(posedge clk_point2_sec, posedge rst) begin
        if(rst) begin
            p1_pic <= 1;
            p2_pic <= 1;
        end
        else begin
            if(p1_pic == 0 || p1_die_state == 2) p1_pic <= 0;   //die
            else if(en && p1_move) begin
                if(p1_pic == 4) p1_pic <= 1;
                else p1_pic <= p1_pic + 1;
            end else p1_pic <= p1_pic;

            if(p2_pic == 0 || p2_die_state == 2) p2_pic <= 0;   //die
            else if(en && p2_move) begin
                if(p2_pic == 4) p2_pic <= 1;
                else p2_pic <= p2_pic + 1;
            end else p2_pic <= p2_pic;
        end
    end

    always@* begin
        if(rst) begin
            p1_cond = 0;
            p2_cond = 0;
        end
        else begin
            if(p1_die_state >= 3) p1_cond = 2;    //die
            else if(p1_pos == 0) p1_cond = 1;
            else p1_cond = 0;

            if(p2_die_state >= 3) p2_cond = 2;    //die
            else if(p2_pos == 0) p2_cond = 1;
            else p2_cond = 0;
        end
    end

    always @* begin
        if(rst) black = 0;
        else if(end_state == 4) black = 1;
        else black = 0;
    end

    always@(posedge clk, posedge rst) begin
        if(rst) begin
            turn <= 0;
            head_front <= 0;
        end
        else begin
            if(now_state >= 3 && now_state <= 6 && last_state != now_state) begin
                turn <= 1;
                head_front <= 1;
            end
            else if(last_state >= 3 && last_state <= 6 && last_state != now_state) begin
                turn <= 1;
                head_front <= 0;
            end
            else if(time_end && head_front == 0) begin
                turn <= 1;
                head_front <= 1;
            end
            else turn <= 0;
        end
    end


endmodule

