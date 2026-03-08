module d_ff(
    input clk,
    input d,
    output q);
    always@(posedge clk) begin
        q<=d;
    end
endmodule

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    
    genvar i;
    generate
        for(i=0; i<8; i=i+1)begin : d_ff_n
            d_ff (.clk(clk), .q(q[i]), .d(d[i]));
        end
    endgenerate
endmodule
