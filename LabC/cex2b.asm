addi x2,x0,10 ; this register holds my value of n
add x15,x2,x0 ; THIS REGISTER WILL STOP MY PROGRAM AND SHOULD BE SET TO WHATEVER x2 Begins at
add x8,x2,x0 ;this is my counter of n resigster
add x11,x2,x0; i need anotnher counter of n for my method
d1: DF 1.0

fld f2,d1(x0);value to store 1.0 always

factorial: ;this is a function to calculate the factorial of any n
	beqz x11,end ;-----break if n = 0		
	;----if n doen't equall 0....--------
	addi  x8,x8,-1 ;-----whatever number n is subract one from it and multiply
	mul x9,x11,x8 ;-----x9 = n * (n-1) ; x9 is holding my running sum
	add x10,x10,x9 ;----x10 will hold the sum of the factorial
	addi x11,x11,-1


connect:
	addi x9,x9,1 ;-----just add 1 into x9 cause 0! = 1 and now i have the factorial value of any n
	beq x0,x0,compute

compute:
	
	fcvt.d.l f5,x9 ;------convert the value of x9 into a double for easy division
	fdiv.d f3,f2,x9 ;------do the division of the sum of the factorial
	add f4,f4,f3 ;-----RESULT RUNNNING SUM <---f4 will be my final answer
	
	;-----------now i have to reset my counters by a value of one and go back to factorial
	addi x8,x2,-1
	addi x11,x8,-1
	addi x15,x15,-1
	blt x15,x0,final ; if x15 is less than 0 the program should end	
	beq x0,x0,factorial

final:
	ebreak x0,x0,0 ;f4 is you answer


	
	
	