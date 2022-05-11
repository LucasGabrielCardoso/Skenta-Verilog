`timescale 1ns/1ns
module key_led_tb();
	
	reg	rst_n;
	reg	clk;
	reg	key;
	wire	led;
	
	key_led u1(.rst_n(rst_n), 
				  .clk(clk), 
				  .key(key), 
				  .led(led)
				  );
	initial
	begin
		rst_n	=1'b0;
		clk	=1'b0;
		key	=1'b1;
		
		#100	rst_n	=1'b1;
		#100	key	=1'b1;
		#100	key	=1'b0;
		#100	key	=1'b1;
		#100	key	=1'b0;
		$stop;	
	end
	
	always #10 clk=~clk;
endmodule