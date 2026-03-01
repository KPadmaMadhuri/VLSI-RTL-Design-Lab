//Adder-Subtractor - Module addsub
//https://hdlbits.01xz.net/wiki/Module_addsub

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire carry;
    wire [31:0]b1;
    assign b1 = {32{sub}}^b;
    add16 d1(.a(a[15:0]), .b(b1[15:0]), .cin(sub), .sum(sum[15:0]), .cout(carry));
    add16 d2(.a(a[31:16]), .b(b1[31:16]), .cin(carry), .sum(sum[31:16]));
endmodule
