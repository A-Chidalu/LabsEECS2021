src: DD -1, 55, -3, 7, 0
add x6, x0, x0
ld x5, src(x6)
loop: addi x6,x6, 8
      ld x7, src(x6)
      beq x7,x0,end
      bge x7,x5,next
      beq x0,x0,loop
next: add x5,x7,x0
      beq x0,x0,loop

end: ebreak x0,x0,0