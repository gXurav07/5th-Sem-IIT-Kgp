`timescale 1ns / 1ps
/*

    Assignment 3

    Question 2

    Group 15

    Gaurav Malakar - 20CS10029

    Prakhar Singh - 20CS10045

*/

//////////////////////////////////////////////////////////////////////////////////
module cla_16bits_Ripple(input [15:0] in1, input [15:0] in2, input cin, output [15:0] sum, output cout);
    /*
      Input and output ports:

      in1 - first input of 16-bit

      in2 - second input of 16-bit

      cin - input carry bit

      sum - output of 16-bit storing sum

      cout - output carry bit
		
      Here, we get sum for each block of consecutive 4 bits starting from the least significant one and
      send the carry out from each block to the block in front of it to be used as carry in for that block.
      i.e. carry_in for block i = carry_out of block i-1

    */


    wire [2:0] carry;


    // Instantiate 4 cascaded 4-bit carry look-ahead adders

    cla_4bits cla1(in1[3:0], in2[3:0], cin, sum[3:0], carry[0]);
    cla_4bits cla2(in1[7:4], in2[7:4], carry[0], sum[7:4], carry[1]);
    cla_4bits cla3(in1[11:8], in2[11:8], carry[1], sum[11:8], carry[2]);
    cla_4bits cla4(in1[15:12], in2[15:12], carry[2], sum[15:12], cout);


endmodule
