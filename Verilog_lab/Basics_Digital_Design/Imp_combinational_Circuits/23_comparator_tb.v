module comparator_tb;

reg [3:0]A,B;
wire gr, ls, eq;
integer i;
comparator dut (.A(A), .B(B), .gr(gr), .ls(ls), .eq(eq));

initial begin

    for (i=0;i<10;i=i+1) begin
        A=$random;
        B=$random;
        #1;
        $display("A=%b, B=%b, gr=%b, eq=%b, ls=%b", A,B,gr,eq,ls);
        if(((A>B)&(gr==1)) | ((A==B)&(eq==1)) | ((A<B)&(ls==1))) begin
            $display("PASS");
        endp -
    end
end

endmodule