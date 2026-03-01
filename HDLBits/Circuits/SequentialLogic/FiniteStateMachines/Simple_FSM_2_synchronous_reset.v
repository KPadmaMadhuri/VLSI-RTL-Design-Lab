module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        next_state = state;
        case(state)
            OFF : next_state = j ? ON : OFF;
            ON : next_state = k ? OFF : ON;
            default next_state = OFF;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with asynchronous reset
        if(reset)begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    always@(*) begin
        out = 1'b0;
        case(state)
            OFF : out = 1'b0;
            ON : out = 1'b1;
        endcase
    end
endmodule
