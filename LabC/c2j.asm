addi x5, x0, 22
addi x6, x0, 7
fcvt.d.l f5, x5 ;from 64bit int
fcvt.d.l f6, x6
fdiv.d f7, f5, f6 ;22.0/7.0= 3.1428...
fcvt.l.d x7, f7 ;to 64bit int