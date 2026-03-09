module Adder_Subtractor_tb;
parameter WIDTH=4;
reg [WIDTH-1:0]A,B, sum;
wire [WIDTH-1:0]S;
wire cout;
reg mode;
integer i;


Adder_Subtractor #(WIDTH) dut (.A(A), .B(B), .S(S), .Cout(cout), .mode(mode));

assign S=0;

initial begin
    
    $dumpfile("ADDER_SUBTRACTOR.vcd");
    $dumpvars(0, Adder_Subtractor_tb);

for (i=0; i<10; i=i+1) begin
    #1;
    A = $random;
    B= $random;
    mode = $random;
    #1;
    sum = mode ? (A-B) : (A+B);
    $display("mode = %b, A = %b, B=%b, Sum_dut = %b, cout = %b, , sum_tb = %b", mode, A,B, S, cout, sum);
    if (sum==S)
         $display("PASS");
    else
        $display("FAIL");
end
end

endmodule