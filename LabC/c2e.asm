d: DF 3.0
fld f1, d(x0)
fadd.d f2, f1, f1
fmul.d f3, f1, f1
fdiv.d f4, f2, f3
fsd f4, m(x9)
m: DM 1