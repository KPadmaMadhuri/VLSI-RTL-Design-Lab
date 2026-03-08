module top_module ();
    reg clk = 0;
    always#5 clk = ~clk;
    reg reset;
    reg t;
    wire q;
    tff dut (.clk(clk), .reset(reset), .t(t),.q(q));
    initial begin
    	reset = 1;
        #10 reset= 0;
        t = 1;
    end
        
    

endmodule
