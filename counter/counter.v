module counter(clk, rst_n, led);
	input			clk;
	input			rst_n;
	output reg	led;
	
	reg [25:0] cnt;
	
	//Incremento do contador
	always @(posedge clk, negedge rst_n)
	begin
		if(rst_n==1'b0)						cnt<=26'b0;
		else if(cnt==26'd49_999_999)		cnt<=26'b0;
		else										cnt<=cnt+1;
	end
	
	//Piscando o led
	always @(posedge clk, negedge rst_n)
	begin
		if(rst_n==1'b0)						led<=1'b1;
		else if(cnt==26'd49_999_999)		led<=~led;
		else										led<=led;	
	end
endmodule