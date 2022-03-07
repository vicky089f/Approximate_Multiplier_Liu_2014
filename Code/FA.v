`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:52 08/05/2020 
// Design Name: 
// Module Name:    FA 
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
module FA(
    input a,
    input b,
    input c,
    output sum,
    output carry
    );

HA h1(a,b,s,c1);
HA h2(s,c,sum,c2);
or g1(carry,c1,c2);

endmodule
