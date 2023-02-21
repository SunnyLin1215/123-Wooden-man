module Screen(
    input clk,
    input rst,
    input black,
    input [3:0] sec1,
    input [3:0] sec0,
    input minute,
    input [3:0] remain1,
    input [3:0] remain0,
    input [4:0] p1_pos,
    input [4:0] p2_pos,
    input [2:0] p1_pic,     //0 die, 1 left, 2 mid, 3 right, 4 mid
    input [2:0] p2_pic,
    input [1:0] p1_cond,
    input [1:0] p2_cond,

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

    output wire [3:0] vgaRed, 
    output wire [3:0] vgaGreen, 
    output wire [3:0] vgaBlue,
    output hsync, 
    output vsync


);

    wire clk_25MHz;

    wire [16:0] remain_addr, time_addr, num_addr;
    reg [16:0] player_addr, word_addr;
    reg [11:0] pixel;
    wire [11:0] pixel_num, pixel_g1, pixel_g2, pixel_g3, pixel_gdie, pixel_rdie, pixel_r1, pixel_r2, pixel_r3;
    wire [11:0] pixel_die, pixel_survive, pixel_remain, pixel_time;


    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    wire [9:0] hcnt, vcnt;
    reg [9:0] num_hcnt, num_vcnt;

    reg [3:0] show_num = 0;
    reg isnumber = 0;
    reg [1:0] addr_player;
    reg [9:0] red_line_vcnt;
    reg [11:0] word_pixel, player_pixel;
    reg isred_line = 0;

    reg [3:0] p = 8;     // not player
    reg [1:0] word = 0;

    clock_divider #(2)( clk, clk_25MHz);

    blk_mem_gen_num num(
        .clka(clk_25MHz),
        .wea(0),
        .addra(num_addr),
        .dina(data0[11:0]),
        .douta(pixel_num)
    ); 
    blk_mem_gen_gdie g0(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data1[11:0]),
        .douta(pixel_gdie)
    );
    blk_mem_gen_gleft g1(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data2[11:0]),
        .douta(pixel_g1)
    );
    blk_mem_gen_gmid g2(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data3[11:0]),
        .douta(pixel_g2)
    );
    blk_mem_gen_gright g3(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data4[11:0]),
        .douta(pixel_g3)
    );

    blk_mem_gen_rdie r0(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data5[11:0]),
        .douta(pixel_rdie)
    );
    blk_mem_gen_rleft r1(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data6[11:0]),
        .douta(pixel_r1)
    );
    blk_mem_gen_rmid r2(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data7[11:0]),
        .douta(pixel_r2)
    );
    blk_mem_gen_rright r3(
        .clka(clk_25MHz),
        .wea(0),
        .addra(player_addr),
        .dina(data8[11:0]),
        .douta(pixel_r3)
    );

    blk_mem_gen_die dd(
        .clka(clk_25MHz),
        .wea(0),
        .addra(word_addr),
        .dina(data9[11:0]),
        .douta(pixel_die)
    );

    blk_mem_gen_survive ss(
        .clka(clk_25MHz),
        .wea(0),
        .addra(word_addr),
        .dina(data10[11:0]),
        .douta(pixel_survive)
    );
    blk_mem_gen_remain rre(
        .clka(clk_25MHz),
        .wea(0),
        .addra(remain_addr),
        .dina(data11[11:0]),
        .douta(pixel_remain)
    );
    blk_mem_gen_time ti(
        .clka(clk_25MHz),
        .wea(0),
        .addra(time_addr),
        .dina(data12[11:0]),
        .douta(pixel_time)
    );

    vga_controller   vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel: 12'h0;
    assign hcnt = h_cnt >> 1;
    assign vcnt = v_cnt >> 1;


    
    always@* begin
        if(rst) begin
            isnumber = 0;
            show_num = 0;
            num_hcnt = 0;
            num_vcnt = 0;
        end
        else begin
            if(hcnt <= 160 && vcnt <= 35 && vcnt >= 12) begin
                if(hcnt >= 23 && hcnt <= 38) begin
                    num_hcnt = hcnt - 20;
                    num_vcnt = vcnt - 12;
                    isnumber = 1;
                    show_num = 0;
                end
                else if(hcnt >= 47 && hcnt <= 63) begin
                    num_hcnt = hcnt - 45;
                    num_vcnt = vcnt - 12;
                    isnumber = 1;
                    show_num = minute;
                end
                else if(hcnt >= 97 && hcnt <= 113) begin
                    num_hcnt = hcnt - 95;
                    num_vcnt = vcnt - 12;
                    isnumber = 1;
                    show_num = sec1;
                end
                else if(hcnt >= 123 && hcnt <= 137) begin
                    num_hcnt = hcnt - 120;
                    num_vcnt = vcnt - 12;
                    isnumber = 1;
                    show_num = sec0;
                end else isnumber = 0;
            end
            
            else if(hcnt >= 161 && vcnt >= 9 && vcnt <= 32) begin
                if( hcnt >= 266 && hcnt <= 285) begin
                    num_hcnt = hcnt - 265;
                    num_vcnt = vcnt - 9;
                    isnumber = 1;
                    show_num = remain1;
                end
                else if(hcnt >= 285 && hcnt <= 305) begin
                    num_hcnt = hcnt - 285;
                    num_vcnt = vcnt - 9;
                    isnumber = 1;
                    show_num = remain0;
                end
                else isnumber = 0;
            end else isnumber = 0;
        end
    end  

    assign num_addr = (num_vcnt * 201 + num_hcnt + (show_num*20) ) % 5226; 




    always@* begin
        if(hcnt <= 160) begin
            red_line_vcnt = 190 - 5*p1_pos;
        end
        else begin
            red_line_vcnt = 190 - 5*p2_pos;
        end
    end

    always@* begin
        if(vcnt >= red_line_vcnt - 1 && vcnt <= red_line_vcnt + 1) isred_line = 1;
        else isred_line = 0;
    end

    always@* begin
        if(hcnt <= 160) begin
            if(p1_pic == 0 && hcnt >= 27 && hcnt <= 128 && vcnt >= 136 && vcnt <= 214) begin
                player_addr = ((vcnt - 136)*110 + (hcnt - 20))%8580;
                p = 0;
            end
            else if(p1_pic == 1 && hcnt >= 32 && hcnt <= 128 && vcnt >= 80 && vcnt <= 225) begin    //left
                player_addr = ((vcnt - 80)*105 + (hcnt - 25)) % 14700;
                p = 1;
            end
            else if( (p1_pic == 2 || p1_pic == 4) && hcnt >= 32 && hcnt <= 133 && vcnt >= 80 && vcnt <= 210) begin //mid
                player_addr = ((vcnt - 80)*110 + (hcnt - 25)) % 14300;
                p = 2;
            end
            else if(p1_pic == 3 && hcnt >= 33 && hcnt <= 130 && vcnt >= 84 && vcnt <= 225) begin
                player_addr = ((vcnt - 84)*105 + (hcnt - 28)) % 14805;
                p = 3;
            end
            else p = 8;
        end else begin
            if(p2_pic == 0 && hcnt >= 199 && hcnt <= 306 && vcnt >= 133 && vcnt <= 217) begin
                player_addr = ((vcnt - 133)*121 + (hcnt - 187)) % 10164;
                p = 4;
            end
            else if(p2_pic == 1 && hcnt >= 198 && hcnt <= 297 && vcnt >= 85 && vcnt <= 232) begin    //left
                player_addr = ((vcnt - 85)*107 + (hcnt - 192)) % 15729;
                p = 5;
            end
            else if( (p2_pic == 2 || p2_pic == 4) && hcnt >= 196 && hcnt <= 296 && vcnt >= 88 && vcnt <= 219) begin //mid
                player_addr = ((vcnt - 88)*110 + (hcnt - 188)) % 14410;
                p = 6;
            end
            else if(p2_pic == 3 && hcnt >= 206 && hcnt <= 302 && vcnt >= 86 && vcnt <= 216) begin
                player_addr = ((vcnt - 86)*104 + (hcnt - 198)) % 14872;
                p = 7;
            end else p = 8;
        end
    end

    always @* begin
        if(hcnt <= 160) begin
            if(p1_cond == 0) word = 0;
            else if(p1_cond == 1 && hcnt >= 31 && hcnt <= 129 && vcnt >= 106 && vcnt <= 134) begin    //survive
                word = 1;
                word_addr = ((vcnt - 106)*98 + (hcnt - 31)) % 2842;
            end
            else if(p1_cond == 2 && hcnt >= 65 && hcnt <= 98 && vcnt >= 107 && vcnt <= 133) begin     //die
                word = 2;
                word_addr = ((vcnt - 107)*37 + (hcnt - 62)) % 999;
            end
            else word = 0;
        end 
        else begin
            if(p2_cond == 0) word = 0;
            else if(p2_cond == 1 && hcnt >= 191 && hcnt <= 289 && vcnt >= 106 && vcnt <= 134) begin
                word = 1;
                word_addr = ((vcnt - 106)*98 + (hcnt - 191)) % 2842;
            end
            else if(p2_cond == 2 && hcnt >= 224 && hcnt <= 258 && vcnt >= 107 && vcnt <= 133) begin
                word = 2;
                word_addr = ((vcnt - 107)*37 + (hcnt - 222)) % 999;
            end
            else word = 0;
        end
    end

    assign time_addr = ((vcnt - 7)*133 + (hcnt - 13)) % 4522;
    assign remain_addr = ((vcnt - 10)*80 + (hcnt - 187)) % 1680;


    always@* begin
        if(black) pixel = 12'h0;
        else if(hcnt >= 158 && hcnt <= 163) pixel = 12'h811;
        else if(isnumber) begin
            if(pixel_num == 12'hfff) begin
                if(hcnt <= 160) pixel = pixel_time;
                else pixel = 12'hfe8;   //yellow background
            end
            else pixel = pixel_num;
        end
        else if(hcnt >= 13 && hcnt <= 146 && vcnt >= 7 && vcnt <= 41) pixel = pixel_time;
        else if(hcnt >= 187 && hcnt <= 267 && vcnt >= 10 && vcnt <= 31) begin
            if(pixel_remain == 12'hfff) pixel = 12'hfe8;
            else pixel = pixel_remain;
        end
        else if(word == 1 && pixel_survive != 12'hfff) pixel = pixel_survive;
        else if(word == 2 && pixel_die != 12'hfff) pixel = pixel_die;
        else begin
            case(p)
                0: begin
                    if(pixel_gdie[3:0] >= 4'hc && pixel_gdie[3:0] <= 4'hf && pixel_gdie[7:4] >= 4'h7 && pixel_gdie[7:4] <= 4'ha && pixel_gdie[11:8] >= 4'he && pixel_gdie[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_gdie == 12'ha97 || pixel_gdie == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_gdie;
                    end
                    else pixel = pixel_gdie;
                end
                1: begin
                    if(pixel_g1[3:0] >= 4'hc && pixel_g1[3:0] <= 4'hf && pixel_g1[7:4] >= 4'h7 && pixel_g1[7:4] <= 4'ha && pixel_g1[11:8] >= 4'he && pixel_g1[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end 
                    else if(pixel_g1 == 12'ha97 || pixel_g1 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_g1;
                    end
                    else pixel = pixel_g1;
                    
                end
                2: begin
                    if(pixel_g2[3:0] >= 4'hc && pixel_g2[3:0] <= 4'hf && pixel_g2[7:4] >= 4'h7 && pixel_g2[7:4] <= 4'ha && pixel_g2[11:8] >= 4'he && pixel_g2[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_g2 == 12'ha97 || pixel_g2 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_g2;
                    end
                    else pixel = pixel_g2;
                end
                3: begin
                    if(pixel_g3[3:0] >= 4'hc && pixel_g3[3:0] <= 4'hf && pixel_g3[7:4] >= 4'h7 && pixel_g3[7:4] <= 4'ha && pixel_g3[11:8] >= 4'he && pixel_g3[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_g3 == 12'ha97 || pixel_g3 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_g3;
                    end
                    else pixel = pixel_g3;
                end
                4: begin
                    if(pixel_rdie[3:0] >= 4'hc && pixel_rdie[3:0] <= 4'hf && pixel_rdie[7:4] >= 4'h7 && pixel_rdie[7:4] <= 4'ha && pixel_rdie[11:8] >= 4'he && pixel_rdie[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_rdie == 12'ha97 || pixel_rdie == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_rdie;
                    end
                    else pixel = pixel_rdie;
                end
                5: begin
                    if(pixel_r1[3:0] >= 4'hc && pixel_r1[3:0] <= 4'hf && pixel_r1[7:4] >= 4'h7 && pixel_r1[7:4] <= 4'ha && pixel_r1[11:8] >= 4'he && pixel_r1[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_r1 == 12'ha97 || pixel_r1 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_r1;
                    end
                    else pixel = pixel_r1;
                end
                6: begin
                    if(pixel_r2[3:0] >= 4'hc && pixel_r2[3:0] <= 4'hf && pixel_r2[7:4] >= 4'h7 && pixel_r2[7:4] <= 4'ha && pixel_r2[11:8] >= 4'he && pixel_r2[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_r2 == 12'ha97 || pixel_r2 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_r2;
                    end
                    else pixel = pixel_r2;
                    
                end
                7: begin
                    if(pixel_r3[3:0] >= 4'hc && pixel_r3[3:0] <= 4'hf && pixel_r3[7:4] >= 4'h7 && pixel_r3[7:4] <= 4'ha && pixel_r3[11:8] >= 4'he && pixel_r3[11:8] <= 4'hf) begin   //pink
                        if(isred_line) pixel = 12'hc33;
                        else pixel = 12'hfe8;
                    end else if(pixel_r3 == 12'ha97 || pixel_r3 == 12'ha87) begin
                        if(isred_line) pixel = 12'h811;
                        else pixel = pixel_r3;
                    end
                    else pixel = pixel_r3; 
                end
                8: begin
                    if(isred_line) pixel = 12'hc33;
                    else pixel = 12'hfe8;
                end
            endcase
        end     
    end

endmodule

