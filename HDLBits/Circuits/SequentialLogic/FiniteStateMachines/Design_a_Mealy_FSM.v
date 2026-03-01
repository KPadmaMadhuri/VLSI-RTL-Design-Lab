module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    reg [1:0] state, next_state;
    always@(posedge clk or negedge aresetn) begin
        if(!aresetn)begin
            state<=0;
        end
        else
            state <= next_state;
    end
    
    always@(*) begin
        case(state)
            2'b00 : begin
                next_state = x ? 2'b01 : 2'b00;
                z = 1'b0;
            end
            2'b01 : begin
                next_state = x ? 2'b01 : 2'b10;
                z = 1'b0;
            end
            2'b10 : begin
                next_state = x ? 2'b01: 2'b00;
                z = x ? 1 : 0;
            end
            default : begin
                next_state = 2'b00;
                z = 1'b0;
            end
        endcase
    end 

endmodule
