`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:29 04/17/2024 
// Design Name: 
// Module Name:    coder 
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
module coder(
	input [11:0] input_vector,
	input enable,
	input clk,
	output reg [23:0] output_vector,
	output reg ready,
	output reg finish
   );
	initial
	begin
		ready <= 1;
		finish <= 0;
		output_vector <= 0;
	end
	
	always @(posedge clk)
	begin
		if(enable)
			begin
				 output_vector[23] <= input_vector[11];
				 output_vector[22] <= input_vector[10];
				 output_vector[21] <= input_vector[9];
				 output_vector[20] <= input_vector[8];
				 output_vector[19] <= input_vector[7];
				 output_vector[18] <= input_vector[6];
				 output_vector[17] <= input_vector[5];
				 output_vector[16] <= input_vector[4];
				 output_vector[15] <= input_vector[3];
				 output_vector[14] <= input_vector[2];
				 output_vector[13] <= input_vector[1];
				 output_vector[12] <= input_vector[0];
				 output_vector[11] <= (input_vector[11] ^ input_vector[10] ^ input_vector[9] ^ input_vector[8] ^ input_vector[7] ^ input_vector[6] ^ input_vector[5] ^ input_vector[4] ^ input_vector[3] ^ input_vector[2] ^ input_vector[1]);
				 output_vector[10] <= (input_vector[11] ^ input_vector[9] ^ input_vector[5] ^ input_vector[4] ^ input_vector[3] ^ input_vector[1] ^ input_vector[0]);
				 output_vector[9] <= (input_vector[11] ^ input_vector[10] ^ input_vector[8] ^ input_vector[4] ^ input_vector[3] ^ input_vector[2] ^ input_vector[0]);
				 output_vector[8] <= (input_vector[10] ^ input_vector[9] ^ input_vector[7] ^ input_vector[3] ^ input_vector[2] ^ input_vector[1] ^ input_vector[0]);
				 output_vector[7] <= (input_vector[11] ^ input_vector[9] ^ input_vector[8] ^ input_vector[6] ^ input_vector[2] ^ input_vector[1] ^ input_vector[0]);
				 output_vector[6] <= (input_vector[11] ^ input_vector[10] ^ input_vector[8] ^ input_vector[7] ^ input_vector[5] ^ input_vector[1] ^ input_vector[0]);
				 output_vector[5] <= (input_vector[11] ^ input_vector[10] ^ input_vector[9] ^ input_vector[7] ^ input_vector[6] ^ input_vector[4] ^ input_vector[0]);
				 output_vector[4] <= (input_vector[10] ^ input_vector[9] ^ input_vector[8] ^ input_vector[6] ^ input_vector[5] ^ input_vector[3] ^ input_vector[0]);
				 output_vector[3] <= (input_vector[9] ^ input_vector[8] ^ input_vector[7] ^ input_vector[5] ^ input_vector[4] ^ input_vector[2] ^ input_vector[0]);
				 output_vector[2] <= (input_vector[8] ^ input_vector[7] ^ input_vector[6] ^ input_vector[4] ^ input_vector[3] ^ input_vector[1] ^ input_vector[0]);
				 output_vector[1] <= (input_vector[11] ^ input_vector[7] ^ input_vector[6] ^ input_vector[5] ^ input_vector[3] ^ input_vector[2] ^ input_vector[0]);
				 output_vector[0] <= (input_vector[10] ^ input_vector[6] ^ input_vector[5] ^ input_vector[4] ^ input_vector[2] ^ input_vector[1] ^ input_vector[0]);
				 ready <= 0;
				 finish <= 1;
			end
	end
	
	always@(posedge clk)
	begin
		if(finish == 1)
		begin
			ready <= 1;
			finish <= 0;
		end
	end
				

endmodule
