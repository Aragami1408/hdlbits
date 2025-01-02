module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] sum_lo, sum_hi;
    wire cout_lo, cout_hi;
    
    add16 add_lo(a[15:0], b[15:0], 0, sum_lo, cout_lo);
    add16 add_hi(a[31:16], b[31:16], cout_lo, sum_hi, cout_hi);
    
    assign sum = {sum_hi, sum_lo};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
