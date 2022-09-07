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

// Carry look-ahead adder module of 16-bit using the look-ahead carry unit(LCU)
module cla_16bits_LCU(
	input[15:0] in1, 
	input[15:0] in2, 
	input cin, 
	output[15:0] sum, 
	output cout,
	output P, 
	output G
); 
/*
      Input and output ports:
      in1 - first input of 16-bit
      in2 - second input of 16-bit
      cin - input carry bit
      sum - output of 16-bit storing sum
      cout - output carry bit
      P - block propagate for the next level 
      G - block generate for the next level

		Here, we use a similar mechanism as we did for designing the 4 bits CLA, but here the 
		Propagate and Generate are taken for an entire block of 4 bits
		This is achieved with the help of a look ahead carry unit
		Theoretically, this method helps to limit the overall delay to 8 gate delay
*/ 
	 wire[3:0] p, g;
	 wire[3:1] carry;
	 cla_4bits_augmented cla1(in1[3:0], in2[3:0], cin, sum[3:0], p[0], g[0]);
	 cla_4bits_augmented cla2(in1[7:4], in2[7:4], carry[1], sum[7:4], p[1], g[1]);
	 cla_4bits_augmented cla3(in1[11:8], in2[11:8], carry[2], sum[11:8], p[2], g[2]);
	 cla_4bits_augmented cla4(in1[15:12], in2[15:12], carry[3], sum[15:12], p[3], g[3]);
	 
	 // Initialised the look-ahead carry unit
	 look_ahead_carry_unit lcu(cin, p, g, carry, cout, P, G);

endmodule

