module beep(clk, rst_n, sound);
	input			clk;
	input			rst_n;
	output reg	sound;
	
	reg 			[25:0]counter;
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)									counter	<=	26'b0;
		else if(counter==26'd49_999_999)		counter	<= 26'b0;
		else 											counter	<= counter+1'b1;
	end
	
	always@(posedge counter[3], negedge rst_n)
	begin
		if(!rst_n)											sound		<=	1'b0;
		else													sound		<= (counter[16]&counter[20]&counter[25]);
	end
endmodule