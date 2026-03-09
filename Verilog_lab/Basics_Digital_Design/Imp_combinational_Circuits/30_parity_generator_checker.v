module parity_generator #(parameter WIDTH=4) (input [WIDTH-1:0]ip, input mode, output reg [WIDTH:0]op);

reg parity;
integer i,count;
reg [WIDTH-1:0]ip_bit;

always@(*) begin
    count=0;
    ip_bit = ip;
    for (i=0;i<WIDTH;i=i+1) begin
        if(ip_bit[0]==1) begin
            count = count+1;
        end
        ip_bit = ip_bit>>1;
    end
    if((mode==0)&&(count%2 == 0)) begin
        parity = 1'b1;
    end
    if ((mode==1)&&(count%2 == 1)) begin
        parity = 1'b1;
    end
    else begin
        parity = 1'b0;
    end
    op = {parity, ip};

end

endmodule

module parity_checker #(parameter WIDTH=4) (input [WIDTH:0]ip_1, input mode, output reg status);

reg parity;
reg [WIDTH-1:0]ip_bits;
integer j,n;

always@(*) begin
    parity = ip_1[WIDTH];
    ip_bits = ip_1[WIDTH-1:0];
    n=0;
    for (j=0;j<WIDTH;j=j+1) begin
        if(ip_bits[0]==1) begin
            n=n+1;
        end
        ip_bits = ip_bits>>1;
    end
    if ((mode==0)&&(n%2 == 0)&& (parity == 1)) begin
        status = 1'b1;
    end
    if ((mode==1)&&(n%2 == 1)&& (parity == 1)) begin
        status = 1'b1;
    end
    else begin
        status=1'b0;
    end
end

endmodule