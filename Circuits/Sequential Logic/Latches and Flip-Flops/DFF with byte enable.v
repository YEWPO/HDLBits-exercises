module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    
    always @(posedge clk) begin
        if (resetn == 1'b0) begin
            q <= {byteena[1] == 1'b1 ? 8'b0 : q[15:8], byteena[0] == 1'b1 ? 8'b0 : q[7:0]};
        end
        else begin
            q <= {byteena[1] == 1'b1 ? d[15:8] : q[15:8], byteena[0] == 1'b1 ? d[7:0] : q[7:0]};
        end
    end

endmodule
