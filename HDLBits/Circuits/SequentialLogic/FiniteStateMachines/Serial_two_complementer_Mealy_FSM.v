module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg [1:0] state, next_state;
    always@(posedge clk or posedge areset) begin
        if(areset)
            state <= 2'b01;
        else
            state <= next_state;
    end
    
    always@(*) begin
        next_state = 2'b00;
        case(1'b1)
            state[0] : next_state = x ? 2'b10 : 2'b01;
            state[1] : next_state = 2'b10;
        endcase
    end
    assign z = (state[0]&x)|(state[1]&~x);
   
endmodule
