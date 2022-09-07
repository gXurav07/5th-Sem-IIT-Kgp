`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:29 08/26/2022 
// Design Name: 
// Module Name:    rca_32bits 
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
module rca_32bits(input[31:0] in1, input[31:0] in2, input cin, output[31:0] out, output cout);
	wire carry;
	rca_16bits addr1(in1[15:0],in2[15:0],cin,out[15:0],carry);
	rca_16bits addr2(in1[31:16],in2[31:16],carry,out[31:16],cout);
endmodule
