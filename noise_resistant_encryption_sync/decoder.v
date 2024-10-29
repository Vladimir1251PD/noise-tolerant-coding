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
	 
	 reg [2:0] state;
	 reg [11:0] S_vector;
	 reg [23:0] B_vector;
	 reg [23:0] output_vector_reg;
	 
	 wire [23:0] error_vector;
	 
	 
	 initial
	 begin
		state = 0;
		ready = 0;
		finish = 0;
		S_vector = 0;
		B_vector = 0;
	 end
	 
	 
always@(posedge clk)
begin
	case(state)
		0://состояние умножения на матрицу
			begin
				finish <= 0;
				if(enable)
				begin
					S_vector[11] <= input_vector[23] ^ input_vector[22] ^ input_vector[21] ^ input_vector[20] ^ input_vector[19] ^ input_vector[18] ^ input_vector[17] ^ input_vector[16] ^ input_vector[15] ^ input_vector[14] ^ input_vector[13] ^ input_vector[11];
					S_vector[10] <= input_vector[23] ^ input_vector[21] ^ input_vector[17] ^ input_vector[16] ^ input_vector[15] ^ input_vector[13] ^ input_vector[12] ^ input_vector[10];
					S_vector[9] <= input_vector[23] ^ input_vector[22] ^ input_vector[20] ^ input_vector[16] ^ input_vector[15] ^ input_vector[14] ^ input_vector[12] ^ input_vector[9];
					S_vector[8] <= input_vector[22] ^ input_vector[21] ^ input_vector[19] ^ input_vector[15] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[8];
					S_vector[7] <= input_vector[23] ^ input_vector[21] ^ input_vector[20] ^ input_vector[18] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[7];
					S_vector[6] <= input_vector[23] ^ input_vector[22] ^ input_vector[20] ^ input_vector[19] ^ input_vector[17] ^ input_vector[13] ^ input_vector[12] ^ input_vector[6];
					S_vector[5] <= input_vector[23] ^ input_vector[22] ^ input_vector[21] ^ input_vector[19] ^ input_vector[18] ^ input_vector[16] ^ input_vector[12] ^ input_vector[5];
					S_vector[4] <= input_vector[22] ^ input_vector[21] ^ input_vector[20] ^ input_vector[18] ^ input_vector[17] ^ input_vector[15] ^ input_vector[12] ^ input_vector[4];
					S_vector[3] <= input_vector[21] ^ input_vector[20] ^ input_vector[19] ^ input_vector[17] ^ input_vector[16] ^ input_vector[14] ^ input_vector[12] ^ input_vector[3];
					S_vector[2] <= input_vector[20] ^ input_vector[19] ^ input_vector[18] ^ input_vector[16] ^ input_vector[15] ^ input_vector[13] ^ input_vector[12] ^ input_vector[2];
					S_vector[1] <= input_vector[23] ^ input_vector[19] ^ input_vector[18] ^ input_vector[17] ^ input_vector[15] ^ input_vector[14] ^ input_vector[12] ^ input_vector[1];
					S_vector[0] <= input_vector[22] ^ input_vector[18] ^ input_vector[17] ^ input_vector[16] ^ input_vector[14] ^ input_vector[13] ^ input_vector[12] ^ input_vector[0];
					state <= 3'b001;
					ready <= 0;
				end
				else
				begin
					ready <= 1;
				end
			end
		3'b001://ссостояние получения вектора исправлений
		 begin
				state <= 3'b010;
		 end
		3'b010://состояние сложения с исправленным вектором, если не получил ошибку
			begin
				output_vector_reg <= error_vector ^ input_vector;
				finish <= 1;
				state <= 0;
			end
	endcase
end
assign output_vector = output_vector_reg[23:12];

RAM RAM_1(
	.clk(clk),
	.address(S_vector),
	.output_reg(error_vector)
);





endmodule
