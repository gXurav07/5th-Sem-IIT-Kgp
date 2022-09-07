`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:19:34 08/31/2022
// Design Name:   wrapper
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/RCA_4bits/rca_4bits_TestBench.v
// Project Name:  RCA_4bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wrapper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_4bits_TestBench;
	// Inputs
	reg clk;
	reg rst;
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] out;
	wire cout;


	// Instantiate the Unit Under Test (UUT)
	wrapper uut (
		.clk(clk), 
		.rst(rst), 
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
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
		$monitor ("input1 = %d, input2 = %d, carry_in = %d, sum = %d, carry_out = %d", in1, in2, cin, out, cout);
		// Initialize Inputs
		in1 = 4'd11; in2 = 4'd2; cin = 0;
		#100;
		
		in1 = 4'd5; in2 = 4'd6; cin = 1;
		#100;
		
		in1 = 4'd4; in2 = 16'd10; cin = 0;
		#100;
		
		in1 = 4'd12; in2 = 4'd3; cin=1;
		#100;
		end
endmodule

