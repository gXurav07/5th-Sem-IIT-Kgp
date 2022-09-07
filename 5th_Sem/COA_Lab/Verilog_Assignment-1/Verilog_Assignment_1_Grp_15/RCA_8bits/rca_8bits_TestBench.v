`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:53 08/25/2022
// Design Name:   rca_8bits
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/rca_8bits/rca_8bits_TestBench.v
// Project Name:  rca_8bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_8bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_8bits_TestBench;

	// Inputs
	reg [7:0] in1;
	reg [7:0] in2;
	reg cin;

	// Outputs
	wire [7:0] out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	rca_8bits uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor ("input1 = %d, input2 = %d, carry_in = %d, sum = %d, carry_out = %d", in1, in2, cin, out, cout);
		// Initialize Inputs
		in1 = 8'd17; in2 = 8'd112; cin = 0;
		#100;
		
		in1 = 8'd123; in2 = 8'd42; cin = 1;
		#100;
		
		in1 = 8'd143; in2 = 8'd107; cin = 0;
		#100;
		
		in1 = 8'd120; in2 = 8'd110; cin=1;
		#100
		
		in1 = 8'd255; in2 = 8'd1; cin = 0;
		#100;
		

		
		

	end
      
endmodule

