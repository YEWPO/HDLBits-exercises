module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
	
    always @(posedge clk) begin
        if (reset) begin
            Q <= 4'd1;
        end
        else begin
            if (enable) begin
                if (Q == 12) begin
                    Q <= 4'd1;
                end
                else begin
                    Q <= Q + 1;
                end
            end
        end
    end
    
    always @(*) begin
        c_enable <= enable;
        if (reset || (enable && Q == 12))begin
            c_load <= 1;
            c_d <= 1;
        end
        else begin
            c_load <= 0;
        end
    end

endmodule
