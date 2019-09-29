v1: DF -1.1e15
v2: DF 1.1e15
v3: DF 3.0
fld f1, v1(x0)
fld f2, v2(x0)
fld f3, v3(x0)
fadd.d f4, f1, f2
fadd.d f4, f4, f3
fadd.d f5, f2, f3
fadd.d f5, f1, f5