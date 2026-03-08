module top_module (input a, input b, input c, output out);//

    wire out_r;
    andgate inst1 ( out_r,a, b, c, 1'b1, 1'b1 );
	assign out = ~out_r;
endmodule
