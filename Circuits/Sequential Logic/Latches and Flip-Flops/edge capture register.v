module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    wire [31:0] pre;
    
    always @(posedge clk) begin
        if (reset) begin
            out <= 32'b0;
        end
        else begin
            out <= out | (pre & ~in);
        end
    	pre <= in;
    end

endmodule
