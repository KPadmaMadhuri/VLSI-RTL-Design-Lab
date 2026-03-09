//Design a Binary Multiplier using shift and add algorithm

module mul_shift_add_tb;

parameter WIDTH=4;

reg [WIDTH-1:0]Q;
reg [WIDTH-1:0]M;
wire [(2*WIDTH)-1 :0]A;
reg [(2*WIDTH)-1 :0]product;
integer i;

mul_shift_add #(WIDTH) dut (.Q(Q), .M(M), .A(A));

initial begin
    Q = 4'b0011;
    M = 4'b1011;
    #1;
    $display ("A = %b", A);

    for (i=0; i<5; i=i+1) begin
        Q = $random;
        M = $random;
        #2;
        $display ("M=%b, Q=%b, A=%b", M,Q,A);
        product = Q*M;
        if (product == A) begin
            $display ("PASS");
        end
        else $display("FAIL");
    end
    $finish;
end

endmodule