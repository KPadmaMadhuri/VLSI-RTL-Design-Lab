module parity_tb;

parameter WIDTH = 5;

reg [WIDTH-1:0]ip;
wire [WIDTH:0]op;
reg [WIDTH:0]ip_1;
reg mode;
wire status;
integer i;

parity_generator #(WIDTH) dut_1 (.ip(ip), .mode(mode), .op(op));
parity_checker #(WIDTH) dut_2 (.ip_1(ip_1), .mode(mode), .status(status));

initial begin
    for (i=0; i<10; i=i+1) begin
        ip = $random;
        mode = $random;
        #1;
        ip_1 = op;
        #1;
        $display("mode=%b, ip=%b, op=%b, status=%b", mode, ip, op, status);
    end
    $finish;
end

endmodule
