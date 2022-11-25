module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    wire [7:0] pre;
    
    always @(posedge clk) begin
        pedge <= (~pre & in);
    	pre <= in;
    end

endmodule
