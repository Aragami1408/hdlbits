module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    
    wire [7:0] dff1out, dff2out, dff3out;

    my_dff8 dff1(.clk(clk), .d(d), .q(dff1out));
    my_dff8 dff2(.clk(clk), .d(dff1out), .q(dff2out));
    my_dff8 dff3(.clk(clk), .d(dff2out), .q(dff3out));
    
    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = dff1out;
            2'b10: q = dff2out;
            2'b11: q = dff3out;
            default: q = 1'bx;
        endcase
    end

endmodule
