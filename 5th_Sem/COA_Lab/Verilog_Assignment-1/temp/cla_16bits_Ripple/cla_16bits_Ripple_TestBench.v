`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:02:29 08/30/2022
// Design Name:   cla_16bits_Ripple
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/cla_16bits_Ripple/cla_16bits_Ripple_TestBench.v
// Project Name:  cla_16bits_Ripple
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_16bits_Ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_16bits_Ripple_TestBench;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg cin;

	// Outputs
	wire [15:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	cla_16bits_Ripple uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);
	initial begin
		$monitor ("input1 = %d, input2 = %d, Carry in = %d, sum = %d, Carry out = %d", in1, in2, cin, sum, cout);
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		in1 = 16'd437; in2 = 16'd341; cin = 0;
		#100;
		
		in1 = 16'd3500; in2 = 16'd6010; cin = 1;
		#100;
		
	   in1 = 16'd3000; in2 = 16'd1040; cin = 0;
		#100;
		
		in1 = 16'd146; in2 = 16'd244; cin = 0;
		#100;

	end
      
endmodule

