//generate for loop: 100 Bit binary adder 2
//https://hdlbits.01xz.net/wiki/Adder100i

module full_adder(input x,y,c_in, output z, c_out);
    assign z = x^y^c_in;
    assign c_out = (x&y)|(y&c_in)|(x&c_in);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar i;
    generate
        for (i=0; i<100; i=i+1) begin : FA
            if(i==0)
                full_adder(.x(a[i]), .y(b[i]), .c_in(cin), .z(sum[i]), .c_out(cout[i]));
            else
                full_adder(.x(a[i]), .y(b[i]), .c_in(cout[i-1]), .z(sum[i]), .c_out(cout[i]));
        end
    endgenerate
endmodule
