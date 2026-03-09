//OVERFLOW DETECTION IN SIGNED ADDITION 

module fa(input x,y,z, output s,c);
    assign s = x^y^z;
    assign c = (x&y)|(y&z)|(x&z);
endmodule

module overflow #(parameter width = 4) (
    input [width-1:0]a, input [width-1:0]b,
    output flag
);
    wire [width-1:0]sum;
    wire [width:0]carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i=0; i<width; i=i+1) begin :FA
            fa i (.x(a[i]), .y(b[i]), .z(carry[i]), .s(sum[i]), .c(carry[i+1]));
        end
    endgenerate
    assign flag = carry[width]^carry[width-1];
endmodule



