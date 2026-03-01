module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum);

    reg w1;
    integer i;
    always@(*) begin
        w1 = cin;
        for(i=0;i<100;i=i+1)begin
            sum [i] = a[i]^b[i]^w1;
            cout = (a[i]&b[i]) | (a[i]&w1) | (b[i]&w1);
            w1 = cout;
        end
    end
endmodule