module yArith(z, cout, a, b, ctrl);
// add if ctrl=0, subtract if ctrl=1
output [31:0] z;
output cout;
input [31:0] a, b;
input ctrl;
wire[31:0] notB, tmp;
wire cin;
// instantiate the components and connect them
// Hint: about 4 lines of code

not(notB, b);

if(ctrl === 1)

assign cin = 1;

else
assign cin = 0;

yAdder test[31:0] (z, cout, a, b, cin);

endmodule