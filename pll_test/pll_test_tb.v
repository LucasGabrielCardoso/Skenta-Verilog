`timescale 1ns/1ns
module pll_test_tb();
	reg	clk;
	reg	areset;
	wire	clk_25M;
	wire	clk_50M;
	wire	clk_75M;
	wire	clk_100M;
	wire	locked;
	
	pll_test	pll_test(
							.clk(clk),
							.areset(areset),
							.clk_25M(clk_25M),
							.clk_50M(clk_50M),
							.clk_75M(clk_75M),
							.clk_100M(clk_100M),
							.locked(locked)
							);
	initial
	begin
		clk		=1'b1;
		areset	=1'b1;
		#100		areset=1'b0;
		#2000;
		$stop;
	end
	
	always #10 clk=~clk;	
endmodule