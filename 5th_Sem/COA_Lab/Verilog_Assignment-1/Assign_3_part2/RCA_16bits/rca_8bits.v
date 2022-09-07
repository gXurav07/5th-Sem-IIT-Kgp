`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:46 08/25/2022 
// Design Name: 
// Module Name:    rca_8bits 
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
module rca_8bits(input[7:0] in1, input[7:0] in2, input cin, output[7:0] out, output cout);
	wire carry0, carry1, carry2, carry3, carry4, carry5, carry6;

	full_addr fa1(in1[0],in2[0],cin,out[0],carry0);
	full_addr fa2(in1[1],in2[1],carry0,out[1],carry1);
	full_addr fa3(in1[2],in2[2],carry1,out[2],carry2);
	full_addr fa4(in1[3],in2[3],carry2,out[3],carry3);
	full_addr fa5(in1[4],in2[4],carry3,out[4],carry4);
	full_addr fa6(in1[5],in2[5],carry4,out[5],carry5);
	full_addr fa7(in1[6],in2[6],carry5,out[6],carry6);
	full_addr fa8(in1[7],in2[7],carry6,out[7],cout);
	
endmodule
