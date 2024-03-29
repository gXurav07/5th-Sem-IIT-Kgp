`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:31:31 08/26/2022
// Design Name:   rca_64bits
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/RCA_64bits/rca_64bits_TestBench.v
// Project Name:  RCA_64bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_64bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_64bits_TestBench;
	// Inputs
	reg signed[63:0] in1;
	reg signed[63:0] in2;
	reg cin;

	// Outputs
	wire signed[63:0] out;
	wire cout;


	// Instantiate the Unit Under Test (UUT)
	rca_64bits uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
        
		// Add stimulus here
		$monitor ("input1 = %d, input2 = %d, carry_in = %d, sum = %d, carry_out = %d", in1, in2, cin, out, cout);
		// Initialize Inputs
		in1 = 64'd11171111111111111; in2 = 64'd23211113333333; cin = 0;
		#100;
		
		in1 = 64'd100000000000000000; in2 = ~(64'd500000000000000000); cin = 1;
		#100;
		
		in1 = 64'd4614334343322334; in2 = 64'd1000000000000; cin = 0;
		#100;
		
		in1 = 64'd5; in2 = 64'd3; cin=1;
		#100
		
		in1 = 64'd18446744073709551615; in2 = 64'd1; cin = 0;
		#100;

	end
      
endmodule

