module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    
    always @(negedge clk) begin
        if (reset == 1'b0) begin
            q <= d;
        end
        else begin
            q <= 8'h34;
        end
    end

endmodule
