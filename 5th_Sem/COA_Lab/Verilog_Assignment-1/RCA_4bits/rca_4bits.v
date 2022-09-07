`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:23 08/31/2022 
// Design Name: 
// Module Name:    rca_4bits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rca_4bits(input[3:0] in1, input[3:0] in2, input cin, output[3:0] out, output cout);
	wire carry0, carry1, carry2;
	full_addr fa1(in1[0],in2[0],cin,out[0],carry0);
	full_addr fa2(in1[1],in2[1],carry0,out[1],carry1);
	full_addr fa3(in1[2],in2[2],carry1,out[2],carry2);
	full_addr fa4(in1[3],in2[3],carry2,out[3],cout);

endmodule
