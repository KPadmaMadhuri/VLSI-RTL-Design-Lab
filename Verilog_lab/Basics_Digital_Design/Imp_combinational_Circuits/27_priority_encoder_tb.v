//priority_encoder Basic Teat bench

module priority_encoder_tb;
reg [7:0] ip;
wire [2:0] op;
wire [2:0] op_tb;
integer i;

priority_encoder dut (.ip(ip), .op(op));
initial begin 
    for (i=0;i<10;i=i+1) begin
        ip = $random;
        #5;
        $display ("ip = %b, op = %b", ip,op);
        if(ip[op]) begin
            $display("PASS");
        end
    end
    $finish;
end

endmodule