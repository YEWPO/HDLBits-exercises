module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire [1:0] c_reset;
    wire [2:1] c_enable;
    wire [3:0] h;
    
    countbcd2 count0 (clk, c_reset[0] | reset, ena, ss);
    countbcd2 count1 (clk, c_reset[1] | reset, c_enable[1] & ena, mm);
    count12 count2 (clk, reset, c_enable[2] & ena, h);
    
    assign c_enable[1] = ss[7:4] == 4'd5 && ss[3:0] == 4'd9;
    assign c_enable[2] = mm[7:4] == 4'd5 && mm[3:0] == 4'd9 && ss[7:4] == 4'd5 && ss[3:0] == 4'd9;
    
    assign c_reset[0] = ss[7:4] == 4'd5 && ss[3:0] == 4'd9;
    assign c_reset[1] = mm[7:4] == 4'd5 && mm[3:0] == 4'd9 && ss[7:4] == 4'd5 && ss[3:0] == 4'd9;
    
    always @(posedge clk) begin
        pm <= ((h == 4'd11 && mm[7:4] == 4'd5 && mm[3:0] == 4'd9 && ss[7:4] == 4'd5 && ss[3:0] == 4'd9) & ~pm)
        | (!(h == 4'd11 && mm[7:4] == 4'd5 && mm[3:0] == 4'd9 && ss[7:4] == 4'd5 && ss[3:0] == 4'd9) & pm);
    end
    
    always @(*) begin
        case (h)
            4'd1: hh = 8'h01;
            4'd2: hh = 8'h02;
            4'd3: hh = 8'h03;
            4'd4: hh = 8'h04;
            4'd5: hh = 8'h05;
            4'd6: hh = 8'h06;
            4'd7: hh = 8'h07;
            4'd8: hh = 8'h08;
            4'd9: hh = 8'h09;
            4'd10: hh = 8'h10;
            4'd11: hh = 8'h11;
            4'd12: hh = 8'h12;
        endcase
    end
        
endmodule

module countbcd2 (
    input clk,
    input reset,
    input enable,
    output [7:0] q);
    
    wire c_enable;
    count10 count0 (clk, reset, enable, q[3:0]);
    count10 count1 (clk, reset, c_enable & enable, q[7:4]);

    assign c_enable = q[3:0] == 4'd9;
    
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

module count12 (
    input clk,
    input reset,
    input enable,
    output [3:0] Q);
    
    always @(posedge clk) begin
        if (reset) begin
            Q <= 4'd12;
        end
        else begin
            if (enable) begin
                if (Q == 4'd12) begin
                    Q <= 4'd1;
                end
                else begin
                    Q <= Q + 1'b1;
                end
            end
        end
    end
    
endmodule
