module led_test(led1, led2, led3, led4, dig1, dig2, dig3, dig4, seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7);
	output led1, led2, led3, led4;
	output dig1, dig2, dig3, dig4;
	output seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7;
	
	assign led1 = 1'b0;
	assign led2 = 1'b0;
	assign led3 = 1'b0;
	assign led4 = 1'b0;
	
	assign dig1 = 1'b0;
	assign dig2 = 1'b0;
	assign dig3 = 1'b0;
	assign dig4 = 1'b0;
	
	assign seg0 = 1'b1;
	assign seg1 = 1'b0;
	assign seg2 = 1'b0;
	assign seg3 = 1'b1;
	assign seg4 = 1'b1;
	assign seg5 = 1'b0;
	assign seg6 = 1'b0;
	assign seg7 = 1'b1;
endmodule