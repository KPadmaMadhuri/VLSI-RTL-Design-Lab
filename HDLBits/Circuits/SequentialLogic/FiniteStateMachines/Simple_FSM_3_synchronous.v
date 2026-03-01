module top_module(
    input clk,
    input in,
    input reset,
    output out); 

    //State encoding
    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;
    localparam D = 2'b11;
    
    reg [1:0]state; 
    reg [1:0]next_state;
    
     // State flip-flops with asynchronous reset
    always@(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end
    
    // State transition logic
    always@(*) begin
        //next_state = state;
        case(state) 
            A : next_state = in ? B:A;
            B : next_state = in ? B:C;
            C : next_state = in ? D:A;
            D : next_state = in ? B:C;
            default next_state = A;
        endcase
    end
   
    // Output logic
    always@(*) begin
        //out = 1'b0;
        case (state)
            A : out = 1'b0;
            B : out = 1'b0;
            C : out = 1'b0;
            D : out = 1'b1;
        endcase
    end
endmodule