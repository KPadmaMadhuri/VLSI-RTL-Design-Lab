//Genrate For Loop : 100 Digit BDC Adder
//https://hdlbits.01xz.net/wiki/Bcdadd100

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    genvar i;
    wire [100:0]carry;
    assign carry[0] = cin;
    generate
        for(i=0; i<100; i=i+1) begin : bcd
            bcd_fadd(.a(a[(4*i)+3 : (4*i)]), .b(b[(4*i)+3 : (4*i)]), .cin(carry[i]), .sum(sum[(4*i)+3 : (4*i)]), .cout(carry[i+1]));
        end
    endgenerate
    assign cout = carry[100];
endmodule
