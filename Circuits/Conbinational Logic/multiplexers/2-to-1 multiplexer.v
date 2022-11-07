module top_module( 
    input a, b, sel,
    output out ); 
    
    always @(*) begin
        if (sel == 1'b0) begin
            out = a;
        end
        else begin
            out = b;
        end
    end

endmodule
