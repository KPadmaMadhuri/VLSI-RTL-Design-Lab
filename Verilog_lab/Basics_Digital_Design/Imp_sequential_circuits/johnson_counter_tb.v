module johnson_counter_tb;

parameter WIDTH = 6;

reg clk =0;
always #5 clk = ~clk;

reg rst;
wire [WIDTH-1:0]count;

johnson_counter #(WIDTH) dut (.clk(clk), .rst(rst), .count(count));

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