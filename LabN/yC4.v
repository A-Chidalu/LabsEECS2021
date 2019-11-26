module yC4(op, ALUop, fnCode);
output [2:0] op;
input [5:0] fnCode;
input [1:0] ALUop;
wire t1, t2;
or (t1, fnCode[0], fnCode[3]);
and (t2, fnCode[1], ALUop[1]);
and (op[0], ALUop[1], t1);
nand (op[1], ALUop[1], fnCode[2]);
or (op[2], t2, ALUop[0]);
endmodule