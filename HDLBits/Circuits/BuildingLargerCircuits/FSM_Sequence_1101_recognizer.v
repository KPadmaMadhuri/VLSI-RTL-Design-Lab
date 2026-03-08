module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    //state encoding
    reg [2:0] state, next_state;
    
    always@(posedge clk) begin
        if(reset) begin
            state <= 3'b000;
        end
        else begin
            state <= next_state;
        end
    end
    
    //combinaitonsl // 2 process FSM
    always@(*) begin
        
        start_shifting = 1'b0;
        case(state)
            
            3'b000 : next_state = data ? 3'b001 : 3'b000;
            3'b001 : next_state = data ? 3'b010 : 3'b000;
            3'b010 : next_state = data ? 3'b010 : 3'b011;
            3'b011 : next_state = data ? 3'b100 : 3'b000;
            3'b100 : start_shifting = 1'b1;
            default : next_state = 3'b000;
                
        endcase
    end
       
endmodule
