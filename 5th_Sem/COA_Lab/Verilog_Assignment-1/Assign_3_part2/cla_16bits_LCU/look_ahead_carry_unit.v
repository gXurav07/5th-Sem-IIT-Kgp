`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

/*
    Assignment 3
    Question 2
    Group 15
    Gaurav Malakar - 20CS10029
    Prakhar Singh - 20CS10045
*/

//////////////////////////////////////////////////////////////////////////////////
module look_ahead_carry_unit(
    input cin,
    input[3:0] P,
    input[3:0] G,
    output[3:1]  carry,
	 output cout,
    output Pout,
    output Gout
    );

/*

	
	Assign cin to carry[0] 
	We know, carry[i] = G[i-1] | (P[i-1] & carry[i-1]), for all i belonging to [1,4]
	
	The above 2 equations form a recursive construct and expanding it we get,
	carry[1] = G[0] | (P[0] & cin))
	carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin))
	carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin))
	carry[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin))
	
	Block propogate Pout and Block generate Gout are obtained by,
	Pout = P[3] & P[2] & P[1] & P[0]
	Gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])
*/
	
	
	// calculate the lookahead carries using block propagate and generate from previous level
	assign carry[1] = G[0] | (P[0] & cin);
	assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
	assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
	assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
	
	// calculate the block propagate and block generate for the next level
	assign Pout = P[3] & P[2] & P[1] & P[0];
	assign Gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);


endmodule
