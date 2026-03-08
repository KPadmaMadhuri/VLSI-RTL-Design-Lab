module fa (
    input x,y,z, output w, C
);

assign w = x^y^z;
assign C = (x&y)|(y&z)|(x&z);

endmodule

module bit_4_addition (
    input [3:0] a,b, input c_in, output [3:0]s, output c_out
);

wire [4:0] carry;
genvar i;
assign carry[0] = c_in;
generate
    for (i=0; i<4; i=i+1) begin : FA_n
        fa n (.x(a[i]), .y(b[i]), .z(carry[i]), .w(s[i]), .C(carry[i+1]));
    end

endgenerate

assign c_out = carry[4];
endmodule

module bcd_adder(
    input [3:0] bcd_a, bcd_b, input bcd_c, output reg [3:0] bcd_sum, output reg bcd_out
);

wire [3:0] inter_sum;
wire inter_carry;
bit_4_addition add (.a(bcd_a), .b(bcd_b), .c_in(bcd_c), .s(inter_sum), .c_out(inter_out));

parameter add_six = 4'b0110;

always@(*) begin

    if((inter_sum>4'b1001)||(inter_out == 1'b1)) begin : adder
        bcd_sum = inter_sum + 4'b0110;
    end else begin
        bcd_sum = inter_sum;
        bcd_out = inter_out;
    end
end


endmodule