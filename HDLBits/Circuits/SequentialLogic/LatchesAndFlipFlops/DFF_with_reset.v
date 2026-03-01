module d_ff(
    input d, clk, rst,
    output q);
    
    always@(posedge clk) begin
        if(rst) 
            q <= 1'b0;
        else
            q<=d;
    end
endmodule


module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q);
    
    genvar i;
    generate 
        for(i=0; i<8; i=i+1) begin : d_ff_n
            d_ff(.clk(clk), .rst(reset), .q(q[i]), .d(d[i]) );
        end
    endgenerate
endmodule
