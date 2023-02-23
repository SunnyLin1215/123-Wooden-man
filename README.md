# 123-Wooden-man
## 介紹
#### 使用verilog，結合FPGA板、鍵盤、馬達、喇叭、VGA，製作出模擬123木頭人的遊戲。
## 會使用到的 I/O包含：
（1）鍵盤，兩個按鍵
（2）馬達：控制娃娃的頭部轉動
（3）喇叭：木頭人的時候的時候會播放出來聲音
（4）VGA顯示器：顯示遊戲畫面
## 整體設計的示意圖：
![](https://i.imgur.com/BWbHQsQ.png)
## Timeline:
* 開場音樂 -> 唱歌 -> 轉頭檢查 -> 殺掉其他玩家（或是player）-> 轉頭回去
* 對於不同速度的唱歌時間都進行精準的控制，例如，speed1就設定是9.2秒的間隔，speed2（5.6）等等。總共的唱歌時間是45.2 sec
* 固定 0.2秒當做counter 的單位更新
* 唯一會影響時間軸的東西就是兩位玩家的存活狀態，假設其中有一位玩家死掉的話，時間軸就會暫停在同一個位置，處理好死掉玩家的各個變數，再進行timeline剩下的事情。
## 實作code說明
### 整體 module 設計

由於這次的 project 涉及到多個方面的控制，因此我們拆成數個 module 分別對於不同項
目進行控制。主要的 module 如下:

1. Control module : 整個遊戲的核心， 控制整個遊戲的時間軸， 告訴各個 module 要做什麼事。
2. Screen module : 控制 VGA 螢幕。
3. Player_position module: 處理鍵盤相關的事， 並計算兩個 player 狀態， 把 player_die、 player_move、 player_position 等等參數傳回control module。
4. Motor module: 控制馬達。
5. Music module: 控制音樂。

### Control module 設計
#### 1. 和 timeline module 之間的關係 : (timeline module 如下圖)
![](https://i.imgur.com/T608qP6.png)
* time_counter是以 0.2 秒為單位， 也就是說最快 0.2秒， now 的值才會改變。
* Control module 會傳 time_counter 給 timeline module。
* 對不同的 state 編號， 在不同時刻賦予 now 不同的 state 值， 把 now 的值回傳給control module， 讓 control module 知道現在是什麼 state。
* Time_counter 只有在過程中兩個玩家死掉時會停下來， 讓 control module 處理好玩家死掉時要做的事， time_counter 才會繼續往下數。 此外， 也會在計時結束時暫停。
* 相關 code 如下圖
![](https://i.imgur.com/rvIzchb.png)     
黃線的條件會讓 time_counter 停住。

* 因為當 player 死掉時 也會繼續計時，所以計時結束時 timeline 會跑到哪裡是沒辦法先預設好的，要看計時結束前 兩個 player 的存活狀態。
* 計時結束後， timeline module 的 counter 會停住， control module 會傳另一個counter 給 end_timeline module， 讓 end_timeline module 傳計時結束後的state 給 control module。

* 時間軸的詳細內容如下圖 :   (smida 就是指女生面向樹唱歌然後玩家可以往前的時間)
![](https://i.imgur.com/r68F4Qr.png)

#### 2. 和 player_position 之間的關係 : 
Player_position 的 output input 如下圖
![](https://i.imgur.com/yvzgmRF.png)
* Control module 會呼叫 player_position module。
* en 是計時開始到計時結束前都是 1(包括唱 smida 時可以動的時間和沒有唱 simida 時不能動的時間)
* allow 代表在計時開始到計時結束之前，玩家移動了但是不會死的時間， 也就是沒唱 smida 的時間。
* Control module 裡控制 en 、 allow 的 code 如下圖。

![](https://i.imgur.com/OkdTqUE.png)
Now_state >= 3 && now_state <= 6 就是代表在唱 smida 的時間。

* 根據 player_position 回傳的 die、 move、 position 等參數， 可以知道 player 的狀態， 再根據這些參數控制螢幕畫面等等， 詳細內容後面會講。

#### 3. 和 music module 之間的關係 :
* Music module 的 input output 如下圖:
![](https://i.imgur.com/wFHxgSM.png)
* Music 參數的每一個 bit 都代表一種音樂。
* 根據不同的 state， control module 會傳不同的 music 值給 music module。
* Control module 裡控制 music 的 code 如下圖。
![](https://i.imgur.com/P22aVfP.png)
* 為了知道是不是 now_state 是不是剛變某個值， 所以多設一個 last_now_state 來幫助判斷。
#### 4. 和 screen module 之間的關係 :
* Control module 會把所有跟螢幕有關的參數傳給 screen module， 包括剩餘人數、 時間、player1、 player2 的狀態和要顯示的圖片編號… 後面會再詳細解釋。
#### 5. 和 motor module 之間的關係 :
* Control module 只會傳一個 turn 的訊號給 motor module， 且 turn = 1 只會維持一個 clk，讓 motor module 知道現在應該要轉頭。Code 如下圖。
![](https://i.imgur.com/PP6pOCQ.png)
根據 state 的值來判斷 turn要不要等於 1。
* 控制人數:一開始的人數是 45 個， 用 now_state 的值判斷要不要減一， 如果 now_state 的值是代表槍聲(殺人)， 剩餘人數就會減一。
* 控制時間:螢幕畫面上會顯示剩餘的分鐘數和秒數。 因此每 1 秒就會更新一次值。
#### 6. 控制人數和時間 :
* 一開始的人數是 45 個， 用 now_state 的值判斷要不要減一， 如果 now_state 的值是代表槍聲(殺人)， 剩餘人數就會減一。
* 螢幕畫面上會顯示剩餘的分鐘數和秒數。 因此每 1 秒就會更新一次值。

### Player_position module 設計
* 我們的遊戲是讓玩家按越多次鍵盤， 就可以跑越遠的距離。
* 所有可以移動的時間約為 45 秒。 經過實驗，手指極限速度為 45 秒內可以按下約 260次。
* 因此 p1_position 和 p2_position(p1 就是 player1, p2 是 player2)的最大值都設為26， 代表 player 距離終點線的距離。 所以一開始 player position 都等於 26， 每按 9 次鍵盤 player position 會-1。 如下圖。
![](https://i.imgur.com/QMjSYMw.png)

* Player_position module 還會傳 p1_move、 p2_move 給 control module， 代表玩家有沒有在動， 控制的方法是約 0.5 秒內如果 player 有按鍵盤， move 的值就會等於1。

### Screen module 設計
* 在 screen module 裡會加很多 blk_mem_generator， 分別存不同圖片的資料。
* 為了節省空間， 要把所有會顯示在螢幕畫面上的物件截成不同圖片。 因此 screen module 裡面會做的事主要就是根據 vga_controller 傳回來的 v_cnt、 h_cnt 的值判斷應該顯示什麼圖片， 然後計算在該圖片上的 addr 應該是什麼， 把 addr 傳到該圖片的 blk_mem_generator， 就可以知道螢幕在該時刻要顯示什麼顏色。
### Motor module 設計
* 在接受“turn”的訊號時，就開始進行轉頭的動作面向玩家。同理再次接受“turn”的訊號時就會把頭轉回去。運用（ ~）就可以控制旋轉的方向了。
* 如何旋轉 180°？ 運用 counter 計數，從 0 -> 特定數值 -> 0，當 counter== 0 或是==特定數值的時候輸出 motor = IN1=IN2=0，馬達靜止，而當 counter 介於0<counter<特定數值的時候，就輸出相對應的電壓使馬達運轉。
* 上述的特定數值必須要根據實際的情況進行測量才能夠得到最適合的數字。摩擦力、玩偶頭部的重量都會影響到馬達旋轉的表現。
![](https://i.imgur.com/tX7kPF1.png)

### Music module 設計
* 播放完音樂之後， ibeatNum 都會停留在最後一個音符， ibeatnum 其實也就是相當於原本 lab8 裡面的 player_control 的控制。 但是為了與 music 傳入的信號保持一致性，我們將他的控制寫到主要的 module Music 裡面。 當 music 對應的訊號傳進來的時候，我們就將 ibeat 歸零。重頭開始播放。
![](https://i.imgur.com/Vk69BQi.png)

* 額外使用 en 0-8 來控制音樂要不要播放出來與否，當 ibeat==曲子的長度時，我們就讓en = 0,這個時候，就不會聲音的效果跑出來了。
![](https://i.imgur.com/gm2D0t5.png)

* 音效控制的流程設計： ibeatNum 決定現在的樂曲播放到那個段落 -> 每一首歌曲的module會生出相對應的頻率 -> note_gen 會產生與之相對應的振幅 -> speaker_control再根據訊號產生電路的訊號。
