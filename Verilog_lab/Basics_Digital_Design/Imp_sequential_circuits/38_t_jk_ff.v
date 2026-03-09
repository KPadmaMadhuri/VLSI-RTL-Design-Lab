module t_jk (input t, clk,rst, output q);

jk_ff ff (.j(t), .k(t), .clk(clk), .rst(rst), .q(q));

endmodule