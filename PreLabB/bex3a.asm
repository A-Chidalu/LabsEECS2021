s1: DC "What is your name?\0"
s2: DC "Hello "
c1: DC "!"

 
	addi x5,x0,s1
	ld x6,s2(x0)
	ld x9,c1(x0)
	ecall x0,x5,4
	ecall x7,x0,9
	ecall x6,x6,3
	ecall x7,x7,4
	ecall x9,x9,3

ebreak x0,x0,0