module PISO_tb;
parameter WIDTH=8;
reg clk=0;
reg reset;
reg mode;
wire out;
reg [WIDTH-1:0]in;

always #5 clk = ~clk;

PISO #(WIDTH) dut(.clk(clk), .reset(reset), .mode(mode), .in(in), .out(out));

initial begin
    $monitor("clk = %b, reset = %b, in = %b, out = %b", clk, reset, in, out);
    $dumpfile("PISO_SR.vcd");
    $dumpvars(0, PISO_tb);

    reset = 1;
    #10;
    reset = 0;
    mode = 1;
    in = $random;
    #10;
    mode = 0;
    #40;
    reset = 1;
    #10;
    reset = 0;
    #10;
    mode = 1'b1;
    in = $random;
    #10;
    mode = 0;
    #100;
    $finish;
end

endmodule
