module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    full_adder A(a[0], b[0], cin, sum[0], cout[0]);
    full_adder B(a[1], b[1], cout[0], sum[1], cout[1]);
    full_adder C(a[2], b[2], cout[1], sum[2], cout[2]);

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout );
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a | b));
    
endmodule
