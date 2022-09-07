`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:38 08/30/2022
// Design Name:   cla_16bits_LCU
// Module Name:   /home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3/cla_16bits_LCU/cla_16bits_LCU_TestBench.v
// Project Name:  cla_16bits_LCU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_16bits_LCU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_16bits_LCU_TestBench;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] in1;
	reg [15:0] in2;
	reg cin;

	// Outputs
	wire [15:0] sum;
	wire cout;
	wire P;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	wrapper uut (
		.clk(clk), 
		.rst(rst),
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout),
		.P(P),
		.G(G)
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
		$monitor ("input1 = %d, input2 = %d, Carry in = %d, sum = %d, Carry out = %d, P = %d, G = %d", in1, in2, cin, sum, cout, P, G);
		
		
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

