c1: DC "integer:"
c2: DC "sum:"
s1: DC "Inputs two integers\nand prints the sum.\0"
ld x28, c1(x0)
ld x29, c2(x0)
addi x30, x0, s1
ecall x0, x30, 4 ;info string
loop: ecall x6, x28, 5 ;integer
ecall x7, x28, 5 ;integer
add x5, x6, x7
ecall x1, x29, 3 ;"sum:"
ecall x0, x5, 0 ;the result
beq x0, x0, loop