`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:00:32 05/08/2024
// Design Name:   decoder
// Module Name:   C:/Users/User/noise_resistant_encryption/test_decoder.v
// Project Name:  noise_resistant_encryption
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_decoder;

	// Inputs
	reg clk;
	reg enable;
	reg [23:0] input_vector;

	// Outputs
	wire [11:0] output_vector;
	wire ready;
	wire finish;

	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.clk(clk), 
		.enable(enable), 
		.input_vector(input_vector), 
		.output_vector(output_vector), 
		.ready(ready), 
		.finish(finish)
	);
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		enable = 0;
		input_vector = 0;

		// Wait 100 ns for global reset to finish
		#100;
      input_vector = 24'h0f03af;
		enable = 1;
		#100;
		input_vector = 0;
		enable = 0;
		#100;
		input_vector = 24'h0f73af;
		enable = 1;
		  
		// Add stimulus here

	end
      
endmodule

