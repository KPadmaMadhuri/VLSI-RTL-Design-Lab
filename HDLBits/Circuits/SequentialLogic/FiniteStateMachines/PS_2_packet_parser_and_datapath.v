module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // State transition logic (combinational)
    reg [1:0] state, next_state;

    // State flip-flops (sequential)
    always@(posedge clk) begin
        if(reset)
            state <= 2'b00;
        else
            state <= next_state;
    end
           
    // Output logic
    always@(*) begin
        done = 1'b0;
        case(state)
            2'b00 : next_state = in[3] ? 2'b01 : 2'b00;
            2'b01 : next_state = 2'b10;
            2'b10 : next_state = 2'b11;
            2'b11 : begin
                next_state = in[3] ? 2'b01 : 2'b00;
                done = 1'b1;
            end
        endcase
    end
    
endmodule
