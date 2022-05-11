module top_down(clk, rst_n, led);
	input			clk;
	input			rst_n;
	output[3:0] led;
	
	wire clk_1s;
	
	clk_div	clk_div(
							.clk(clk),
							. rst_n(rst_n),
							.clk_1s(clk_1s)
							);
							
	led_water	led_water(
								 .clk(clk_1s),
								 .rst_n(rst_n),
								 .led(led)
								);
								
	
endmodule