module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire out1, out2;
    
    multiplexer m1(E, w, Q, out1);
    multiplexer m2(L, R, out1, out2);
    flip_flop F(clk, out2, Q);

endmodule

module multiplexer (
    input op,
    input a,
    input b,
    output out
);
    
    always @(*)
        if (op == 1)
            out = a;
    	else
            out = b;
    
endmodule

module flip_flop (
    input clk,
    input d,
    output reg q
);
    
    always @(posedge clk)
        q <= d;
    
endmodule
