//Design a BCD to 7 - Segment decoder Basic Teat bench


module bcd_7_segment_tb;

reg [3:0]bcd;
wire [6:0]segment;
integer i;

bcd_7_segment dut (.bcd(bcd), .segment(segment));

initial begin
    for (i=0;i<10;i++) begin
        bcd = $random;
        #1;
        if( (bcd>4'b1001)&(segment!=0) ) begin
            $display("FAIL");
        end
        $display("PASS : BCD=%0d, segment = %b",bcd, segment);
    end
    $finish;
end

endmodule
