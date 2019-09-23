src: DD 121, 33, -5, 242, -45, -12, 0
add x6,x0,x0
ld x5, src(x6)

loop: addi x6,x6,8
      ld x7, src(x6)
      beq x7,x0,end
      blt x7,x5,next


next: add x10,x6,x0 ;-----Save the index of the value that happens to be less than
      add x5,x7,x0
      beq x0,x0,loop
      

end: ld x4, src(x0) ;--Saving src
     sd x5, src(x0)
     sd x4, src(x10)
     ebreak x0,x0,0
 

