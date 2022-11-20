module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    
    always @(posedge clk)
        if (r)
            q <= 0;
    	else
            q <= d;

endmodule
