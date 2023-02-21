module clock_divider #(parameter n=25)(
    input clk,
    output clk_div
);
    reg [n:0] num = 0;
    wire [n:0] next_num;

    always @(posedge clk) begin
        num = next_num;
    end

    assign next_num = num + 1;
    assign clk_div = num[n-1];

endmodule 

module clock_divider_accur #(parameter goal = 30'd50000000)(
    input clk, 
    output reg clk_div
);
  //  原本應該是50000000倍clk, 但數完才change value
    
    wire [30:0] g;
    reg [30:0] counter = 0;           //0.5 second / times
    initial begin
        clk_div = 0;
    end
    assign g = goal >> 1; 
    always@(posedge clk) begin
        counter = counter + 1;
        if(counter == g) begin
            clk_div = ~clk_div;
            counter = 0;
        end
        else begin end
    end
endmodule