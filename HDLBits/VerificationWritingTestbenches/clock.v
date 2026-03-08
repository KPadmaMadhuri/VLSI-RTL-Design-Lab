module top_module ( );
    
    reg clk = 0;
    always #5 clk = ~clk;
    
    dut d1(clk);
    

endmodule
