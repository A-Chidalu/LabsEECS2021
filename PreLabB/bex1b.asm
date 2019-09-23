b: DD a
e: DD c

ORG 0x1000100010001100
a: DD 0x1111222233334444
ORG 0x1000100010001000
c: DD 0x2222333344445555

ld x7, b(x0)
ld x7, 0(x7)

ld x6, e(x0)
ld x6, 0(x6)

add x28,x6,x7
sub x29,x6,x7
or x30,x6,x7
xor x31,x6,x7