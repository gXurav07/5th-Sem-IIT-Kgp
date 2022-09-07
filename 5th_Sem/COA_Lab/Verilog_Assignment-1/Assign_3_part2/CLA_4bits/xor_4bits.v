`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:44 08/29/2022 
// Design Name: 
// Module Name:    xor_4bits 
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
module xor_4bits(input[3:0] A, input[3:0] B, output[3:0] P);
	xor g0(P[0], A[0], B[0]);
	xor g1(P[1], A[1], B[1]);
	xor g2(P[2], A[2], B[2]);
	xor g3(P[3], A[3], B[3]);
endmodule

