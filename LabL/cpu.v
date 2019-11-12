module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodulemodule yMux(z, a, b, c);
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
module yMux4to1(z, a0,a1,a2,a3, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] zLo, zHi;

yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);

endmodulemodule yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;

xor left_xor(tmp, a, b);
xor right_xor(z, cin, tmp);
and left_and(outL, a, b);
and right_and(outR, tmp, cin);
or my_or(cout, outR, outL);

endmodule/*
module yAdder(z, cout, a, b, cin);
output [31:0] z;
output cout;
input [31:0] a, b;
input cin;
wire[31:0] in, out;

yAdder1 mine[31:0](z, out, a, b, in);

assign in[0] = cin;
assign in[31:1] = out[30:0];
assign cout = out[31];

endmodule
*/



module yAdder(z, cout, a, b, cin); 
output [31:0] z; 
output cout; 
input [31:0] a, b; 
input cin; 
wire[31:0] in, out;

yAdder1 mine[31:0](z, out, a, b, in); 

assign in[0] = cin; 
assign in[31:1] = out[30:0];
assign cout = out[31];

endmodule
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
:x

assign cin = ctrl;
not myNot[31:0](notB, b);
yMux #(32) mymux(tmp, b, notB, cin);
yAdder myadder(z, cout, a ,tmp , cin);



endmodulemodule yAlu(z, ex, a, b, op);
input [31:0] a, b, slt;
input condition;
input ONE;
input [2:0] op; //Notice the bit [0] and bit [1] decide in the yMux4to1
output [31:0] z;
output zero; // not supported
assign zero = 0; // not supported
assign slt[31:1] = 0;
wire cout;
// instantiate the components and connect them
// Hint: about 4 lines of code
wire[31:0] andOP, orOP, add_sub, add_sub2; //These are just all my componenets

//compute (a-b) anyways cause you might need it
assign ONE = 1;
yArith #(32) finalArith(add_sub2, cout, a, b, ONE);
xor #(1) my_xor(condition, a[31], b[31]);

//After this all the importand information will be in bit 31 of slt[]
yMux #(1) slt_mux(slt[0], add_sub2[31], a[31], condition);


//L11:
or or16[15:0] (z16, z[15: 0], z[31:16]);
or or8[7:0] (z8, z16[7: 0], z16[15:8]);
or or4[3:0] (z4, z8[3: 0], z8[7:4]);
or or2[1:0] (z2, z4[1:0], z4[3:2]);
or or1[15:0] (z1, z2[1], z2[0]);
not m_not (z0, z1);
assign ex = z0;
//------------------




and my_and[31:0] (andOP, a, b);
or my_or[31:0] (orOP, a, b);
yArith #(32) myArith(add_sub, null, a, b, op[2]);

//need something to decide wether to do addition or subtraction
//notice op[2] decides wether to preform addition or substraction
//use a yMux to choose
yMux4to1 #(32) my_Mux(z, andOP, orOP, add_sub, slt, op[1:0]);


endmodule

