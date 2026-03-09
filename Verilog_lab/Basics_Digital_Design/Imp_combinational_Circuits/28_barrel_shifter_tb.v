//Barrel SHifter Basic Test Bench

module barrel_shifter_tb;

parameter WIDTH=3;

reg [WIDTH-1:0]n,ip;
reg [1:0]mode;
wire [WIDTH-1:0]op;
integer i;

barrel_shifter #(WIDTH) dut (.n(n), .ip(ip), .op(op), .mode(mode));

initial begin
    for (i=0; i<10; i=i+1) begin
        ip = $random;
        mode = $random;
        n = 1;
        #1;
        $display ("mode = %b, n = %b, ip = %b, op = %b", mode, n, ip, op);
end
$finish;
end

endmodule
