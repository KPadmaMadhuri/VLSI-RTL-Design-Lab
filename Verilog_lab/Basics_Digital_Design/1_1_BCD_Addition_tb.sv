module bcd_addition_tb();

reg [3:0] a,b;
wire [3:0] sum;
reg c_in;
wire c_out;

bcd_adder dut (.bcd_a(a), .bcd_b(b), .bcd_c(c_in), .bcd_sum(sum), .bcd_out(c_out));

initial begin
    $monitor("a=%b, b=%b, c_in = %b, sum = %b",a,b,c_in, sum);
    repeat(10) begin
        a = $random;
        b = $random;
        c_in = $random;
        #10;
    end
end    

endmodule
