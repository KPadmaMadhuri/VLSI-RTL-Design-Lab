module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg ff, q;
    always@(posedge clk) begin
        if(reset) begin
            q <= 1'b0;
        end
        else begin
            ff <=in;
            q <= ff&(~in);
        end
    end
    assign out = q;
        
endmodule
