module overflow_detection_tb();

parameter width =8;

reg [width-1:0]a,b;
wire flag;

overflow #(width) dut (.a(a), .b(b), .flag(flag));

initial begin
    $monitor("a = %b, b = %b, overflow_flag = %b", a,b,flag);
    repeat(10) begin
        a = $random;
        b = $random;
        #10;
    end
end

endmodule