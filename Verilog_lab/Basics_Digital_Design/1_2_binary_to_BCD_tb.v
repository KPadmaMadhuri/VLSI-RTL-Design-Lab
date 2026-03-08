module binaty_bcd_tb();
parameter BIN_WIDTH=8;
parameter BCD_WIDTH = 12;

reg [BIN_WIDTH-1:0]bin;
wire [BCD_WIDTH-1:0]bcd;

bin_to_bcd #(BIN_WIDTH, BCD_WIDTH)dut (.binary(bin), .bcd(bcd));

initial begin
    $monitor("Bin = %b, bcd = %b", bin, bcd);
    repeat (10) begin
        bin = $random;
        #10;
    end
end
endmodule