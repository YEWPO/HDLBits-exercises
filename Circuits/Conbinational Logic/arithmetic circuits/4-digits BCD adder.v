module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire cout1, cout2, cout3;
    
    bcd_fadd A(a[3:0], b[3:0], cin, cout1, sum[3:0]);
    bcd_fadd B(a[7:4], b[7:4], cout1, cout2, sum[7:4]);
    bcd_fadd C(a[11:8], b[11:8], cout2, cout3, sum[11:8]);
    bcd_fadd D(a[15:12], b[15:12], cout3, cout, sum[15:12]);

endmodule
