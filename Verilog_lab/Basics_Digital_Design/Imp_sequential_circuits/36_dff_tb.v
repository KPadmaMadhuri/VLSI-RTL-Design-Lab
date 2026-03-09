module dff_tb;

reg d, rst;
wire q;
reg clk = 0;

always #5 clk = ~clk;

d_ff dut (.d(d), .clk(clk), .rst(rst), .q(q));

initial begin
    $dumpfile ("D_FF.vcd");
    $dumpvars (0, dff_tb);
    $monitor ("clk=%b, rst=%b, d=%b, q=%b", clk,rst,d,q);
    rst=1;
    #10;
    rst=0;
    d=0;
    #10;
    d=1;
    #20;
    d=0;
    #10;
    d=1;
    rst=1;
    #10 rst=0;
    d=0;

    $finish;
end

endmodule