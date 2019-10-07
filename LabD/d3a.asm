addi sp, x0, 0 ;sp initialization
addi a0, x0, 5 ;n=5
jal x1, fact ;call fact
ebreak x0, x0, 0
fact: blt x0, a0, recu ;if(0<a0) recursion
addi a0, x0, 1 ;if(a0<=0)return 1
jalr x0, 0(x1) ;return
recu: sd x1, -8(sp) ;push ra
sd a0, -16(sp) ;push a0
addi sp, sp, -16 ;adjust sp
addi a0, a0, -1 ;a0=a0-1
jal x1, fact ;recursive call
addi sp, sp, 16 ;adjust sp
ld x1, -8(sp) ;pop ra
ld x5, -16(sp) ;pop a0
mul a0, x5, a0 ;fact(a0)=a0*fact(a0-1)
jalr x0, 0(x1) ;return