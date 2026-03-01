module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    reg q;
    always@(posedge clk) begin
        case({j,k})
            2'b00 : q<=q;
            2'b01 : q<=1'b0;
            2'b10 : q<=1'b1;
            2'b11 : q<=~q;
            default : q<=0;
        endcase
    end
    assign Q = q;

endmodule
