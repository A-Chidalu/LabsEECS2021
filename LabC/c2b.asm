d1: DF 2.0
d2: DF 3.0
fld f1, d1(x0)
fld f2, d2(x0)
fadd.d f3,f1,f2 ;2.0+3.0= 5.0
fsub.d f4,f1,f2 ;2.0-3.0= -1.0
fmul.d f5,f1,f2 ;2.0*3.0= 6.0
fdiv.d f6,f1,f2 ;2.0/3.0= 0.(6)