module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]ff;
    always@(posedge clk) begin
        ff <= in;
        anyedge <= ff^in;
    end

endmodule