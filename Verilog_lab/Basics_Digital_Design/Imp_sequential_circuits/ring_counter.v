module ring_counter #(parameter WIDTH=4)(
    input clk, rst, output reg [WIDTH-1:0]count
);

always@(posedge clk or posedge rst) begin
    if(rst)
    count = {1'b1, {WIDTH-1{1'b0}}};
    else
    count = {count[0], count[WIDTH-1:1]};
end

endmodule




