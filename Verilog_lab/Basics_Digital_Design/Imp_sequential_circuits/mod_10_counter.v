module mod_10_counter(
    input clk, rst, output reg [3:0]count
);

always@(posedge clk or posedge rst) begin
    if(rst)
    count = 0;
    else begin
        if(count == 4'b1001) begin
            count <= 4'b0000;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule