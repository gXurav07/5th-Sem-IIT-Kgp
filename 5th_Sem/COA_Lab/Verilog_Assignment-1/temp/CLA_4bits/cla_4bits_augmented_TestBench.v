`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:31:53 08/30/2022
// Design Name:   cla_4bits_augmented
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/CLA_4bits/cla_4bits_augmented_TestBench.v
// Project Name:  CLA_4bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_4bits_augmented
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_4bits_augmented_TestBench;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire p;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	cla_4bits_augmented uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.p(p), 
		.g(g)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

