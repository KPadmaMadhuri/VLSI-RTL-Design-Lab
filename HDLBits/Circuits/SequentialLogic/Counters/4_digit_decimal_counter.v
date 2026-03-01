module bcd_counter(input clock, rst, enable, output reg [3:0]out, output flag);
    
    always@(posedge clock) begin
        if(rst) begin
            out <=4'b0000;
        end else if(enable) begin
            out <= (out>=4'b1001) ? 4'b0000 : out+1; 
        end
    end
    assign flag = (out==4'b1001);
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcd_counter BC1 (.clock(clk), .rst(reset),.enable(1'b1), .out(q[3:0]), .flag(ena[1]));
    bcd_counter BC2 (.clock(clk), .rst(reset), .enable(ena[1]), .out(q[7:4]), .flag(ena[2]));
    bcd_counter BC3 (.clock(clk), .rst(reset), .enable(ena[2]&ena[1]), .out(q[11:8]), .flag(ena[3]));
    bcd_counter BC4 (.clock(clk), .rst(reset), .enable(&ena),.out(q[15:12]));
   
    
endmodule