module top_module( 
    input [254:0] in,
    output reg [7:0] out );

	integer i;

	always @(*) begin
		out = 1'b0;
		for (i = 0; i < $bits(in); i = i + 1) begin
			if (in[i] == 1'b1)
				out = out + 1'b1;
		end
	end



endmodule
