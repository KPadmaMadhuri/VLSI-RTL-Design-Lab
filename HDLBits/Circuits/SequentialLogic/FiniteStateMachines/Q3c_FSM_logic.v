module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

     //state encoding
    reg [2:0] state, next_state;
    //state register
    always@(clk) begin
            state <= y;
    end
    
    //combinaitonal block 
    //2 process FSM
    always@(*) begin
        
        case(state)
            3'b000 : begin
                next_state = x ? 3'b001 : 3'b000;
                z = 1'b0;
            end
            3'b001 : begin
                next_state = x ? 3'b100 : 3'b001;
                z = 1'b0;
            end
            3'b010 : begin
                next_state = x ? 3'b001 : 3'b010;
                z = 1'b0;
            end
            3'b011 : begin
                next_state = x ? 3'b010 : 3'b001;
                z = 1'b1;
            end
            3'b100 : begin
                next_state = x ? 3'b100 : 3'b011;
                z = 1'b1;
            end
            default : begin
                next_state = 3'b000;
                z = 1'b0;
            end
        endcase
        Y0 = next_state[0];
    end

endmodule
