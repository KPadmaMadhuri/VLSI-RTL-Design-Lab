`timescale 1ns/1ps
module up_down_counter_tb;

reg clk =0;
always #5 clk = ~clk;
reg rst;
parameter WIDTH = 4;
wire [WIDTH-1:0] count;
reg mode;
up_down_counter #(WIDTH) dut (.clk(clk), .rst(rst), .mode(mode), .count(count));

initial begin
    $monitor("rst = %b, clk = %b, mode = %b, count = %b", rst, clk, mode, count);

    rst = 1;
    #10 rst = 0;
    mode = 0;
    #100;

    rst = 1;
    #10 rst = 0;
    mode = 1;
    #40 rst = 1;
    #10 rst = 0;

    #300 $finish;
end

endmodule
