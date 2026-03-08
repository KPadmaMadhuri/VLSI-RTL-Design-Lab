module FA ( 
    input A,
    input B,
    input Cin,
    output S,
    output Cout);
    assign S = A^B^Cin;
    assign Cout = (A&B)|(B&Cin)|(A&Cin);
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0]cout;
    wire cin;
    assign cin =1'b0;
    genvar i;
    generate
        for (i=0; i<4; i = i+1) begin : fa
            if (i==0)
                FA (.A(x[0]), .B(y[0]), .Cin(cin), .S(sum[0]), .Cout(cout[0]));
            else
                FA (.A(x[i]), .B(y[i]), .Cin(cout[i-1]), .S(sum[i]), .Cout(cout[i]));
        end
    endgenerate
    assign sum[4] = cout[3];

endmodule
