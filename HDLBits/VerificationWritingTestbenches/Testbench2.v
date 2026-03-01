module top_module();
	reg in;
    reg clk=0;
    reg [2:0]s;
    wire out;
    always#5 clk = ~clk;
    q7 dut(.in(in), .clk(clk), .s(s), .out(out));
    
    initial begin
        in = 0;
        s = 3'b010;
        #10;
        s = 3'b110;
        #10;
        in = 1;
        s = 3'b010;
        #10;
        in =0;
        s = 3'b111;
        #10;
        in = 1;
        s = 3'b000;
        #30;
        in = 0;
    end
      
endmodule
