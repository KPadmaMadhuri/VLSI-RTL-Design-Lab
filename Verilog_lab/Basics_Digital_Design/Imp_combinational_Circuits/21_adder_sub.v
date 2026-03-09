module FA (input a, b, cin, output s, cout);
assign s = (a ^ b) ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

/*module complement #(parameter WIDTH=4) (input [WIDTH-1:0]x, output [WIDTH-1:0]xcom);
integer i;

assign xcom = ~x + 1'b1;

endmodule
*/

module Adder_Subtractor #(parameter WIDTH=4) (input [WIDTH-1:0]A, input [WIDTH-1:0]B, input mode, output Cout, output [WIDTH-1:0]S);

wire [WIDTH:0] C;
wire sum_complement;

//wire [WIDTH-1:0] B_com, S_com, S_temp;
//complement #(WIDTH) comp_1 (.x(B), .xcom(B_com));
//assign B = mode ? B_com : B;
wire [WIDTH-1:0] B_temp, S_temp, B_comp, S_comp;
assign B_temp = B ^ {WIDTH{mode}};  // invert B when mode=1
assign C[0] = mode; 
genvar i;
generate
    for (i=0; i<WIDTH; i=i+1) begin : FA_n
        FA full_adder (.a(A[i]), .b(B_temp[i]), .cin(C[i]), .s(S[i]), .cout(C[i+1]));
    end
endgenerate
//complement #(WIDTH) comp_2 (.x(S_temp), .xcom(S_com));
// assign S_comp = (~S_temp + 1'b1);
// assign sum_complement = mode & S_temp[WIDTH-1];
// assign S = sum_complement ? S_comp : S_temp;
//assign S = S_temp;
assign Cout = C[WIDTH];
endmodule
