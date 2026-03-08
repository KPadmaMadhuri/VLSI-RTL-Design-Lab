module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );

    //state encoding
    reg state_in = 0;
    reg next_state;
    
    always@(posedge clk) begin
        state_in <= next_state;
    end
    
    always@(*)begin
        case(state_in)
            1'b0 : begin
                next_state = a&b;
                q = a^b;
            end
            1'b1 : begin
                next_state = (a|b);
                q = ~(a^b);
            end
        endcase
    end
    assign state = state_in;
endmodule
