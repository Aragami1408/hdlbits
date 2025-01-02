module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_lo, sum_hi;
    wire cout_hi, cout_lo;
    
    add16 add_lo(a[15:0],b[15:0],0,sum_lo,cout_lo);
    add16 add_hi(a[31:16],b[31:16],cout_lo, sum_hi, cout_hi);
    assign sum = {sum_hi, sum_lo};
endmodule
