str1: DC "sampled text\0"
sub: DC "F"
addi a2, x0, str1+6
addi a1, x0, sub
addi x30, x0, 0
addi x31, x0, 1
jal x1, subch
addi x6, x0, str1
ecall x0, x6, 4
ebreak x0, x0, 0

subch: lb x5, 0(a2)

loop1: beq x5, x0, end1
addi x30, x30, 1
beq x30, x31, chg
lb x5, 1(a2)
lb x5, 0(a2)
addi a2, a2, 1
jal x0, loop1

chg:lb x5, 1(a2)
lb x6, 0(a1)
sb x6, 0(a2)
addi x30, x30, 1
beq x0, x0, loop1


end1: jalr x0, 0(x1)
