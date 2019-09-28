v1: DD -2
v2: DD 16
ld x5, v1(x0)
ld x6, v2(x0)
mul x7,x5,x6 ;lower 64 bits
mulh x8,x5,x6 ;upper 64 bits (signed, signed)
mulhu x9, x5, x6 ;upper 64 bits (unsigned, unsigned)
mulhsu x10, x5, x6 ;upper 64 bits (signed, unsigned)
mulhsu x11, x6, x5 ;upper 64 bits (signed, unsigned)