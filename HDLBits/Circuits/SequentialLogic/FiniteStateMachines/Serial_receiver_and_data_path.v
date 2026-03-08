module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    
    parameter idle = 3'b000;
    parameter count = 3'b001;
    parameter check = 3'b010;
    parameter ok = 3'b011;
    parameter none = 3'b100;
    
    reg  [2:0] state, next_state;
    reg [2:0] n;
    reg [7:0]out;
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end
    
    always@(posedge clk) begin
        if(state == count) begin
            
            n <= n+1;
        end
        else
            n <=0;
    end
    
    always@(*) begin
        done = 0;
        case(state)
            idle : begin
                next_state = in ? idle : count;
                done = 0;
            end
            count : begin
                if(n == 3'b111)
                    next_state = check;
                out[n] <= in;  
            end
            check : begin
                next_state = in ? ok : none;
                done = 1'b0;
            end
            ok : begin
                next_state = in ? idle : count;
                done = 1'b1;
            end
            none : next_state = in ? idle : none;
        endcase
    end

    //assign out_byte = (state==ok)&out;
    always@(*) begin
        if(state == ok)
            out_byte = out;
    end

    // New: Datapath to latch input bits.

endmodule
