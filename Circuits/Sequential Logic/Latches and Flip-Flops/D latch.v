module top_module (
    input d, 
    input ena,
    output q);
    
    always @(d or ena)
        if (ena)
            q <= d;

endmodule
