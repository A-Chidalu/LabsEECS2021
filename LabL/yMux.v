module yMux(z, a, b, c);
output [SIZE - 1:0] z;
parameter SIZE = 2;
input [SIZE - 1:0] a, b;
input c;

/*
yMux1 upper(z[0], a[0], b[0], c);
yMux1 lower(z[1], a[1], b[1], c);
*/

yMux1 mine[SIZE - 1 :0](z, a, b, c);




endmodule
