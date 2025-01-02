//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
module top_module(
		input [31:0] a,
		input [31:0] b,
		output [31:0] sum
);

	wire cout1, cout2, cout3;
	wire [15:0] sum_lo, sum_hi, sum_hi1, sum_hi2;
	

	add16 add1(a[15:0], b[15:0], 0, sum_lo, cout1);
	add16 add2(a[31:16], b[31:16], 0, sum_hi1, cout2);
	add16 add3(a[31:16], b[31:16], 1, sum_hi2, cout3);

	always @(*) begin
		case (cout1)
			1'b0: sum_hi = sum_hi1;
			1'b1: sum_hi = sum_hi2;
		endcase
	end

	assign sum = {sum_hi, sum_lo};

endmodule
