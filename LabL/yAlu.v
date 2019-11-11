module yAlu(z, ex, a, b, op);
input [31:0] a, b, slt;
input [2:0] op; //Notice the bit [0] and bit [1] decide in the yMux4to1
output [31:0] z;
output ex;
assign slt = 0; // not supported
assign ex = 0; // not supported
// instantiate the components and connect them
// Hint: about 4 lines of code
wire[31:0] andOP, orOP, add_sub; //These are just all my componenets




and my_and[31:0] (andOP, a, b);
or my_or[31:0] (orOP, a, b);
yArith #(32) myArith(add_sub, null, a, b, op[2]);

//need something to decide wether to do addition or subtraction
//notice op[2] decides wether to preform addition or substraction
//use a yMux to choose
yMux4to1 #(32) my_Mux(z, andOP, orOP, add_sub, slt, op[1:0]);


endmodule

