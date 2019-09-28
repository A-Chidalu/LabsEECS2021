msg: DC "n! Enter n:"
c1: DC "!="

addi x2,x0,msg ;Putting the main message into a register x2
ld x10, c1(x0) ; load the "!=" character
ecall x0,x2,4 ;outputing the main message	
ecall x6,x0,5 ; input n 
add x9,x6,x0; saver for zero:
add x7,x6,x0 ;the subtractor


input0:
	beq x6,x0,end ;if n is 0 go to the end

factorial:
	addi x7,x7,-1
	beq x7,x0,zero ;after we decrement before we do ANY multiplication make sure x7 doesnt equal 0
	mul x6,x6,x7
	beq x0,x0,factorial
	
zero:
	addi x7,x0,1
	mul x6,x6,x7
	ecall x9,x9,0
	ecall x10,x10,3
	ecall x6,x6,0
	ebreak x0,x0,0 ; without this it would go to end:
	

end:
	addi x1,x0,1
	ecall x0,x1,0



