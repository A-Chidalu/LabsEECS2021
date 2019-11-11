module yAlu(z, ex, a, b, op);
input [31:0] a, b, slt;
input condition;
input ONE;
input [2:0] op; //Notice the bit [0] and bit [1] decide in the yMux4to1
output [31:0] z;
output ex, cout;
assign slt[31:1] = 0; // not supported
assign ex = 0; // not supported
// instantiate the components and connect them
// Hint: about 4 lines of code
wire[31:0] andOP, orOP, add_sub, add_sub2; //These are just all my componenets

//compute (a-b) anyways cause you might need it
assign ONE = 1;
yArith #(32) finalArith(add_sub2, null, a, b, ONE);
xor my_xor(condition, a[31], b[31]);

yMux #(32) final_mux(slt, add_sub2, a, condition);





and my_and[31:0] (andOP, a, b);
or my_or[31:0] (orOP, a, b);
yArith #(32) myArith(add_sub, null, a, b, op[2]);

//need something to decide wether to do addition or subtraction
//notice op[2] decides wether to preform addition or substraction
//use a yMux to choose
yMux4to1 #(32) my_Mux(z, andOP, orOP, add_sub, slt, op[1:0]);


endmodule

