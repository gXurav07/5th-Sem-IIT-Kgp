`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:57:26 08/24/2022
// Design Name:   multiplexer
// Module Name:   /home/gaurav/edd/test_mux.v
// Project Name:  edd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplexer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux;

	// Inputs
	reg x;
	reg y;
	reg sel;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	multiplexer uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		x=~x;
		
		#10 y=~y;
		#10 sel=~sel;
		#10 x=~x;
		
		$finish;
		

	end
      
endmodule

