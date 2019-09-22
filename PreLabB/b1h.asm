ORG 0x10000000
c: DD 0x1234567811223344
lui x6, c >> 12
addi x6, x6, c & 0xfff
ld x5, 0(x6)