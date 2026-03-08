module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    localparam A = 1'b0;
    localparam B = 1'b1;
    reg state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            state <= B;
        end else begin
            state <= next_state;
        end
    end
    always@(*) begin  
        next_state = state; 
        case (state)
                // Fill in state transition logic
                A : next_state = in ? A:B;
                B : next_state = in ? B:A;
                default next_state = B;
            endcase
    end

     // State flip-flops
    always@(*) begin
        
            case (state)
                // Fill in output logic
                A : out = 1'b0;
                B : out = 1'b1;
                default out = 1'b0;
            endcase
    end

endmodule
