//Carry Select Adder
//https://hdlbits.01xz.net/wiki/Module_cseladd

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]w_sum_0, w_sum_1;
    wire carry;
    add16 d1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(carry));
    add16 d2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(w_sum_0[15:0]));
    add16 d3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(w_sum_1[15:0]));
    assign sum[31:16] = carry ? w_sum_1 : w_sum_0;       

endmodule