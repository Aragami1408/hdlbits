module full_adder(
	input a, b, cin,
	output sum, cout);

	assign sum = a^b^cin;
	assign cout = (a&b)|(b&cin)|(a&cin);

endmodule

module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

	// Create a vector for the carry signals
	wire [99:0] c;
	full_adder f1(a[0], b[0], cin, sum[0], c[0]);

	genvar i;
	generate
		for (i = 1; i < 100; i = i + 1) begin : block
			full_adder f2(a[i], b[i], c[i-1], sum[i], c[i]);
		end
	endgenerate
	assign cout = c;
endmodule
