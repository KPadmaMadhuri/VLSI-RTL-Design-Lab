module jk_tb;

reg rst,j,k;
wire q;
reg clk =0;
always #5 clk = ~clk;

jk_ff dut (.j(j), .k(k), .clk(clk), .rst(rst), .q(q));

initial begin
    $dumpfile ("JK_FF.vcd");
    $dumpvars (0, jk_tb);
    $monitor ("clk=%b, rst=%b, j=%b, k=%b, q=%b", clk,rst, j,k, q);
    rst = 1;

    #12 rst = 0;

    repeat (10) begin
      j = $random;
      k = $random;
      @(posedge clk);
    end

    #200 $finish;
end

endmodule
