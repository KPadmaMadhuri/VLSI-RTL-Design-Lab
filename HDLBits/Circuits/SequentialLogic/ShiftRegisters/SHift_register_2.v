module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    genvar i;
    generate
        for(i=3; i>=0;i=i-1) begin : mux
            if(i==3) begin
                MUXDFF(KEY[0], KEY[1], KEY[2], KEY[3], SW[i], LEDR[i]);
            end
            else begin
                MUXDFF(KEY[0], KEY[1], KEY[2], LEDR[i+1], SW[i], LEDR[i]);
            end
        end
    endgenerate

endmodule

module MUXDFF (input clk, E, L,w, in, output reg q);
    wire w1,d;
    assign w1 = E ? w : q;
    assign d = L ? in : w1;
    always@(posedge clk) begin
        q <= d;
    end
endmodule