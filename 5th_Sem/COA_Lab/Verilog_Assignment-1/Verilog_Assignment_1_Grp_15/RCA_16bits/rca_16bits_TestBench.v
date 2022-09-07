`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:09 08/25/2022
// Design Name:   rca_16bits
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/RCA_16bits/rca_16bits_TestBench.v
// Project Name:  RCA_16bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_16bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_16bits_TestBench;
	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg cin;

	// Outputs
	wire [15:0] out;
	wire cout;


	// Instantiate the Unit Under Test (UUT)
	rca_16bits uut (
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
		in1 = 16'd1117; in2 = 16'd232; cin = 0;
		#100;
		
		in1 = 16'd55123; in2 = 16'd6452; cin = 1;
		#100;
		
		in1 = 16'd46143; in2 = 16'd10000; cin = 0;
		#100;
		
		in1 = 16'd12; in2 = 16'd10; cin=1;
		#100
		
		in1 = 16'd65535; in2 = 16'd1; cin = 0;
		#100;

	end
      
endmodule

