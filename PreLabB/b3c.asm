loop: ecall x6, x0, 5 ;integer
ecall x7, x0, 5 ;integer
add x5, x6, x7
ecall x0, x5, 0
beq x0, x0, loop