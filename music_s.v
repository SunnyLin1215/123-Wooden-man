module Music (
    input clk,
    input rst,
    input [8:0] music,
    output reg audio_mclk,
    output reg audio_lrck,
    output reg audio_sck,
    output reg audio_sdin,
    input [7:0] temp
);
    reg [11:0] ibeatNum_song0;    
    reg [11:0] ibeatNum_song1;     
    reg [11:0] ibeatNum_song2;               // Beat counter
    reg [11:0] ibeatNum_song3;    
    reg [11:0] ibeatNum_song4;           
    reg [11:0] ibeatNum_song7; 
    reg [11:0] ibeatNum_song8;
    reg last_clkDiv21, last_clk12, last_clk08, last_clkDiv23, last_clkDiv22;  
    reg en0, en1, en2, en3, en4, en7 ,en8;
    wire clkDiv21, clkDiv22, clkDiv23, clk08, clk12;

    wire [31:0] freqL_song0, freqR_song0;           // Raw frequency, produced by music module
    wire [31:0] freqL_song1, freqR_song1;           // Raw frequency, produced by music module
    wire [31:0] freqL_song2, freqR_song2;           // Raw frequency, produced by music module
    wire [31:0] freqL_song3, freqR_song3;           // Raw frequency, produced by music module
    wire [31:0] freqL_song4, freqR_song4;           // Raw frequency, produced by music module
    wire [31:0] freqL_song5, freqR_song5;           // Raw frequency, produced by music module
    wire [31:0] freqL_song6, freqR_song6;           // Raw frequency, produced by music module
    wire [31:0] freqL_song7, freqR_song7;           // Raw frequency, produced by music module
    wire [31:0] freqL_song8, freqR_song8;           // Raw frequency, produced by music module
    reg [21:0] freqL, freqR;

    wire audio_mclk_from_gun, audio_lrck_from_gun, audio_sck_from_gun, audio_sdin_from_gun;
    wire [15:0] audio_in_left, audio_in_right;
    wire audio_mclk_from_speakerctrl, audio_lrck_from_speakerctrl, audio_sck_from_speakerctrl, audio_sdin_from_speakerctrl;

    clock_divider #(.n(22)) clock_22(.clk(clk), .clk_div(clkDiv22));    // for keyboard and audio, 2,097,152
    clock_divider #(.n(21)) clock_21(.clk(clk), .clk_div(clkDiv21));    //比較快
    clock_divider #(.n(23)) clock_23(.clk(clk), .clk_div(clkDiv23));    //比較
    clock_divider_accur #(5242880) ccc(clk, clk08);
    clock_divider_accur #(3495253) cc2(clk, clk12);

    donot_move d_speed_05 (
        .ibeatNum(ibeatNum_song0),
	    .toneL(freqL_song0), 
        .toneR(freqR_song0)
    );
    donot_move d_speed08(
        .ibeatNum(ibeatNum_song1),
	    .toneL(freqL_song1), 
        .toneR(freqR_song1)
    );
    donot_move d_speed12(
        .ibeatNum(ibeatNum_song2),
	    .toneL(freqL_song2), 
        .toneR(freqR_song2)
    );
    donot_move d_speed20(
        .ibeatNum(ibeatNum_song3),
	    .toneL(freqL_song3), 
        .toneR(freqR_song3)
    );
    kill k(
        .ibeatNum(ibeatNum_song4),
	    .toneL(freqL_song4), 
        .toneR(freqR_song4)
    );
    wayback w (
        .ibeatNum(ibeatNum_song7),
	    .toneL(freqL_song7), 
        .toneR(freqR_song7)
    );
    happy_ending h(
        .ibeatNum(ibeatNum_song8),
	    .toneL(freqL_song8), 
        .toneR(freqR_song8)
    );
    /*
    gun_shot g( 
        .rst(rst), 
        .clk(clk), 
        .play(music[4]), 
        .mclk(audio_mclk_from_gun), 
        .lrck(audio_lrck_from_gun), 
        .sck(audio_sck_from_gun), 
        .sdin(audio_sdin_from_gun),
        .temp(temp),
        .en(en4)
    );
*/
    note_gen noteGen_00(
        .clk(clk), 
        .rst(rst), 
        .note_div_left(freqL), //input
        .note_div_right(freqR),  //input
        .audio_left(audio_in_left),     // left sound audio 大小聲音量
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk_from_speakerctrl),            // master clock
        .audio_lrck(audio_lrck_from_speakerctrl),            // left-right clock
        .audio_sck(audio_sck_from_speakerctrl),              // serial clock
        .audio_sdin(audio_sdin_from_speakerctrl)             // serial audio data input
    );

    speaker_control for_gun(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk_from_speakerctrl),            // master clock
        .audio_lrck(audio_lrck_from_speakerctrl),            // left-right clock
        .audio_sck(audio_sck_from_speakerctrl),              // serial clock
        .audio_sdin(audio_sdin_from_speakerctrl)             // serial audio data input
    );


    always@(posedge clk, posedge rst) begin   //ibeat
        if(rst) begin
            ibeatNum_song0 <= 0;    
            ibeatNum_song1 <= 0;     
            ibeatNum_song2 <= 0;               // Beat counter
            ibeatNum_song3 <= 0;   
            ibeatNum_song4 <= 0;          
            ibeatNum_song7 <= 0; 
            ibeatNum_song8 <= 0;
        end
        else begin
            ibeatNum_song0 <= ibeatNum_song0;    
            ibeatNum_song1 <= ibeatNum_song1;     
            ibeatNum_song2 <= ibeatNum_song2;               // Beat counter
            ibeatNum_song3 <= ibeatNum_song3;   
            ibeatNum_song4 <= ibeatNum_song4;     
            ibeatNum_song7 <= ibeatNum_song7; 
            ibeatNum_song8 <= ibeatNum_song8;

            if(music[0] == 1) ibeatNum_song0 <= 0;  
            else if(music[1] == 1) ibeatNum_song1 <= 0;
            else if(music[2] == 1) ibeatNum_song2 <= 0;
            else if(music[3] == 1) ibeatNum_song3 <= 0;
            else if(music[4] == 1) ibeatNum_song4 <= 0;
            else if(music[7] == 1) ibeatNum_song7 <= 0;
            else if(music[8] == 1) ibeatNum_song8 <= 0;
            else begin
                if(last_clkDiv22 == 0 && clkDiv22 == 1 && en7 == 1) ibeatNum_song7 <= ibeatNum_song7 + 1;
                if(last_clkDiv22 == 0 && clkDiv22 == 1 && en8 == 1) ibeatNum_song8 <= ibeatNum_song8 + 1;
                if(last_clkDiv23 == 0 && clkDiv23 == 1 && en0 == 1) ibeatNum_song0 <= ibeatNum_song0 + 1;
                if(last_clk08 == 0 && clk08 == 1 && en1 == 1) ibeatNum_song1 <= ibeatNum_song1 + 1;
                if(last_clk12 == 0 && clk12 == 1 && en2 == 1) ibeatNum_song2 <= ibeatNum_song2 + 1;
                if(last_clkDiv21 == 0 && clkDiv21 == 1 && en3 == 1) ibeatNum_song3 <= ibeatNum_song3 + 1;
                if(last_clkDiv22 == 0 && clkDiv22 == 1 && en4 == 1) ibeatNum_song4 <= ibeatNum_song4 + 1;
            end
        end
        last_clkDiv21 <= clkDiv21;
        last_clk12 <= clk12;
        last_clk08 <= clk08;
        last_clkDiv23 <= clkDiv23;
        last_clkDiv22 <= clkDiv22;  

    end

    always@(posedge clk, posedge rst) begin
        en0 <= en0;
        en1 <= en1;
        en2 <= en2;
        en3 <= en3;
        en4 <= en4;
        en7 <= en7;
        en8 <= en8;
        if(rst) begin
            en0 <= 0;
            en1 <= 0;
            en2 <= 0;
            en3 <= 0;
            en4 <= 0;
            en7 <= 0;
            en8 <= 0;
        end
        else if(music[0] == 1) en0 <= 1;
        else if(music[1] == 1) en1 <= 1;
        else if(music[2] == 1) en2 <= 1;
        else if(music[3] == 1) en3 <= 1;
        else if(music[4] == 1) en4 <= 1;
        else if(music[7] == 1) en7 <= 1;
        else if(music[8] == 1) en8 <= 1;
        else begin
            if(ibeatNum_song0 >= 111) en0 <= 0;
            if(ibeatNum_song1 >= 111) en1 <= 0;
            if(ibeatNum_song2 >= 111) en2 <= 0;
            if(ibeatNum_song3 >= 111) en3 <= 0;
            if(ibeatNum_song4 >= 9) en4 <= 0;
            if(ibeatNum_song7 >= 255) en7 <= 0;
            if(ibeatNum_song8 >= 511) en8 <= 0;
        end
    end
    
    always@* begin
        if(rst) begin
            freqL = 1;
            freqR = 1;
        end
        else begin
            if(en0 == 1) begin
                freqL = 50000000 / freqL_song0;
                freqR = 50000000 / freqR_song0;
            end
            else if(en1 == 1) begin
                freqL = 50000000 / freqL_song1;
                freqR = 50000000 / freqR_song1;
            end
            else if(en2 == 1) begin
                freqL = 50000000 / freqL_song2;
                freqR = 50000000 / freqR_song2;
            end
            else if(en3 == 1) begin
                freqL = 50000000 / freqL_song3;
                freqR = 50000000 / freqR_song3;
            end
            else if(en4 == 1) begin
                freqL = 50000000 / freqL_song4;
                freqR = 50000000 / freqR_song4;
            end
            else if(en7 == 1) begin
                freqL = 50000000 / freqL_song7;
                freqR = 50000000 / freqR_song7;
            end
            else if(en8 == 1) begin
                freqL = 50000000 / freqL_song8;
                freqR = 50000000 / freqR_song8;
            end
            else begin
                freqL = 1;
                freqR = 1;
            end
        end
    end

    always@* begin
        audio_mclk = audio_mclk_from_speakerctrl;
        audio_lrck = audio_lrck_from_speakerctrl;
        audio_sck = audio_sck_from_speakerctrl;
        audio_sdin = audio_sdin_from_speakerctrl;
    end

endmodule