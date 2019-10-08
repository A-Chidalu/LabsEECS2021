str1: DC "sampled text\0 "
str2: DC "new text\0"
STACK: EQU 0x100000 ;stack
lui sp, STACK>>12
addi a2, x0, str1 ;chaddr (pos 1)
addi a3, x0, 0 ;#ch
addi a4, x0, str2 ;chaddr
sb x0, 0(a2) ;emty str1
jal x1, repch
addi x6, x0, str1 ;output
ecall x0, x6, 4