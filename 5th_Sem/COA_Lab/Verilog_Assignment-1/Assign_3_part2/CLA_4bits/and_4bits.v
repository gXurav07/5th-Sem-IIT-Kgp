`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:14 08/29/2022 
// Design Name: 
// Module Name:    and_4bits 
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
module and_4bits(input[3:0] A, input[3:0] B, output[3:0] G);
	and g0(G[0], A[0], B[0]);
	and g1(G[1], A[1], B[1]);
	and g2(G[2], A[2], B[2]);
	and g3(G[3], A[3], B[3]);
endmodule


