module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

	wire [15:0] sum_lo, sum_hi;
	wire cout_lo, cout_hi;
	wire [31:0] inverted_b;
	assign inverted_b = b ^ {32{sub}};

	add16 add_lo(a[15:0], inverted_b[15:0], sub, sum_lo, cout_lo);
	add16 add_hi(a[31:16], inverted_b[31:16], cout_lo, sum_hi, cout_hi);

	assign sum = {sum_hi, sum_lo};

endmodule
