module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

	genvar i;

	generate
		for (i = 0; i < 400; i = i + 4) begin : whatever
			bcd_fadd b1(a[i+3:i], b[i+3:i], cin, cout, sum[i+3:i]);
		end
	endgenerate

endmodule
