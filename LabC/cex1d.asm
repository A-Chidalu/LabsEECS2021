s1: DC "Find all divisors."
s2: DC "Enter i:\0"
div: DC "Divisors:\0" ; in x4
prime: DC "prime\0"
notprimeString: DC "not prime\0"
mem: DM 10
addi x2,x0,s1
addi x3,x0,s2
addi x4,x0,div
addi x16,x0,16;Prime checker
addi x10,x0,prime ; String "prime"
addi x13,x0,notprimeString ; String "not prime"
;--------Starting the output process

ecall x0,x2,4 ;output string "Find all divisors."
ecall x3,x3,4 ;output string "Enter i:"
ecall x6,x0,5
ecall x0,x4,4 
addi x20,x6,1 ;breaker variable

;x30 will be our counter for the for loop

forloop:
	addi x30,x30,1 ;else add one to x30
	rem x31,x6,x30 ;our remainder
	beq x0,x31,store
	beq x30,x20,end ;if x30 becomes one more than x20 break the loop
	beq x0,x0,forloop


store:	
	sd x30, mem(x27)
	addi x27,x27,8 ;Increment the adress counter
	beq x0,x0,forloop


end:
	;------Before you end you have to do a check for primes
	beq x27,x16,primechecker
	bne x27,x16,notprime
	ebreak x0,x0,0
	
primechecker:
	ecall x0,x10,4 ;"prime"
	ebreak x0,x0,0
notprime: 
	ecall x0,x13,4 ;"prime"
	

