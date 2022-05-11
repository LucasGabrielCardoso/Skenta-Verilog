`timescale 1ns/1ns
module counter_tb();
	reg	clk;
	reg	rst_n;
	wire	led;
	
	counter u1(.clk(clk),
				  .rst_n(rst_n),
				  .led(led));
	 initial
	 begin
		clk	= 0;
		rst_n = 0;
		#100 rst_n	=	1;
		#2_000_000_000;
		$stop;
	 end
	 
	 always #10 clk=~clk;
	 
endmodule