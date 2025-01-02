module my_mux(input [7:0] a,b,c,d,
              input [1:0] sel,
              output reg [7:0] out);
    always @(*) begin
        case (sel)
            2'b00 : out = a;
            2'b01 : out = b;
            2'b10 : out = c;
            2'b11 : out = d;
        endcase
    end
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] out1, out2, out3;
    my_dff8 dff1(clk, d, out1);
    my_dff8 dff2(clk, out1, out2);
    my_dff8 dff3(clk, out2, out3);
    
    my_mux mux1(d,out1,out2,out3,sel,q);
endmodule
