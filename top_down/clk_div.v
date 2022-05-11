module clk_div(clk, rst_n, clk_1s);
	input			clk;
	input			rst_n;
	output reg	clk_1s;
	
	reg[25:0]	cnt;
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)							cnt	<=	26'b0;
		else if(cnt==26'd24_999)	cnt	<=	26'b0;
		else									cnt	<= cnt+1;
	end
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)							clk_1s	<= 1'b0;
		else if(cnt==26'd24_999)	clk_1s	<=	~clk_1s;
		else									clk_1s	<=	clk_1s;
	end
endmodule