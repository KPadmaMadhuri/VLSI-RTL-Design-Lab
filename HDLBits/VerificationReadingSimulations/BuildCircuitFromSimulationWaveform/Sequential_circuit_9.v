module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk) begin
        if(a)
            q <= 3'b100;
        else begin
            if(q == 3'b110)
                q <= 3'b000;
            else
                q <= q+1;
        end
    end
       
endmodule
