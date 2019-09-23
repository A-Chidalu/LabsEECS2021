lui x1, 0x10001
slli x1,x1, 32
lui x2, 0x00010
slli x3,x2,12
add x4,x3,x1
lui x8, 0x001100 
srli x8,x8,12
add x6,x4,x8

;------Finally got x6 the way i want it to be------
ORG 0x1000100010001100
a: DD 0x1111222233334444
ORG 0x1000100010001000
c: DD 0x2222333344445555

;------Get x7 the way you want it to be------
