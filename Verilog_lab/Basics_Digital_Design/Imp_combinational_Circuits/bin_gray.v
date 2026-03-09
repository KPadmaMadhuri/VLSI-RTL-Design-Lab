//Verilog COde for Binary to Gray code converter and vice versa

module bin_to_gray #(parameter width=4)(
    input [width-1:0]bin_in,
    output reg [width-1:0] gray_out
);
integer i;
    always@(*) begin
        gray_out[width-1] = bin_in[width-1];
        for (i=width-1; i>0; i=i-1) begin
            gray_out[i-1] = bin_in[i]^bin_in[i-1];
        end
    end
endmodule

module gray_to_bin #(parameter width=4)(
    input [width-1:0]gray_in,
    output reg [width-1:0] bin_out
);
integer j;
    always@(*) begin
        bin_out[width-1] = gray_in[width-1];
            for (j=0; j<width; j=j+1) begin
                bin_out[width-2-j] = bin_out[width-1-j]^(gray_in[width-2-j]);
            end
    end

endmodule