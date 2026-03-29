module mode_10_tb;

reg clk = 0;
always #5 clk = ~clk;

reg rst;
wire [3:0] count;

mod_10_counter dut( .clk(clk), .rst(rst), .count(count));

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



