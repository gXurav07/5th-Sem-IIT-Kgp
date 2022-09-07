`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:48 08/30/2022 
// Design Name: 
// Module Name:    cla_4bits_augmented 
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
module cla_4bits_augmented(
    input [3:0] in1,
    input [3:0] in2,
    input cin,
    output [3:0] sum,
    output p,
    output g
	 );
	 
/*
	Sum and carry are calculated similar to cla_4bits (all explanation provided there)
	
	Block propogate p and block generate g are calculated as,
	p = P[3] & P[2] & P[1] & P[0]
	g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])
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
	
	
	// final sum = bitwise XOR of propagate and carry
	assign sum = P ^ carry;
	
	// Block propagate and Block generate 
	assign p = P[3] & P[2] & P[1] & P[0];
	assign g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);


endmodule
    


