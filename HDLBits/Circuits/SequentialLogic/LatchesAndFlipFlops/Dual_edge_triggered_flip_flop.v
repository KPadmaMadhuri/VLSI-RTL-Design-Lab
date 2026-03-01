module top_module (
    input clk,
    input d,
    output q
);
    reg ff_1, ff_2;
    always@(posedge clk) begin
        ff_1 <= d;
    end
    always@(negedge clk) begin
        ff_2 <=d;
    end
    assign q = clk ? ff_1:ff_2;
        
    
endmodule