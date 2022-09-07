`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:36:02 08/30/2022
// Design Name:   cla_4bits_augmented
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/cla_4bits_augmented/cla_4bits_augmented_TestBench.v
// Project Name:  cla_4bits_augmented
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
		$monitor ("in1 = %d, in2 = %d, c_in = %d, sum = %d, p = %d, g = %d", in1, in2, cin, sum, p, g);
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in1 = 4'd7; in2 = 4'd1; cin = 0;
		#100;
		
		in1 = 4'd3; in2 = 4'd6; cin = 1;
		#100;
		
	   in1 = 4'd3; in2 = 4'd10; cin = 0;
		#100;
		
		in1 = 4'd12; in2 = 4'd2; cin = 0;
		#100;
		
	end


      
endmodule

