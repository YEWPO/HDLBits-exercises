module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire cc[100:0];
    
    always @(*) begin
        cc[0] = cin;
        for (int i = 0; i < 100; i = i + 1) begin
            sum[i] = a[i] ^ b[i] ^ cc[i];
            cc[i + 1] = (a[i] & b[i]) | ((a[i] | b[i]) & cc[i]);
        end
    end
    
    assign cout = cc[100];

endmodule



module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    assign {cout, sum} = a + b + cin;

endmodule
