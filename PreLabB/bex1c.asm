a: DD 0xAAAABBBBCCCCDDDD
b: DD 0x4444333322221111

ld x1, a(x0)
ld x2, 8(x0)

add x16,x1,x2
subw x17,x1,x2 ;------INCORRECT Wrapping around back to positive
sub x18,x2,x1