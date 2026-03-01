/* Verilog Language - Basics */

//-------------------------------------------------------------

//Simple Wire - Wire
//https://hdlbits.01xz.net/wiki/Wire
//Description - Understanding Wire
/*
module top_module( input in, output out );
    assign out = in;
endmodule
*/

//-------------------------------------------------------------

//Four Wires - Wire4
https://hdlbits.01xz.net/wiki/Wire4
//Description - Understanding Wire
/*
module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
endmodule
*/

//-------------------------------------------------------------

//Inverter - Notgate
//https://hdlbits.01xz.net/wiki/Notgate
//Description - Inverter
/*
module top_module( input in, output out );
    assign out = ~in;
endmodule
*/

//-------------------------------------------------------------

//AND Gate - Andgate
//https://hdlbits.01xz.net/wiki/Andgate
//Description - Working of basic gates
/*
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = a&b;
endmodule
*/

//-------------------------------------------------------------

//NOR Gate - Norgate
//https://hdlbits.01xz.net/wiki/Norgate
//Description - Working of basic gates
/*
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a|b);
endmodule
*/

//-------------------------------------------------------------

//XNOR gate - Xnotgate
//https://hdlbits.01xz.net/wiki/Xnorgate
//Description - Working of basic gates
/*
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a^b);
endmodule
*/

//-------------------------------------------------------------

//Declaring Wires-Wire decl
//https://hdlbits.01xz.net/wiki/Wire_decl
//Description - how to declare intermediate wires
/*
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire w1, w2;
    assign w1 = a&b;
    assign w2 = c&d;
    assign out = w1|w2;
    assign out_n = ~out;
endmodule
*/

//-------------------------------------------------------------

//7458 Chip - 7458
//https://hdlbits.01xz.net/wiki/7458
//Description - HW Modelling of 7458 Chip
/*
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    assign p1y = (p1a&p1b&p1c)|(p1d&p1e&p1f);
    assign p2y = (p2a&p2b)|(p2c&p2d);
endmodule
*/

//-------------------------------------------------------------

