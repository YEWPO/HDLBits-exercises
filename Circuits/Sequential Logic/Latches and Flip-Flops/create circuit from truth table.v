module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @(posedge clk) 
        Q <= (~j & ~k & Q) | (j & ~k) | (j & k & ~Q);

endmodule
