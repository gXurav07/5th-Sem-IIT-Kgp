`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:21 08/31/2022 
// Design Name: 
// Module Name:    wrapper 
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
module wrapper( input clk, input rst,
	input[3:0] in1, input[3:0] in2, input cin, output reg[3:0] sum, output reg cout
    );

	reg [3:0] in1_reg;
	reg [3:0] in2_reg;
	reg cin_reg;
	wire [3:0] sum_net;
	wire cout_net;
	
	
	always @(posedge clk)
		 begin
			  if(rst)
					begin
						 in1_reg<=4'd0;
						 in2_reg<=4'd0;
						 cin_reg<=0;
						 
						 sum<=4'd0;
						 cout<=0;
					end
			  else
					begin
						 in1_reg<=in1;
						 in2_reg<=in2;
						 cin_reg<=cin;
						 sum<=sum_net;
						 cout<=cout_net;
					end
		 end

cla_4bits cla(in1_reg, in2_reg, cin_reg, sum_net, cout_net);


endmodule
