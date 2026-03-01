module FA ( 
    input A,
    input B,
    input Cin,
    output S,
    output Cout);
    assign S = A^B^Cin;
    assign Cout = (A&B)|(B&Cin)|(A&Cin);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    genvar i;
    generate
        for (i=0; i<3; i = i+1) begin : fa
            if (i==0)
                FA (.A(a[0]), .B(b[0]), .Cin(cin), .S(sum[0]), .Cout(cout[0]));
            else
                FA (.A(a[i]), .B(b[i]), .Cin(cout[i-1]), .S(sum[i]), .Cout(cout[i]));
        end
    endgenerate
  
endmodule
