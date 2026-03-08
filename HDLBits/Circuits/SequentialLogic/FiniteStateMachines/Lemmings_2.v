module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    

    parameter left = 2'b00;
    parameter right = 2'b01;
    parameter falling_left = 2'b10;
    parameter falling_right = 2'b11;
    reg [1:0]state, next_state;

    always @(*) begin
        // State transition logic
        next_state = state;
        case (state)
            left : begin
                casex({ground, bump_right, bump_left})
                    3'b0xx : next_state = falling_left;
                    3'b1x0 : next_state = left;
                    3'b1x1 : next_state = right;
                endcase
            end
            right : begin
                casex({ground, bump_right, bump_left})
                    3'b0xx : next_state = falling_right;
                    3'b10x : next_state = right;
                    3'b11x : next_state = left;
                endcase
            end
            falling_left : begin
                case(ground) 
                    1'b0 : next_state = falling_left;
                    1'b1 : next_state = left;
                endcase
            end
            falling_right : begin
                case (ground) 
                    1'b0 : next_state = falling_right;
                    1'b1 : next_state = right;
                endcase
            end
        endcase
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
    assign aaah = ((state==falling_left)|(state==falling_right));

endmodule
