prompt: DC "Enter a string:"
s: DM 3 ;3*8=24 bytes
response1: DC "Input IS a palindrome."
response2: DC "Input IS NOT a palindrome."
addi x13,x0,prompt
addi x14,x0,s
ecall x0,x13,4 ;string
ecall x14,x0,9
addi x15,x0,s
STACK: EQU 0x100000 ;my stack pointer
lui sp, STACK>>12

pusher: 
	lb x4,0(x14)
	beq x4,x0,popper ;if you get a byte of 0 that means ive reached the end of the string
	addi x14,x14,1
	sd x4,0(sp)
	addi sp,sp,-8
	addi x5,x5,1 ; my counter to see how many items are in my stack
	beq x0,x0,pusher

popper:
	blt x5,x0,right
	lb x6,8(sp) ;taking out each byte stored in the stack
	addi x5,x5,-1
	addi sp,sp,8
	lb x7, 0(x15)
	addi x15,x15,1
	bne x6,x7,wrong
	beq x0,x0,popper
	

wrong:
	addi x16,x0,response2
	ecall x0,x16,4; 
	ebreak x0,x0,0

right:
	addi x17,x0,response1
	ecall x0,x17,4; 
	ebreak x0,x0,0
	