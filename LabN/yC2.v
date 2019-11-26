  
module yC2(RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite, rtype, lw, sw,branch);
output RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite;
input rtype, lw, sw, branch;
assign RegDst = rtype;				
nor (ALUSrc, rtype, branch);		
nor (RegWrite, sw, branch);			
assign Mem2Reg = lw;
assign MemRead = lw;
assign MemWrite = sw;
endmodule