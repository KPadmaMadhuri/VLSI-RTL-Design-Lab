module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    reg [3:0] a;
    always@(posedge clk) begin
        if(reset) begin
            a <=0;
        end
        else begin
            if(a == 4'b1001) begin
                a <= 0;
            end
            else 
                a <= a+1;
        end
    end
    assign q = a + 1;

endmodule