module HA(input A,B,output S, C);
    assign S = A^B;
    assign C = A&B;
endmodule

module top_module( 
    input a, b, cin,
    output cout, sum );
    
    wire w1,  w2, w3;
    HA ha1 (.A(a), .B(b), .S(w1), .C(w2));
    HA ha2 (.A(w1), .B(cin), .S(sum), .C(w3));
    assign cout = w2|w3;
    
endmodule
