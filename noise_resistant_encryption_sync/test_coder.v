`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:34 05/14/2024
// Design Name:   coder
// Module Name:   C:/Users/User/Desktop/encryption/noise_resistant_encryption_sync/test_coder.v
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
	reg clk;

	// Outputs
	wire [23:0] output_vector;
	wire ready;
	wire finish;

	// Instantiate the Unit Under Test (UUT)
	coder uut (
		.input_vector(input_vector), 
		.enable(enable), 
		.clk(clk), 
		.output_vector(output_vector), 
		.ready(ready), 
		.finish(finish)
	);

	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		input_vector = 0;
		enable = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		input_vector = 12'h0f0;
		enable = 1;
      #100;  
		// Add stimulus here

	end
      
endmodule

