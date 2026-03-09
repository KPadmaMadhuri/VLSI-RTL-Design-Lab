//Verilog COde for Binary to Gray code converter and vice versa testbench basic

module bin_gray_bin_tb;

parameter width=8;
reg [width-1:0]bin_in;
wire [width-1:0]gray;
wire [width-1:0] bin_out;

bin_to_gray #(width) dut1(.bin_in(bin_in), .gray_out(gray));
gray_to_bin #(width) dut2 (.gray_in(gray), .bin_out(bin_out));

initial begin
    $monitor("Bin_in = %b, Gray = %b, bin_out=%b", bin_in, gray, bin_out);
    repeat(10)begin
        bin_in = $random;
        #10;
    end
end

endmodule