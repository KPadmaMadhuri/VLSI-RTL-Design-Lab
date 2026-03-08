module top_module();
    reg [1:0]in;
    wire out;
    andgate dut (.in(in), .out(out));
    integer i;
    initial begin
        for(i=0;i<4;i=i+1) begin
            in = i;
            #10;
        end
    end
endmodule