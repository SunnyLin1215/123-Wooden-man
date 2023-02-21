module Motor (
    input clk,
    input rst,
    input turn, // 下達轉頭的指令
    output IN1,
    output IN2,
    output pwm
    // You may modify or add more input/ouput yourself.
);
    
    motor A(
        .clk(clk),
        .rst(rst),
        .turn(turn),
        .pwm(pwm),
        .l_IN({IN1, IN2})
    );

endmodule

// This module take "mode" input and control two motors accordingly.
// clk should be 100MHz for PWM_gen module to work correctly.
// You can modify / add more inputs and outputs by yourself.


module motor(
    input clk,
    input rst,
    input turn,
    output  pwm,
    output reg [1:0] l_IN
);

    reg [9:0]next_left_motor;
    reg [9:0]left_motor;
    wire left_pwm;

    motor_pwm m0(clk, rst, left_motor, left_pwm);
    assign pwm = left_pwm;

    reg turn_to;

    always @(posedge clk, posedge rst) begin
        if(rst) turn_to <= 0;
        else begin
            if(turn) begin
                turn_to <= ~turn_to;
            end
            else turn_to <= turn_to;
        end
    end

    // TODO: trace the rest of motor.v and control the speed and direction of the two motors

    reg [31:0] counter;
    parameter number = 12000000;
    wire timegap;
    always @(posedge clk, posedge rst) begin
        if(rst) counter <= 0;
        else begin
            if(turn_to)begin
                if(counter < 18000000) counter <= counter + 1;
                else counter <= counter;
            end
            else begin
                if(counter > 0) counter <= counter - 1;
                else counter <= counter;
            end
        end
    end
    //assign timegap = (counter< 100000000) ? 1:0;

    always@(posedge clk) begin
        if(0<counter && counter<18000000)begin
            if(turn_to)begin
                left_motor = 630;
                l_IN = 2'b10;
            end
            else begin
                left_motor = 600;
                l_IN = 2'b01;
            end
        end
        else if(counter==0 || counter==18000000)begin
            left_motor = 0;
            l_IN = 2'b00;
        end
    end
    
endmodule

module motor_pwm (
    input clk,
    input reset,
    input [9:0]duty,
	output pmod_1 //PWM
);
        
    PWM_gen pwm_0 ( 
        .clk(clk), 
        .reset(reset), 
        .freq(32'd25000),
        .duty(duty), 
        .PWM(pmod_1)
    );

endmodule

//generte PWM by input frequency & duty cycle
module PWM_gen (
    input wire clk,
    input wire reset,
	input [31:0] freq,
    input [9:0] duty,
    output reg PWM
);
    wire [31:0] count_max = 100_000_000 / freq;
    wire [31:0] count_duty = count_max * duty / 1024;
    reg [31:0] count;
        
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            count <= 0;
            PWM <= 0;
        end else if (count < count_max) begin
            count <= count + 1;
            if(count < count_duty)
                PWM <= 1;
            else
                PWM <= 0;
        end else begin
            count <= 0;
            PWM <= 0;
        end
    end
endmodule

