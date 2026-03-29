module PISO #(parameter WIDTH = 4)(
    input clk,reset,
    input [WIDTH-1:0]in,
    input mode,
    output  reg out
);
reg [WIDTH-1:0] in_in;

always@(posedge clk) begin
    if(reset) begin
        out <= 1'b0;
    end else begin
        if (mode) begin
            in_in <= in;
        end
        else begin
            out <= in_in[0];
            in_in <= in_in >>1;
        end
    end 
end

endmodule