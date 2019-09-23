a: DD 0xAAAABBBBCCCCDDDD
b: DD 0x4444333322221111

ld x1, a(x0)
ld x2, b(x0)

add x16,x1,x2
sub x17,x1,x2 ;------INCORRECT Wrapping around back to positive
sub x18,x2,x1
and x19,x1,x2
or x20,x1,x2
xor x21,x1,x2
xori x22,x1,-1
addi x22,x22,1
xori x23,x2,-1
addi x23,x23,1