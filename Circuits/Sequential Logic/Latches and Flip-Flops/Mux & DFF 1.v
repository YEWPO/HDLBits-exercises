module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire mid;
    
    multiplexer m(L, r_in, q_in, mid);
    flip_flop io(clk, mid, Q);

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
