`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:18:12 08/26/2022
// Design Name:   rca_32bits
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/RCA_32bits/rca_32bits_TestBench.v
// Project Name:  RCA_32bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_32bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_32bits_TestBench;
	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg cin;

	// Outputs
	wire [31:0] out;
	wire cout;


	// Instantiate the Unit Under Test (UUT)
	rca_32bits uut (
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
		in1 = 32'd1117; in2 = 32'd211132; cin = 0;
		#100;
		
		in1 = 32'd1155123; in2 = 32'd10000000; cin = 1;
		#100;
		
		in1 = 32'd1000000; in2 = 32'd2000000; cin = 0;
		#100;
		
		in1 = 32'd1; in2 = 32'd3; cin=1;
		#100
		
		in1 = 32'd4294967295; in2 = 32'd1; cin = 0;
		#100;

	end
      
      
endmodule

