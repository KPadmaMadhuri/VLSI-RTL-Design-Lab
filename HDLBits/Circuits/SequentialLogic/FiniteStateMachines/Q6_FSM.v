module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    //state encoding 
    reg [2:0] state, next_state;
    
    //state register
    always@(posedge clk) begin
        if(reset)
            state <= 3'b000;
        else
            state <= next_state;
    end
    
    //combinaitonal logic, 2 process FSM
    always@(*) begin
        next_state = state;
        case(state)
            3'b000 : begin
                next_state = w ? 3'b000 : 3'b001;
                z = 1'b0;
            end
            3'b001 : begin
                next_state = w ? 3'b011 : 3'b010;
                z = 1'b0;
            end
            3'b010 : begin
                next_state = w ? 3'b011 : 3'b100;
                z = 1'b0;
            end
            3'b011 : begin
                next_state = w ? 3'b000 : 3'b101;
                z =1'b0;
            end
            3'b100 : begin
                next_state = w ? 3'b011 : 3'b100;
                z = 1'b1;
            end
            3'b101 : begin
                next_state = w ? 3'b011 : 3'b010;
                z = 1'b1;
            end
            default : begin
                next_state = 3'b000;
                z =1'b0;
            end
        endcase
    end

endmodule
