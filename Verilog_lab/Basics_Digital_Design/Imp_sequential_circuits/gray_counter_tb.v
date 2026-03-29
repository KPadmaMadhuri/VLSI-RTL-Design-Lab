`timescale 1ns/1ps

module gray_counter_tb;

reg clk = 0;
always #5 clk = ~clk;

reg rst;
parameter WIDTH = 4;
wire [WIDTH-1:0]gray_count;

gray_counter #(WIDTH) dut (.clk(clk), .rst(rst), .gray_count(gray_count));

initial begin
    $monitor("rst =%b, clk = %b, gray_count = %b", rst, clk, gray_count);
    rst = 1;
    #10 rst = 0;
    #100;

    rst = 1;
    #10 rst = 0;
    #40 rst = 1;
    #10 rst = 0;

    #300 $finish;
end

endmodule