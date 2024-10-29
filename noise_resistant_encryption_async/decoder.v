`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:32 04/17/2024 
// Design Name: 
// Module Name:    decoder 
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

module decoder(
	input clk,
	input enable,
	input [23:0] input_vector,
	output [11:0] output_vector,
	output reg ready,
	output reg finish
    );
	 
	 wire [11:0] S_vector;
	 wire [23:0] output_vector_reg;
	 wire [23:0] error_vector;
	 
	 
	 initial
	 begin
		ready = 1;
		finish = 0;
		end
	 
	assign S_vector[11] = input_vector[23] ^ input_vector[22] ^ input_vector[21] ^ input_vector[20] ^ input_vector[19] ^ input_vector[18] ^ input_vector[17] ^ input_vector[16] ^ input_vector[15] ^ input_vector[14] ^ input_vector[13] ^ input_vector[11];
	assign S_vector[10] = input_vector[23] ^ input_vector[21] ^ input_vector[17] ^ input_vector[16] ^ input_vector[15] ^ input_vector[13] ^ input_vector[12] ^ input_vector[10];
	assign S_vector[9] = input_vector[23] ^ input_vector[22] ^ input_vector[20] ^ input_vector[16] ^ input_vector[15] ^ input_vector[14] ^ input_vector[12] ^ input_vector[9];
	assign S_vector[8] = input_vector[22] ^ input_vector[21] ^ input_vector[19] ^ input_vector[15] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[8];
	assign S_vector[7] = input_vector[23] ^ input_vector[21] ^ input_vector[20] ^ input_vector[18] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[7];
	assign S_vector[6] = input_vector[23] ^ input_vector[22] ^ input_vector[20] ^ input_vector[19] ^ input_vector[17] ^ input_vector[13] ^ input_vector[12] ^ input_vector[6];
	assign S_vector[5] = input_vector[23] ^ input_vector[22] ^ input_vector[21] ^ input_vector[19] ^ input_vector[18] ^ input_vector[16] ^ input_vector[12] ^ input_vector[5];
	assign S_vector[4] = input_vector[22] ^ input_vector[21] ^ input_vector[20] ^ input_vector[18] ^ input_vector[17] ^ input_vector[15] ^ input_vector[12] ^ input_vector[4];
	assign S_vector[3] = input_vector[21] ^ input_vector[20] ^ input_vector[19] ^ input_vector[17] ^ input_vector[16] ^ input_vector[14] ^ input_vector[12] ^ input_vector[3];
	assign S_vector[2] = input_vector[20] ^ input_vector[19] ^ input_vector[18] ^ input_vector[16] ^ input_vector[15] ^ input_vector[13] ^ input_vector[12] ^ input_vector[2];
	assign S_vector[1] = input_vector[23] ^ input_vector[19] ^ input_vector[18] ^ input_vector[17] ^ input_vector[15] ^ input_vector[14] ^ input_vector[12] ^ input_vector[1];
	assign S_vector[0] = input_vector[22] ^ input_vector[18] ^ input_vector[17] ^ input_vector[16] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[0];
						 

always@(posedge clk)
begin
	if(enable & ~finish)
	begin
		finish <= 1;
		ready <= 0;
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

RAM RAM_1(
	.clk(clk),
	.address(S_vector),
	.output_reg(error_vector)
);


assign output_vector_reg = error_vector ^ input_vector;
assign output_vector = output_vector_reg[23:12];


endmodule
