module yMux(z, a, b, c);
output [31:0] z;
input [31:0] a, b;
input c;

/*
yMux1 upper(z[0], a[0], b[0], c);
yMux1 lower(z[1], a[1], b[1], c);
*/

yMux1 mine[31:0](z, a, b, c);




endmodule
