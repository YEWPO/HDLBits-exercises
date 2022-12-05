module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] c_reset, c_enable;
    count10 count0 (clk, c_reset[0], c_enable[0], q[3:0]);
    count10 count1 (clk, c_reset[1], c_enable[1], q[7:4]);
    count10 count2 (clk, c_reset[2], c_enable[2], q[11:8]);
    count10 count3 (clk, c_reset[3], c_enable[3], q[15:12]);
    
    assign c_reset = {4{reset}};
    assign c_enable[0] = 1;
    assign c_enable[1] = q[3:0] == 4'd9;
    assign c_enable[2] = q[7:4] == 4'd9 && q[3:0] == 4'd9;
    assign c_enable[3] = q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9;
    
    assign ena[1] = q[3:0] == 4'd9;
    assign ena[2] = q[7:4] == 4'd9 && q[3:0] == 4'd9;
    assign ena[3] = q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9;
    
endmodule

module count10 (
    input clk,
    input reset,
 	input enable,
    output [3:0] Q);
    
    always @(posedge clk) begin
        if (reset) begin
            Q <= 4'b0;
        end
        else begin
            if (enable) begin
                if (Q == 4'd9) begin
                    Q <= 4'd0;
                end
                else begin
                    Q <= Q + 1'b1;
                end
            end
        end
    end
    
endmodule
