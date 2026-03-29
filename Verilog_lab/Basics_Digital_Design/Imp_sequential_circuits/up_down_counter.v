module up_down_counter #(parameter WIDTH = 4) (
    input clk, rst, mode, output reg [WIDTH-1:0]count
);

always@(posedge clk or posedge rst) begin
    if(rst) begin
        count <= 0;
    end
    else begin
        if(!mode) begin
            count <= count + 1;
        end else begin
            count <= count -1;
        end
    end
end

endmodule