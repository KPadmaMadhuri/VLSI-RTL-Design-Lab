module gray_counter #(parameter WIDTH = 4) (
    input clk, rst,
    output reg [WIDTH-1:0]gray_count
);

reg [WIDTH-1:0] bin_count;

always@(posedge clk or posedge rst) begin
    if(rst)
    bin_count <= 0;
    else begin
        bin_count <= bin_count+1;
        if(bin_count == 4'b1010)
        bin_count <= 0;
    end

end
integer i;
always@(*) begin
    gray_count[WIDTH-1] = bin_count [WIDTH-1];
    for (i=0; i<WIDTH-1; i = i+1) begin
        gray_count[i] = bin_count[i+1] ^ bin_count[i];
        //bin_count = bin_count >> 1;
    end
end

endmodule
