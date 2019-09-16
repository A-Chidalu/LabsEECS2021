b20: EQU 6146 >> 12
b12: EQU 6146 & 0xfff
lui x6, b20 + 1
addi x6, x6, b12
addi x7, x0, 3
add x5, x6, x7