module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    reg [1:0] state, next_state;
    
    always@(posedge clk) begin
        if(reset)
            state <= 2'b00;
        else
            state <= next_state;
    end
    
    always@(*) begin
        done = 0;
        case(state)
            2'b00 : next_state = in[3] ? 2'b01 : 2'b00;
            2'b01 : begin
                next_state = 2'b10;
                //out_bytes[23:16] = in;
            end
            2'b10 : begin
                next_state = 2'b11;
                //out_bytes[15:8] = in;
            end
            2'b11 : begin
                next_state = in[3] ? 2'b01 : 2'b00;
                //out_bytes[7:0] = in;
                done = 1'b1;
            end
        endcase
    end
   