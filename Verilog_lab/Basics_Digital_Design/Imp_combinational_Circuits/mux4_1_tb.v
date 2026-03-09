module mux4_1_tb;

reg [3:0]i;
reg [2:0]s;

wire o;
//integer a;
mux4_1 dut(.i(i), .s(s[1:0]), .o(o));

initial begin
	
	$dumpfile("mux4_1.vcd");
	$dumpvars(0,mux4_1_tb);

	$display("Value of Sel now is %b.", s);
	i = 4'b1111;
	$display("Value of Sel now is %b.", i);
	for (s=3'b000; s[2]!=1; s=s+1'b1) begin

		#10;
		$display("at time T=%0t, for value s=%b, the o/p is %b.", $time, s,o);
		
	end
	#10;
	$finish
	;
end

endmodule
		

