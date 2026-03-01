//Always Block (Combinaitonal) Alwaysblock1
//https://hdlbits.01xz.net/wiki/Alwaysblock1

module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a&b;
    always@(*)
        out_alwaysblock = a&b;

endmodule