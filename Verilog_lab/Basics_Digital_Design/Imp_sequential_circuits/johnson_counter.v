// module d_ff( input clk, arst, d, output q);

// always@(posedge clk or posedge rst) begin
//     if(rst)
//     q <=0;
//     else 
//     q<=d;
// end

//endmodule

module johnson_counter #(parameter WIDTH = 4) (
    input clk, rst, output reg [WIDTH-1:0]count
);

always@(posedge clk or posedge rst) begin
    if(rst) begin
        count <= 0;
    end else begin
        count <= {(~count[0]), count[WIDTH-1:1]};
    end
end

endmodule