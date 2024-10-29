// Verilog Test Fixture Template

  `timescale 1 ns / 1 ps

 module test_bench();
	
	
	reg clk;
	reg [11:0] address;
	wire [23:0] output_reg;
	
	RAM RAM_1(
	.clk(clk),
	.address(address),
	.output_reg(output_reg)
	);
	
	
	always #10 clk = ~clk;
	
	initial
	begin
		clk = 0;
		address = 0;
		#100;
		address = 12'd4073;
	end

endmodule