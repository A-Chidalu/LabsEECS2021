module yC1(rtype, lw, sw, jump, branch, opCode);
output rtype, lw, sw, jump, branch;
input [5:0] opCode;
wire [0:0] not5 ,not4, not3, not2, not1, not0;
not (not5, opCode[5]);
not (not4, opCode[4]);
not (not3, opCode[3]);
not (not2, opCode[2]);
not (not1, opCode[1]);
not (not0, opCode[0]);
and (rtype, not5, not4, not3, not2, not1, not0);		
and (jump, not5, not4, not3, not2, opCode[1], not0);		
and (branch, not5, not4,not3, opCode[2], not1, not0);			
and (sw, opCode[5], not4 ,opCode[3], not2, opCode[1], opCode[0]);	
and (lw, opCode[5], not4, not3, not2, opCode[1], opCode[0]);		
endmodule