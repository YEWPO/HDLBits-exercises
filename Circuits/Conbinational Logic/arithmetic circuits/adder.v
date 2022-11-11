module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire cout[3:0];
    
    full_adder A(x[0], y[0], 0, sum[0], cout[0]);
    full_adder B(x[1], y[1], cout[0], sum[1], cout[1]);
    full_adder C(x[2], y[2], cout[1], sum[2], cout[2]);
    full_adder D(x[3], y[3], cout[2], sum[3], cout[3]);
    
    assign sum[4] = cout[3];

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
