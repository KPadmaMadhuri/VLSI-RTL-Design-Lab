module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left = 1'b0;
    parameter right = 1'b1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        next_state = state;
        if(state == left) begin
            case({bump_right, bump_left})
                2'b00 : next_state = left;
                2'b10 : next_state = left;
                2'b01 : next_state = right;
                2'b11 : next_state = right;
            endcase
        end
        else begin
            case({bump_right, bump_left})
                2'b00 : next_state = right;
                2'b10 : next_state = left;
                2'b01 : next_state = right;
                2'b11 : next_state = left;
            endcase
        end
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= left;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    assign walk_left = (state == left);
    assign walk_right = (state == right);

endmodule
