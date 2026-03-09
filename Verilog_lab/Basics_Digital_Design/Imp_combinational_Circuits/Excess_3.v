// EXCESS THREE DESIGN

module xs_3 (input [3:0]bcd, output [3:0]xs3);

wire [3:0]bcd_temp;
assign bcd_temp = (bcd > 4'b1001) ? bcd+4'b0110 : bcd;
assign xs3 = bcd_temp + 4'b0011;

endmodule