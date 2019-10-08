str1: DC "sampled text\0"
STACK: EQU 0x100000 ;stack
lui sp, STACK>>12
addi a2, x0, str1+6 ;chaddr
addi a3, x0, 6 ;#ch
jal x1, delch
addi x6, x0, str1 ;output
ecall x0, x6, 4
ebreak x0, x0, 0 ;finish