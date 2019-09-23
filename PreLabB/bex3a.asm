s1: DC "What is your name?"
s2: DM 1 ;Made space for a double word
c1: DC "Hello "
c2: DC "!"
ld x28,c1(x0) ;Load c1 into x28
ld x29,c2(x0); load c2 into x29
addi x30,x0,s1 ;Load the string
ecall x0,x30,4 ;"what is your name?"
ecall x6,x0,8
sd x6, s2(x0) ;store whatever string is in x6 in s2
addi x9,x0,s2 ;Load the string back into x9
ecall x1,x28,8 ;Print "Hello "
;ecall x1,x9,4 ;Print their name