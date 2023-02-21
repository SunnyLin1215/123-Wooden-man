module Music (
    input clk,
    input rst,
    input [8:0] music,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin
);
//暫停的功能, 靜音，變慢，切換音樂的input，大聲，小聲，升高音階

// Internal Signal
    wire [15:0] audio_in_left, audio_in_right;
    reg [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3
    // clkDiv22
    wire clkDiv22; wire clkDiv21; wire clkDiv23, clk08, clk12;
    clk_divider #(.n(22)) clock_22(.clk(clk), .clk_div(clkDiv22));    // for keyboard and audio, 2,097,152
    clk_divider #(.n(21)) clock_21(.clk(clk), .clk_div(clkDiv21));    //比較快
    clk_divider #(.n(23)) clock_23(.clk(clk), .clk_div(clkDiv23));    //比較慢

    reg [24:0] counter_08;  // 2184533
    reg [24:0] counter_12;  // 1474627
    always @(posedge clk, posedge rst) begin
        if(rst) counter_08 <= 0;
        else begin
            if(counter_08 < 2184533) counter_08 <= counter_08 + 1;
            else counter_08 <= 0;
        end
    end
    assign clk08 = (counter_08== 2184533)  ? 1:0;
    always @(posedge clk, posedge rst) begin
        if(rst) counter_12 <= 0;
        else begin
            if(counter_12 < 1474627) counter_12 <= counter_12 + 1;
            else counter_12 <= 0;
        end
    end
    assign clk12 = (counter_12 == 1474627)  ? 1:0;

    // for multiple songs 
    wire [11:0] ibeatNum_song0;    
    wire [11:0] ibeatNum_song1;     
    wire [11:0] ibeatNum_song2;               // Beat counter
    wire [11:0] ibeatNum_song3;     
    wire [11:0] ibeatNum_song4;   
    wire [11:0] ibeatNum_song5;     
    wire [11:0] ibeatNum_song6;   
    wire [11:0] ibeatNum_song7;   
    wire [11:0] ibeatNum_song8;      

    wire [31:0] freqL_song0, freqR_song0;           // Raw frequency, produced by music module
    wire [31:0] freqL_song1, freqR_song1;           // Raw frequency, produced by music module
    wire [31:0] freqL_song2, freqR_song2;           // Raw frequency, produced by music module
    wire [31:0] freqL_song3, freqR_song3;           // Raw frequency, produced by music module
    wire [31:0] freqL_song4, freqR_song4;           // Raw frequency, produced by music module
    wire [31:0] freqL_song5, freqR_song5;           // Raw frequency, produced by music module
    wire [31:0] freqL_song6, freqR_song6;           // Raw frequency, produced by music module
    wire [31:0] freqL_song7, freqR_song7;           // Raw frequency, produced by music module
    wire [31:0] freqL_song8, freqR_song8;           // Raw frequency, produced by music module

    wire en0, en1, en2, en3, en4, en5, en6, en7, en8;
    wire end1, end2, end3, end4, end5, end6, end7, end8;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            en0 <= 1'b0;
            en1 <= 1'b0;
            en2 <= 1'b0;
            en3 <= 1'b0;
            en4 <= 1'b0;
            en5 <= 1'b0;
            en6 <= 1'b0;
            en7 <= 1'b0;
            en8 <= 1'b0;
        end
        else begin
            en0 <= en0; en1<= en1; en2<= en2; en3<= en3; en4<= en4; en5<= en5; en6<= en6; en7<= en7; en8<= en8;
            if(music[0]==1'b1 || || end0==1'b1) en0 <= ~en0;
            else if(music[1]==1'b1 || end1==1'b1) en1 <= ~en1;
            else if(music[2]==1'b1 || end2==1'b1) en2 <= ~en2;
            else if(music[3]==1'b1 || end3==1'b1) en3 <= ~en3;
            else if(music[4]==1'b1 && en4==1'b0) en4 <= ~en4;
            else if(music[4]==1'b1 && en4==1'b1) en4 <= en4;
            else if(music[5]==1'b1 || end5==1'b1) en5 <= ~en5;
            else if(music[6]==1'b1 || end6==1'b1) en6 <= ~en6;
            else if(music[7]==1'b1 || end7==1'b1) en7 <= ~en7;
            else if(music[8]==1'b1 || end8==1'b1) en8 <= ~en8;
            else begin end
        end
    end

    //確認好順序之後再進行轉頭的動作

    //##################EIGHTH SONG !!!!#############################
    player_control #(.LEN(512)) song8 ( //ending music
        .clk(clkDiv22),
        .reset(rst),
        .en(en8),
        .ibeat(ibeatNum_song8),
        .ending(end8)
    );
    happy_ending h(
        .ibeatNum(ibeatNum_song8),
	    .toneL(freqL_song8), 
        .toneR(freqR_song8)
    );
    //################## SEVENTH SONG !!! ############################
    player_control #(.LEN(256)) song7 ( //wayback
        .clk(clkDiv22),
        .reset(rst),
        .en(en7),
        .ibeat(ibeatNum_song7),
        .ending(end7)
    );
    wayback w (
        .ibeatNum(ibeatNum_song7),
	    .toneL(freqL_song7), 
        .toneR(freqR_song7)
    );
    //############## FIFTH  SONG !!!!!!#######################
    player_control #(.LEN(8)) song5 ( //footstep
        .clk(clkDiv22),
        .reset(rst),
        .en(en5),
        .ibeat(ibeatNum_song5),
        .ending(end5)
    );
    footstep f(
        .ibeatNum(ibeatNum_song5),
	    .toneL(freqL_song5), 
        .toneR(freqR_song5)
    );
    //##################FOURTH SONG !!!!#############################
    /*player_control #(.LEN(10)) song4 ( //kill effect
        .clk(clkDiv22),
        .reset(rst),
        .en(en4),
        .ibeat(ibeatNum_song4),
        .ending(end4)
    );
    kill k(
        .ibeatNum(ibeatNum_song4),
	    .toneL(freqL_song4), 
        .toneR(freqR_song4)
    );*/

    //##################THIRD SONG !!!!#############################
    player_control #(.LEN(112)) song3 ( //123 do not move fatest speed 
        .clk(clkDiv21),
        .reset(rst),
        .en(en3),
        .ibeat(ibeatNum_song3),
        .ending(end3)
    );
    donot_move d_speed20(
        .ibeatNum(ibeatNum_song3),
	    .toneL(freqL_song3), 
        .toneR(freqR_song3)
    );
    /////////////SECOND SONG !!!/////////////////////
    player_control #(.LEN(112)) song2 ( //123 do not move 1.2倍速
        .clk(clk12),
        .reset(rst),
        .en(en2),
        .ibeat(ibeatNum_song2),
        .ending(end2)
    );
    donot_move d_speed12(
        .ibeatNum(ibeatNum_song2),
	    .toneL(freqL_song2), 
        .toneR(freqR_song2)
    );
    ///////////////FIRST SONG !!!//////////////////////////
    player_control #(.LEN(112)) song1 ( //123 do not move 0.8倍速
        .clk(clk08),
        .reset(rst),
        .en(en1),
        .ibeat(ibeatNum_song1),
        .ending(end1)
    );
    donot_move d_speed08(
        .ibeatNum(ibeatNum_song1),
	    .toneL(freqL_song1), 
        .toneR(freqR_song1)
    );
    ///////////// ZEROTH  SONG !!! /////////////
    player_control #(.LEN(112)) song0 ( //123 do not move 0.5倍速
        .clk(clkDiv23),
        .reset(rst),
        .en(en0),
        .ibeat(ibeatNum_song0)
    );
    donot_move d_speed_05 (
        .ibeatNum(ibeatNum_song0),
	    .toneL(freqL_song0), 
        .toneR(freqR_song0)
    );

    // Note gen makes no sound, if freq_out = 50000000 / `silence = 1
    // 放出來聽到的東西 

    always @(*) begin //左聲道
        if(music == 9'b000_000_000) freq_outL = 1;
        else begin
            if(en0) freq_outL = 50000000 / freqL_song0;
            else if (en1)  freq_outL = 50000000 / freqL_song1;
            else if (en2)  freq_outL = 50000000 / freqL_song2;
            else if (en3)  freq_outL = 50000000 / freqL_song3;
            else if (en4)  freq_outL = 50000000 / freqL_song4;
            else if (en5)  freq_outL = 50000000 / freqL_song5;
            else if (en6)  freq_outL = 50000000 / freqL_song6;
            else if (en7)  freq_outL = 50000000 / freqL_song7;
            else if (en8)  freq_outL = 50000000 / freqL_song8;
            else begin end 
        end
    end
     //右聲道
    always @(*) begin
        if(music == 9'b000_000_000) freq_outR = 1;
        else begin
            if(en0) freq_outR = 50000000 / freqR_song0;
            else if(en1) freq_outR = 50000000 / freqR_song1;
            else if(en2) freq_outR = 50000000 / freqR_song2;
            else if(en3) freq_outR = 50000000 / freqR_song3;
            else if(en4) freq_outR = 50000000 / freqR_song4;
            else if(en5) freq_outR = 50000000 / freqR_song5;
            else if(en6) freq_outR = 50000000 / freqR_song6;
            else if(en7) freq_outR = 50000000 / freqR_song7;
            else if(en8) freq_outR = 50000000 / freqR_song8;
            else begin end
        end
    end
    /*
    always @(*) begin
        freq_outL = 50000000 / freqL_song3;
        freq_outR = 50000000 / freqR_song3;
    end
    */


    // Note generation
    // [in]  processed frequency
    // [out] audio wave signal (using square wave here)
    note_gen noteGen_00(
        .clk(clk), 
        .rst(rst), 
        .note_div_left(freq_outL), //input
        .note_div_right(freq_outR),  //input
        .audio_left(audio_in_left),     // left sound audio 大小聲音量
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );

    // try to use good music
    gun_shot g( 
        .rst(rst), 
        .clk(clk), 
        .play(en4), 
        .mclk(audio_mclk), 
        .lrck(audio_lrck), 
        .sck(audio_sck), 
        .sdin(audio_sdin)
    );
    
endmodule