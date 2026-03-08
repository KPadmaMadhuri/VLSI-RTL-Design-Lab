//Modules - Modules
//http://hdlbits.01xz.net/wiki/Module

module top_module ( input a, input b, output out );
    mod_a dut(.out(out), .in1(a), .in2(b));
endmodule
