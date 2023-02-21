module Final_project(
    input clk,
    input rst,
    inout PS2_DATA,   // Keyboard I/O
    inout PS2_CLK,    // Keyboard I/O
    output audio_mclk,   //sound
    output audio_lrck, 
    output audio_sck, 
    output audio_sdin, 
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output IN1,
    output IN2,
    output pwm,
    output wire [6:0] DISPLAY,
	output wire [3:0] DIGIT);


    wire [11:0] data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12;
    wire [3:0] now_state;
    wire allow, en, turn;
    wire [8:0] music;
    
    wire [7:0] temp;   
     
    wire p1_move, p2_move, p1_die, p2_die;
    wire [4:0] p1_pos, p2_pos;

    Control s1( 
        .clk(clk), 
        .rst(rst), 
        .p1_move(p1_move), 
        .p2_move(p2_move), 
        .p1_die(p1_die), 
        .p2_die(p2_die), 
        .p1_pos(p1_pos), 
        .p2_pos(p2_pos),    

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

        .en(en), 
        .allow(allow), 
        .music(music), 
        .turn(turn), 
        .vgaRed(vgaRed), 
        .vgaGreen(vgaGreen), 
        .vgaBlue(vgaBlue), 
        .hsync(hsync), 
        .vsync(vsync),
        .now_state(now_state));


    Player_position p1(clk, rst, en, allow, PS2_DATA, PS2_CLK, p1_move, p2_move, p1_die, p2_die, p1_pos, p2_pos);    //done

    Music m1(clk, rst, music, audio_mclk, audio_lrck, audio_sck, audio_sdin, temp);

    Motor m2(clk, rst, turn, IN1, IN2, pwm);

    wire [15:0] nums;

    assign nums = {12'b0, now_state};

    SevenSegment(DISPLAY,DIGIT,nums,rst, clk);
endmodule
