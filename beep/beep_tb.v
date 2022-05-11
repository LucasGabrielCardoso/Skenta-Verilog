`timescale 1ns/1ns
module beep_tb();
	reg	clk;
	reg	rst_n;
	wire 	sound;
	
	beep	u1(
			.clk(clk),
			.rst_n(rst_n),
			.sound(sound)
			);
		
	initial
	begin
		clk	=	1'b0;
		rst_n	=	1'b0;
		#100	rst_n	=	1'b1;
		#100_000_000;
		$stop;
	end
	
	always #10 clk=~clk;
		
endmodule