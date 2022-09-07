`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:29:05 08/29/2022
// Design Name:   cla_4bits
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/CLA_4bits/cla_4bits_TestBench.v
// Project Name:  CLA_4bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_4bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_4bits_TestBench;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	wrapper uut (
		.clk(clk), 
		.rst(rst), 
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);
	
	initial begin
		// Initialize Inputs
		in1 <= 0;
		in2 <= 0;
		cin <= 0;
		rst <= 1'd1;
		clk <= 0;

		// Wait 100 ns for global reset to finish
		#100; rst <= 0;
	end
	
	always #10 clk=~clk;
	
	initial begin
	
        
		// Add stimulus here
		$monitor ("input1 = %d, input2 = %d, carry_in = %d, sum = %d, carry_out = %d", in1, in2, cin, sum, cout);

		

		
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

