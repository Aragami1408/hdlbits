// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
	input [31:0] a,
	input [31:0] b,
	input sub,
	output [31:0] sum);

	wire [31:0] b_sub;
	wire [15:0] sum_lo, sum_hi;
	wire cout_lo, cout_hi;

	assign b_sub = b ^ {32{sub}};

	add16 lo(a[15:0], b_sub[15:0], sub, sum_lo, cout_lo);
	add16 hi(a[31:16], b_sub[31:16], cout_lo, sum_hi, cout_hi);

	assign sum = {sum_hi, sum_lo};

endmodule
