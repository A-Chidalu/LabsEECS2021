//----------------------------------------ALU-----------------------------------
module yAlu(z, ex, a, b, op); 
input [31:0] a, b; 
input [2:0] op; 
output [31:0] z; 
output ex; 
wire [31:0] andi, ori, arith, sub, slt;
wire condition;
wire [15:0] z16;
wire [7:0]  z8;
wire [3:0]  z4;
wire [1:0]  z2;
wire z1;
assign slt[31:1] = 0;  
// not supported 
// instantiate the components and connect them 
// Hint: about 4 lines of code 

//and--------------------------------
and myAnd[31:0](andi, a, b);
//or---------------------------------
or  myOr[31:0](ori, a, b);
//(+-)------------------------------
yArith myArith(arith,null, a, b, op[2]);

//slt------------------------------
xor myXor (condition, a[31], b[31]);
yArith sltArith(sub,null, a, b, 1'b1);
yMux1  sltMux (slt[0], sub[31], a[31], condition);
//---------------------------------
//chosing result
yMux4to1 #(32) myMux (z, andi, ori, arith, slt, op[1:0]);

//Ex-------------------------------
or or16[15:0] (z16, z[15:0], z[31:16]); 
or or8[7:0]  (z8, z16[7:0], z16[15:8]); 
or or4[3:0] (z4, z8[3:0], z8[7:4]); 
or or2[1:0]  (z2, z4[1:0], z4[3:2]); 
or or1 (z1, z2[0:0], z2[1:1]);
not noting(ex, z1);
endmodule

//--------------------------------------------------------------------------------------
//---------------------------------------- MUX1  ---------------------------------------
module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;
not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);
endmodule 

//---------------------------------------------------------------------------------------
//--------------------------------------- MUX  ------------------------------------------
module yMux(z, a, b, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a, b;
input c;
yMux1 mine[SIZE-1:0](z, a, b, c);
endmodule 

//---------------------------------------------------------------------------------------
//--------------------------------------MUX4to1------------------------------------------
module yMux4to1(z,a0,a1,a2,a3, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] zLo, zHi;
yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);
endmodule 

//---------------------------------------------------------------------------------------
//-------------------------------------Adder1--------------------------------------------
module yAdder1(z, cout, a, b, cin); 
output z, cout; 
input a, b, cin; 
xor left_xor(tmp, a, b); 
xor right_xor(z, cin, tmp); 
and left_and(outL, a, b); 
and right_and(outR, tmp, cin); 
or my_or(cout, outR, outL); 
endmodule 

//---------------------------------------------------------------------------------------
//----------------------------------- Adder----------------------------------------------
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

//--------------------------------------------------------------------------------------------
//--------------------------------------Arith ------------------------------------------------
module yArith(z, cout, a, b, ctrl); 

//add if ctrl=0, subtract if ctrl=1
output [31:0] z; 
output cout; 
input [31:0] a, b; 
input ctrl; 
wire[31:0] notB, tmp; 
wire cin; 

assign cin = ctrl;
not myNot[31:0](notB, b);
yMux #(32) mymux(tmp, b, notB, cin);
yAdder myadder(z,cout, a ,tmp , cin);

endmodule 
//--------------------------------------------------------------------------------------------

//-----------------------------------------yIF-------------------------------------------------
module yIF(ins, PCp4, PCin, clk);
output [31:0] ins, PCp4;
input [31:0] PCin;
input clk;
wire [31:0] pcOut;
register #(32) pc(pcOut, PCin, clk, 1'b1);
yAlu myAlu(PCp4, null, pcOut, 32'd4, 3'b010);
mem myMem(ins, pcOut, 32'b0, clk, 1'b1, 1'b0);
endmodule 
//-----------------------------------------------------------------------------------------------

//-----------------------------------------yID---------------------------------------------------
module yID(rd1, rd2, immOut, jTarget, branch, ins, wd, RegWrite, clk);
output [31:0] rd1, rd2, immOut;
output [31:0] jTarget;
output [31:0] branch;

input [31:0] ins, wd;
input RegWrite, clk;

wire [19:0] zeros, ones; // For I-Type and SB-Type
wire [11:0] zerosj, onesj; // For UJ-Type
wire [31:0] imm, saveImm; // For S-Type

rf myRF(rd1, rd2, ins[19:15], ins[24:20], ins[11:7], wd, clk, RegWrite);

assign imm[11:0] = ins[31:20];
assign zeros = 20'h00000;
assign ones = 20'hFFFFF;
yMux #(20) se(imm[31:12], zeros, ones, ins[31]);

assign saveImm[11:5] = ins[31:25];
assign saveImm[4:0] = ins[11:7];
yMux #(20) saveImmSe(saveImm[31:12], zeros, ones, ins[31]);

yMux #(32) immSelection(immOut, imm, saveImm, ins[5]);

assign branch[11] = ins[31];
assign branch[10] = ins[7];
assign branch[9:4] = ins[30:25];
assign branch[3:0] = ins[11:8];
yMux #(20) bra(branch[31:12], zeros, ones, ins[31]);

assign zerosj = 12'h000;
assign onesj = 12'hFFF;
assign jTarget[19] = ins[31];
assign jTarget[18:11] = ins[19:12];
assign jTarget[10] = ins[20];
assign jTarget[9:0] = ins[30:21];
yMux #(12) jum(jTarget[31:20], zerosj, onesj, jTarget[19]);

endmodule
//-------------------------------------------------------------------------------------------------------

//-----------------------------------------yEX-----------------------------------------------------------
module yEX(z, zero, rd1, rd2, imm, op, ALUSrc); 
output [31:0] z, b;
output zero;
input [31:0] rd1, rd2, imm; 
input [2:0] op;
input ALUSrc;

yMux #(32) my_mux(b, rd2, imm, ALUSrc);

yAlu #(32) myAlu2(z, zero, b, rd1, op);

endmodule
//-----------------------------------------yDM--------------------------------------------------------------
module yDM(memOut, exeOut, rd2, clk, MemRead, MemWrite); 
output [31:0] memOut;
input [31:0] exeOut, rd2, z; 
input clk, MemRead, MemWrite;

mem my_mem(memOut,z, rd2, clk, MemRead, MemWrite);

endmodule