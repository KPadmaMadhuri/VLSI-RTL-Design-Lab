//Excess # design TestBench Basic

module xs_3_tb;
reg [3:0]bcd;
wire [3:0]xs3;
integer i;
xs_3 dut (.bcd(bcd), .xs3(xs3));
initial begin
    for (i=0; i<10; i=i+1) begin
        bcd = $random;
        #1;
        $display("bcd-%b -> xs3-%b", bcd,xs3);
        if ( (xs3<3) | (xs3>12)) begin
            $display("fail");
        end
        else begin
            $display("Pass");
        end
    end
end
endmodule