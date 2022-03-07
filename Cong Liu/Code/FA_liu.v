`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:18 08/05/2020 
// Design Name: 
// Module Name:    FA_liu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FA_liu(
    input A,
    input B,
    input a,
    input b,
    output S,
    output E
    );

xnor g1(k,A,B);
nand g2(l,a,b);

nand g3(S,k,l);
nor g4(E,k,l);

endmodule
