`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:59 08/29/2022 
// Design Name: 
// Module Name:    cla_4bits 
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



	

module cla_4bits(input[3:0] in1, input[3:0] in2, input cin, output[3:0] sum, output cout);

/*
	Main Logic used to design a CLA:
	
	We define,
	G = bitwise AND of in1 and in2 (G is called Generate)
	P = bitwise XOR of in1 and in2 (P is called Propagate)
	Therefore, 
	For all i belonging to [0,3],  G[i] = in1[i] AND in2[i]
	For all i belonging to [0,3],  P[i] = in1[i] ^ in2[i]	
	
	We Know,
	carry[i] = G[i-1] | (P[i-1] & carry[i-1]), for all i belonging to [1,4]
	also, carry[0] = cin

	
	The above two equations can be recursively expanded to get the following,
	carry[1] = G[0] | (P[0] & carry[0]) = G[0] | (P[0] & cin)
	carry[2] = G[1] | (P[1] & carry[1]) = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin)
	carry[3] = G[2] | (P[2] & carry[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin)
	carry[4] = G[3] | (P[3] & carry[3]) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin)

	Now,
	sum[i] = in1[i]^in2[i]^carry[i] = P[i]^carry[i], for all i belonging to [0,3]	
	Therefore, sum can be calculated by taking bitwise XOR of P with carry 
	
*/
	// wires for Generate, Propagate and subsequent carries
	wire[3:0] G, P, carry;
	
	// Generate = bitwise AND of in1 and in2
	assign G = in1 & in2;
	
	// Propagate = bitwise XOR of in1 and in2
	assign P = in1 ^ in2;
	
	// calculate all the carries
	assign carry[0] = cin;
	assign carry[1] = G[0] | (P[0] & cin);
	assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
	assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
	assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
	
	// final sum = bitwise XOR of propagate and carry
	assign sum = P ^ carry;
	
endmodule
