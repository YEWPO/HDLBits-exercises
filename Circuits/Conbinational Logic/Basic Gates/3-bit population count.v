module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    always @(*) begin
        case(in)
            3'd0: out = 2'd0;
            3'd1: out = 2'd1;
            3'd2: out = 2'd1;
            3'd3: out = 2'd2;
            3'd4: out = 2'd1;
            3'd5: out = 2'd2;
            3'd6: out = 2'd2;
            3'd7: out = 2'd3;
        endcase
    end

endmodule
