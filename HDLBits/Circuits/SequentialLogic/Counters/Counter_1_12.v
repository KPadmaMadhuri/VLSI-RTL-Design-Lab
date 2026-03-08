module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    
    assign c_enable = enable;
    assign c_load = (reset||((Q ==4'b1100)&&(enable==1'b1)));
    always@(posedge clk) begin
        if(reset) begin
            Q <= 4'b0001;
            //c_load = 1'b1;
            c_d = 4'b0001;
        end
        else begin
            if(enable) begin
                Q = Q+1;
                if(Q == 4'b1101) begin
                    Q = 4'b0001;
                    //c_load = 1;
                    c_d = 4'b0001;
                end
            end
        end
    end
                    
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule