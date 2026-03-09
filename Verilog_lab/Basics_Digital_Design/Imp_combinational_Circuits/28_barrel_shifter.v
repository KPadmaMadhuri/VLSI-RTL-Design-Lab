//Barrel SHifter Design

module barrel_shifter #(parameter WIDTH=4) (input [WIDTH-1:0]ip, input [1:0]mode, input [WIDTH-1:0]n, output reg [WIDTH-1:0]op);

//mode 00 = logical left shift
//mode 01 = logical rightshift
//mode 10 = Arithmatic left shift
//mode 11 = Arithmatic right shift
wire [WIDTH-1:0]ip_shift;
assign ip_shift = ip>>n;


always @(*) begin
    case(mode) 
    2'b00 : op = ip << n;
    2'b01 : op = ip >> n;
    2'b10 : op = ip << n;
    2'b11 : op = {ip[WIDTH-1], ip_shift[WIDTH-2 :0]};
    endcase
end

endmodule