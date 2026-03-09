module ripple_adder #(
	parameter N=8)(
	input [N-1:0]A,
	input [N-1:0]B,
	output reg [N-1:0]S,
	output reg Cout
);

integer i;
reg [N-1:0]C;


always@(*) begin

	S=8'b00000000;
	C= 8'b00000000;
	Cout = 1'b0;

	//S = A&B;
	for(i=0;i<N;i++)
	begin
		if (i==0) begin
			S[i] = A[i]^B[i];
			C[i] = A[i]&B[i];
		end
		else
		begin
			S[i] = A[i]^B[i]^C[i-1];
			C[i] = (A[i]&B[i])|(A[i]&C[i-1])|(B[i]&C[i-1]);
		end
	end

	Cout = C[N-1];

end

endmodule





