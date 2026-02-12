// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire [15:0] lo_sum, hi0_sum, hi1_sum,hi_sum;
	wire hi0_cout, hi1_cout, sel;

	add16 lo(a[15:0], b[15:0], 0, lo_sum, sel);
	add16 hi0(a[31:16], b[31:16], 0, hi0_sum, hi0_cout);
	add16 hi1(a[31:16], b[31:16], 1, hi1_sum, hi1_cout);

	always @(*) begin
		case(sel)
			1'b0: hi_sum = hi0_sum;
			1'b1: hi_sum = hi1_sum;
			default: hi_sum = 16'b0;
		endcase
	end

	assign sum = {hi_sum, lo_sum};
endmodule
