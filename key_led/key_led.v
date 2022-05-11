module key_led(rst_n, clk, key, led);
	input			rst_n;
	input			clk;
	input			key;
	output reg	led;
	
	always @ (posedge clk, negedge rst_n)
	begin
		if(!rst_n)		led <= 1'b1;
		else if(!key)	led <= 1'b0;
		else 				led <= 1'b1;
	end
endmodule