module mul_shift_add #(parameter WIDTH=4) (input [WIDTH-1:0]Q, input [WIDTH-1:0]M, output reg [(2*WIDTH)-1 : 0]A);

function [WIDTH:0]adder;
//5th bit to store carry
input [WIDTH-1:0]a;
input [WIDTH-1:0]b;
reg [WIDTH-1:0]sum;
reg [WIDTH:0]c;
integer n;
begin
    c[0] = 0;
    for (n=0;n<WIDTH;n=n+1) begin
        sum[n] = a[n]^b[n]^c[n];
        c[n+1] = (a[n] & b[n]) | (b[n]&c[n]) | (a[n]&c[n]);
    end
    adder = { c[WIDTH], sum};
end
endfunction

reg [(2*WIDTH):0]a;
integer i;

always @(*) begin
    a = {{(WIDTH+1){1'b0}}, Q};

    for (i=0;i<WIDTH;i=i+1) begin
        if( a[0] == 1) begin
            a[(2*WIDTH):WIDTH] = adder ((a[(2*WIDTH)-1 : WIDTH]), M);
        end
        a = a >>1;
    end
    A = a[(2*WIDTH)-1 : 0];

end

endmodule