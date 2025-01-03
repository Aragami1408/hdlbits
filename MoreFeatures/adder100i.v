
module full_adder( input a, input b, input cin, output sum, output cout );
	assign sum = a ^ b ^ cin;
	assign cout = (a&b) | (a&cin) | (b&cin);
endmodule

module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

	genvar i;

	full_adder fadd (a[0], b[0], cin, sum[0], cout[0]);
	generate
		for (i = 1; i < 100; i = i + 1) begin : generate_fadd_block
			full_adder u0 (a[i], b[i], cout[i-1], sum[i], cout[i]);
		end
	endgenerate

endmodule
