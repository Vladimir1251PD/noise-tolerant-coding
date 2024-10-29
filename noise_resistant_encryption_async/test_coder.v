`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:51:40 05/08/2024
// Design Name:   coder
// Module Name:   C:/Users/User/noise_resistant_encryption/test_coder.v
// Project Name:  noise_resistant_encryption
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: coder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_coder;

	// Inputs
	reg [11:0] input_vector;
	reg enable;

	// Outputs
	wire [23:0] output_vector;

	// Instantiate the Unit Under Test (UUT)
	coder coder_1(
		.input_vector(input_vector), 
		.enable(enable), 
		.output_vector(output_vector)
	);

	initial begin
		// Initialize Inputs
		input_vector = 0;
		enable = 1;
		// Wait 100 ns for global reset to finish
		#100;
      input_vector = 12'b000011110000;
		// Add stimulus here

	end
      
endmodule

