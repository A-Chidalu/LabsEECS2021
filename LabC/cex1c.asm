s1: DC "Find all divisors."
s2: DC "Enter i: \0"
div: DC "Divisors:" ; in x4
addi x2,x0,s1
addi x3,x0,s2
addi x4,x0,div

;--------Starting the output process

ecall x0,x2,4 ;output string "Find all divisors."
ecall x3,x3,4 ;output string "Enter i:"
ecall x6,x0,5
ecall x0,x4,4;


;x30 will be our counter for the for loop
addi x20,x6,1 ;breaker variable

forloop:
	addi x30,x30,1 ;else add one to x30
	rem x31,x6,x30 ;our remainder
	beq x0,x31,print
	beq x30,x20,end ;if x30 becomes one more than x20 break the loop
	beq x0,x0,forloop


print:
	ecall x0,x30,0
	beq x0,x0,forloop


end:
	ebreak x0,x0,0
	
