`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:05 08/26/2022 
// Design Name: 
// Module Name:    rca_64bits 
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
module rca_64bits(input[63:0] in1, input[63:0] in2, input cin, output[63:0] out, output cout);
	wire carry;
	rca_32bits addr1(in1[31:0],in2[31:0],cin,out[31:0],carry);
	rca_32bits addr2(in1[63:32],in2[63:32],carry,out[63:32],cout);
endmodule
