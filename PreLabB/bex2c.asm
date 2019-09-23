srcA: DD 1, 5, -7, 23, -5
srcB: DD 3, -2, 4, 11, -7
srcD: DD 0, 0, 0, 0, 0

addi x6,x0,0x0   ;---This stores the base adress of srcA

addi x16, x0, 0x28 ;---A Value to stop the loop if needed

loop: beq x6,x16,end
      ld x7,srcA(x6)
      ld x8,srcB(x6)
      add x9,x7,x8
      sd x9,srcD(x6)
      addi x6,x6,8
      beq x0,x0,loop


end: ebreak x0,x0,0