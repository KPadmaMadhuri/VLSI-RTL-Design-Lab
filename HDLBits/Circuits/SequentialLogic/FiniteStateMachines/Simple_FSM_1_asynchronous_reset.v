module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        //state transition logic
        next_state = state;
        case (state)
            A : next_state = in ? A : B;
            B : next_state = in ? B : A;
            default next_state = B;
        endcase
    end

    always @(posedge clk or posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    always@(*) begin
        out = 1'b0;
        case (state)
            A : out = 1'b0;
            B : out = 1'b1;
        endcase
    end

endmodule
