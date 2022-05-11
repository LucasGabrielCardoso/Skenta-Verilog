`timescale 1ns/1ns
module led_water_tb();
	reg			clk;
	reg			rst_n;
	wire[3:0]	led;
	
	led_water u1(
					 .clk(clk),
					 .rst_n(rst_n),
					 .led(led)
					 );
	
	initial
	begin
		clk	=	1'b0;
		rst_n	=	1'b0;
		#100 rst_n = 1'b1;
		#10_000_000;
		$stop;
	end
	
	always #10 clk = ~clk;
endmodule