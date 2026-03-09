module t_jk_tb;

reg t, rst;
reg clk =0;
reg exp_q;
always #5 clk = ~clk;

always @ (posedge clk or negedge rst) begin
    if(rst) begin
        exp_q<=0;
    end
    else begin
        exp_q<= ~exp_q;
    end
end

t_jk dut (.t(t), .clk(clk), .rst(rst), .q(q));

initial begin
    $dumpfile ("T_JK.vcd");
    $dumpvars (0, t_jk_tb);

    $monitor("clk=%b, rst=%b, t=%b, q=%b, q_exp=%b", clk,rst, t,q, exp_q);

    rst = 1;
    #10 rst = 0;

    repeat (10) begin
        t = $random;
        @ (posedge clk);
        #1;
        if (q!=exp_q) begin
            $display ("FAIL");
        end
    end

    #200 $finish;
end

endmodule
