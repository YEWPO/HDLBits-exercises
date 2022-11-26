module top_module (
    input clk,
    input d,
    output q
);
    
    wire a, b;
    flip_flop f1(clk, d, a);
    flip_flop f2(~clk, d, b);
    
    multiplexer p(clk, a, b, q);

endmodule

module multiplexer (
    input op,
    input a,
    input b,
    output out
);
    
    assign out = (op & a) | (~op & b);
    
endmodule

module flip_flop (
    input clk,
    input d,
    output q
);
    
    always @(posedge clk)
        q <= d;
    
endmodule
