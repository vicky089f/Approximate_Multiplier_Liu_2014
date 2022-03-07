`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:57 08/05/2020 
// Design Name: 
// Module Name:    mul_liu 
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
module mul_liu(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P
    );

wire [7:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
wire [8:0] Q1;
wire [10:2] Q2;
wire [12:4] Q3;
wire [14:6] Q4;
wire [10:0] Q5;
wire [14:4] Q6;
wire [14:0] Q7;
wire [8:1] E1;
wire [10:3] E2;
wire [12:5] E3;
wire [14:7] E4;
wire [9:2] E5;
wire [13:6] E6;
wire [11:4] E7;
wire [14:11] E;
wire [14:12] C;


and g1[7:0](PP1,A,B[0]);
and g2[7:0](PP2,A,B[1]);
and g3[7:0](PP3,A,B[2]);
and g4[7:0](PP4,A,B[3]);
and g5[7:0](PP5,A,B[4]);
and g6[7:0](PP6,A,B[5]);
and g7[7:0](PP7,A,B[6]);
and g8[7:0](PP8,A,B[7]);

genvar i;

//Stage 1

assign Q1[0] = PP1[0];
FA_liu f1(PP1[1],PP2[0],PP1[0],1'b0,Q1[1],E1[1]);

for(i=2;i<=7;i=i+1) begin: A1
	FA_liu F1(PP1[i],PP2[i-1],PP1[i-1],PP2[i-2],Q1[i],E1[i]);
end
FA_liu ff1(1'b0,PP2[7],PP1[7],PP2[6],Q1[8],E1[8]);


assign Q2[2] = PP3[0];
FA_liu f2(PP3[1],PP4[0],PP3[0],1'b0,Q2[3],E2[3]);

for(i=4;i<=9;i=i+1) begin: A2
	FA_liu F2(PP3[i-2],PP4[i-3],PP3[i-3],PP4[i-4],Q2[i],E2[i]);
end
FA_liu ff2(1'b0,PP4[7],PP3[7],PP4[6],Q2[10],E2[10]);


assign Q3[4] = PP5[0];
FA_liu f3(PP5[1],PP6[0],PP5[0],1'b0,Q3[5],E3[5]);

for(i=6;i<=11;i=i+1) begin: A3
	FA_liu F3(PP5[i-4],PP6[i-5],PP5[i-5],PP6[i-6],Q3[i],E3[i]);
end
FA_liu ff3(1'b0,PP6[7],PP5[7],PP6[6],Q3[12],E3[12]);


assign Q4[6] = PP7[0];
FA_liu f4(PP7[1],PP8[0],PP7[0],1'b0,Q4[7],E4[7]);

for(i=8;i<=13;i=i+1) begin: A4
	FA_liu F4(PP7[i-6],PP8[i-7],PP7[i-7],PP8[i-8],Q4[i],E4[i]);
end
FA_liu ff4(1'b0,PP8[7],PP7[7],PP8[6],Q4[14],E4[14]);

//Stage 2

assign Q5[1:0] = Q1[1:0];
FA_liu f5(Q1[2],Q2[2],Q1[1],1'b0,Q5[2],E5[2]);

for(i=3;i<=8;i=i+1) begin: A5
	FA_liu F5(Q1[i],Q2[i],Q1[i-1],Q2[i-1],Q5[i],E5[i]);
end
FA_liu ff5(1'b0,Q2[9],Q1[8],Q2[8],Q5[9],E5[9]);
assign Q5[10] = Q2[10];


assign Q6[5:4] = Q3[5:4];
FA_liu f6(Q3[6],Q4[6],Q3[5],1'b0,Q6[6],E6[6]);

for(i=7;i<=12;i=i+1) begin: A6
	FA_liu F6(Q3[i],Q4[i],Q3[i-1],Q4[i-1],Q6[i],E6[i]);
end
FA_liu ff6(1'b0,Q4[13],Q3[12],Q4[12],Q6[13],E6[13]);
assign Q6[14] = Q4[14];

//Stage 3

assign Q7[3:0] = Q5[3:0];
FA_liu f7(Q5[4],Q6[4],Q5[3],1'b0,Q7[4],E7[4]);

for(i=5;i<=10;i=i+1) begin: A7
	FA_liu F7(Q5[i],Q6[i],Q5[i-1],Q6[i-1],Q7[i],E7[i]);
end
FA_liu ff7(1'b0,Q6[11],Q5[10],Q6[10],Q7[11],E7[11]);

assign Q7[12] = Q6[12];
assign Q7[13] = Q6[13];
assign Q7[14] = Q6[14];

//Error Correction
or gg1(E[11],E3[11],E4[11],E6[11],E7[11]);
or gg2(E[12],E3[12],E4[12],E6[12]);
or gg3(E[13],E4[13],E6[13]);
assign E[14] = E4[14];

assign P[10:0] = Q7[10:0];
HA h1(Q7[11],E[11],P[11],C[12]);
FA h2(Q7[12],E[12],C[12],P[12],C[13]);
FA h3(Q7[13],E[13],C[13],P[13],C[14]);
FA h4(Q7[14],E[14],C[14],P[14],P[15]);

endmodule
