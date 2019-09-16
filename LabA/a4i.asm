c: EQU 0x1234567811223344
lui x6, (c & 0xffffffff) >> 12
addi x6, x6, c & 0xfff
lui x7, c >> 44
addi x7, x7, (c & 0xfff00000000) >> 32
slli x7, x7, 32
or x5, x6, x7