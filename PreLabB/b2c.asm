src: DD -1, 5, -3, 7, 0
add x6, x0, x0
loop: ld x5, src(x6)
beq x5, x0, end
bge x5, x0, skip
sub x5, x0, x5
skip: sd x5, dst(x6)
addi x6, x6, 8
beq x0, x0, loop
end: ebreak x0, x0, 0
dst: DM 1