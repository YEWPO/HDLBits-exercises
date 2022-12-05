module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    wire [3:0] Q1, 	Q2, Q3;
    bcdcount bcdcount0(clk, reset, c_enable[0], Q1);
    bcdcount bcdcount1(clk, reset, c_enable[1], Q2);
    bcdcount bcdcount2(clk, reset, c_enable[2], Q3);
    
    assign c_enable = {(Q2 == 4'd9) && (Q1 == 4'd9), Q1 == 4'd9, 1'b1};
    assign OneHertz = (Q3 == 4'd9) && (Q2 == 4'd9) && (Q1 == 4'd9);

endmodule
