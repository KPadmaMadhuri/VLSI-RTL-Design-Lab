module d_ff(input clk, input d, output q);
    always@(posedge clk)
        q <= d;
endmodule

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );
    
    reg [7:0]Q;
    /*genvar i;
    generate
        for(i=0; i<8; i = i+1) begin : dff
            if(i==0) begin
                d_ff(clk, S, Q[i]);
            end
            else
                d_ff(clk, Q[i-1], Q[i]);
        end
    endgenerate
    */
    integer i;
    always@(posedge clk) begin
        for (i=0; i<8; i = i+1) begin
            if(enable) begin
                if(i==0)
                    Q[i] <=S;
                else begin
                    Q[i] <= Q[i-1];
                end
            end
        end
    end
    assign Z = Q[{A,B,C}];

endmodule
