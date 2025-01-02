module top_module ( input clk, input d, output q );
    wire out1, out2;
    my_dff d1(clk, d, out1);
    my_dff d2(clk, out1, out2);
    my_dff d3(clk, out2, q);
endmodule
