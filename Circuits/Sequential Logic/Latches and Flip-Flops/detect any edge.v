module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    wire [7:0] pre;
    
    always @(posedge clk) begin
        anyedge <= pre ^ in;
        pre <= in;
    end

endmodule
