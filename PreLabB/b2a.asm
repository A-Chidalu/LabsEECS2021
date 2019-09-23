src: DD -3
ld x5, src(x0)
bge x5, x0, skip
sub x5, x0, x5
skip: sd x5, dst(x0)
ebreak x0, x0, 0
dst: DM 1