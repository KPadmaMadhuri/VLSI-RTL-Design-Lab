module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0]ff;
    always@(posedge clk) begin
        for(i=0;i<8;i=i+1) begin
            ff[i] <= in[i];
            pedge[i] <=(~ff[i])&in[i];
        end
    end
    
endmodule