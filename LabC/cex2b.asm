d: DF 1.0
fld f2,d(x0);value to store 1.0 always
addi x2,x0,20 ; this register holds my value of n
add x15,x2,x0 ; THIS REGISTER WILL STOP MY PROGRAM AND SHOULD BE SET TO WHATEVER x2 Begins at
add x8,x2,x0 ;this is my counter of n resigster
add x11,x2,x0; i need anotnher counter of n for my method
addi x14,x0,1


factorial: ;this is a function to calculate the factorial of any n
	beq x11,x0,zerofactorial
	addi  x8,x8,-1
	beq x8,x0,connect ;-----break if n = 0		
	;----if n doen't equall 0....--------
	 ;-----whatever number n is subract one from it and multiply
	mul x11,x11,x8 ;-----x9 = n * (n-1) ; x9 is holding my running sum
	;add x10,x10,x9 ;----x10 will hold the sum of the factorial
	;addi x11,x11,-1
	beq x0,x0,factorial



zerofactorial:
	add x11,x0,x14 ; this is zerofactorial case
	beq x0,x0,compute

connect:
	mul x11,x11,x14 ;-----just mul 1 into x11 cause 0! = 1 and now i have the factorial value of any n
	beq x0,x0,compute

compute:
	
	fcvt.d.l f5,x11 ;------convert the value of x9 into a double for easy division
	fdiv.d f3,f2,f5 ;------do the division of the sum of the factorial
	fadd.d f6,f6,f3 ;-----RESULT RUNNNING SUM <---f5 will be my final answer
	
	;-----------now i have to reset my counters by a value of one and go back to factorial
	addi x15,x15,-1
	add x8,x15,x0
	add x11,x15,x0
	blt x15,x0,final ; if x15 is less than 0 the program should end	
	beq x0,x0,factorial

final:
	ebreak x0,x0,0 ;f4 is you answer


	
	
	