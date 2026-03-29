`timescale 1ns/1ps
module ring_counter_tb;

reg clk =0;
always #5 clk = ~clk;
reg rst;
parameter WIDTH = 5;
wire [WIDTH-1:0] count;
ring_counter #(WIDTH) dut (.clk(clk), .rst(rst), .count(count));

initial begin
    $monitor("rst = %b, clk = %b, count = %b", rst, clk, count);

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
