module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);

	wire [15:0] o1, o2;
	wire co1, co2;

	add16 a1(a[15:0], b[15:0], 1'b0,  o1, co1);
	add16 a2(a[31:16], b[31:16], co1, o2, co2);

	assign sum = {o2, o1};

endmodule
