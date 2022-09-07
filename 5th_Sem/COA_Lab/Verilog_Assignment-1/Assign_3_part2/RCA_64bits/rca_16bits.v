`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:38 08/25/2022 
// Design Name: 
// Module Name:    rca_16bits 
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
module rca_16bits(input[15:0] in1, input[15:0] in2, input cin, output[15:0] out, output cout);
	wire carry;
	rca_8bits addr1(in1[7:0],in2[7:0],cin,out[7:0],carry);
	rca_8bits addr2(in1[15:8],in2[15:8],carry,out[15:8],cout);
endmodule
