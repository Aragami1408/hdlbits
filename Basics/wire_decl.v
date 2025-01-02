`default_nettype none
module top_module(
		input a,
		input b,
		input c,
		input d,
		output out,
		output out_n);

	wire or1;
	wire or2;

	assign or1 = a & b;
	assign or2 = c & d;

	assign out = or1 | or2;
	assign out_n = ~(or1 | or2);

endmodule
