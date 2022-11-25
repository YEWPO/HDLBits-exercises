module top_module (
    input clk,
    input x,
    output z
); 
    
    wire q1, q2, q3;
    
    xormodule a(clk, x, q1);
    andmodule b(clk, x, q2);
    ormodule c(clk, x, q3);
    
    assign z = ~(q1 | q2 | q3);

endmodule

module xormodule (
    input clk,
    input x,
    output q
);
    
    wire xorgate;
    assign xorgate = x ^ q;
    flip_flop f(clk, xorgate, q);
    
endmodule

module andmodule (
    input clk,
    input x,
    output q
);
    
    wire andgate;
    assign andgate = x & (~q);
    flip_flop f(clk, andgate, q);
    
endmodule

module ormodule (
    input clk,
    input x,
    output q
);
    
    wire orgate;
    assign orgate = x | (~q);
    flip_flop f(clk, orgate, q);
    
endmodule

module flip_flop (
    input clk,
    input d,
    output q
);
    
    always @(posedge clk)
        q <= d;
    
endmodule
