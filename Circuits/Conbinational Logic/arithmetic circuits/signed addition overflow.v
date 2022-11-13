module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    wire cout1, cout2;
    
    fourbits_adder A(a[3:0], b[3:0], 0, s[3:0], cout1);
    fourbits_adder B(a[7:4], b[7:4], cout1, s[7:4], cout2);
    
    assign overflow = ((~(a[7] ^ b[7])) & (a[7] ^ s[7]));
endmodule

module fourbits_adder (
    input [3:0] x,
    input [3:0] y, 
    input cin,
    output [3:0] sum,
	output out);
    
    wire cout[3:0];
    
    full_adder A(x[0], y[0], cin, sum[0], cout[0]);
    full_adder B(x[1], y[1], cout[0], sum[1], cout[1]);
    full_adder C(x[2], y[2], cout[1], sum[2], cout[2]);
    full_adder D(x[3], y[3], cout[2], sum[3], cout[3]);
    
    assign out = cout[3];

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
