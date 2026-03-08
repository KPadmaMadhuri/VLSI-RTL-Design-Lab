//vERILOG MODULE TO CONVERT BINARY NUMBER TO BCD USING DOUBLE DABBLE ALGORITHM (SHIFT AND ADD THREE)

module bin_to_bcd #(parameter BIN_WIDTH = 8, parameter BCD_WIDTH = 12) (
    input  [BIN_WIDTH-1:0] binary,
    output reg [BCD_WIDTH-1:0] bcd
);
    integer i, j;
    
    always @(*) begin
        bcd = 0; 
        for (i = BIN_WIDTH-1; i >= 0; i = i - 1) begin
            for (j = 0; j < BCD_WIDTH; j = j + 4) begin
                if (bcd[j +: 4] >= 5)
                    bcd[j +: 4] = bcd[j +: 4] + 3;
            end
            bcd = {bcd[BCD_WIDTH-2:0], binary[i]};
        end
    end
endmodule