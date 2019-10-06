s1: DC "What number would you like to represent in binary?\n"
s2: DC "Integer:"
;s3: DC "Binary:"
addi x5,x0,s1
addi x4,x0,s2;
addi x10,x0,2 ; the number to hold 2
ecall x1,x5,4 ; the main question
ecall x1,x4,4 ;accepting the number they want to turn into binary
ecall x6,x0,5;
STACK: EQU 0x100000
lui sp, STACK>>12
pusher: 
	rem x7,x6,x10
	div x6,x6,x10; the quotient, stop if the quotient == 0 
	sd x7,0(sp)
	beq x6,x0,popper
	addi x11,x11,1
	addi sp,sp,-8
	beq x0,x0,pusher
popper:
	ld x9, 0(sp)
	addi sp,sp,8
	addi x11,x11,-1
	ecall x9,x9,0
	blt x11,x0,end
	beq x0,x0,popper

end: 
	ebreak x0,x0,0