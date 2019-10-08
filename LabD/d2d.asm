str1: DC "sampled text\0 "
str2: DC " new\0 "
STACK: EQU 0x100000 ;stack
lui sp, STACK>>12
addi a2, x0, str1+7 ;chaddr
addi a3, x0, str2 ;chaddr
jal x1, insch
addi x6, x0, str1 ;output
ecall x0, x6, 4
ebreak x0, x0, 0 ;finish