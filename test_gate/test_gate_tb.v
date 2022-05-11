`timescale 1ns/1ns
module test_gate_tb();
	reg	a;
	reg	b;
	wire	c;
	
	test_gate u1(.a(a),
					 .b(b),
					 .c(c));
	
	initial
	begin
		a=0; b=0;
		forever
		begin
			#20	a=1'b0; b=1'b0;
			#20 	a=1'b0; b=1'b1;
			#20 	a=1'b1; b=1'b0;
			#20 	a=1'b1; b=1'b1;
		end
	end
endmodule