module yChip(ins, rd2, wb, entryPoint, INT, clk);
output [31:0] ins, rd2, wb;
input [31:0] entryPoint;
input INT, clk;
wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, memOut, wb, PCin;
wire [25:0] jTarget;
wire [5:0] opCode, fnCode;
wire [2:0] op;
wire [1:0] ALUop;
wire zero, RegDst, RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg, jump, branch, rtype, lw, sw;
yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEX(z, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, z, memOut, Mem2Reg);
assign wd = wb;
yPC myPC(PCin, PCp4, INT, entryPoint, imm, jTarget, zero, branch, jump);
assign opCode = ins[31:26];
yC1 myC1(rtype, lw, sw, jump, branch, opCode);
yC2 myC2(RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite, rtype, lw, sw, branch);
assign fnCode = ins[5:0];
yC3 myC3(ALUop, rtype, branch);
yC4 myC4(op, ALUop, fnCode);
endmodule

