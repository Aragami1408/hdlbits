// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

	// I use 'if' cuz im lazy. If you still want to use 'case', map all 16
	// possible combinations to their respective position
	always @(*) begin
		pos = 2'b00;
		if (in[0])
			pos = 2'b00;
		else if (in[1])
			pos = 2'b01;
		else if (in[2])
			pos = 2'b10;
		else if (in[3])
			pos = 2'b11;
		else
			pos = 2'b00;
	end

endmodule
