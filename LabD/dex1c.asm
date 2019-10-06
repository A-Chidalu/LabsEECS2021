exp: DC "12+34-*" ;(1+2)*(3-4)=-3
addition: DC "+"
subtraction: DC "-"
multiply: DC "*"
divide: DC "/"
ld x9,addition(x0) ;THIS HOLDS THE BYTES OF OPERATORS
ld x10, subtraction(x0) ;THIS HOLDS THE BYTES OF OPERATORS
ld x11, multiply(x0) ;THIS HOLDS THE BYTES OF OPERATORS
ld x12, divide(x0) ;THIS HOLDS THE BYTES OF OPERATORS
STACK: EQU 0x100000
lui sp, STACK >> 12
addi x4,x0,exp

pusher: 
 	lb x5,0(x4)
	beq x5,x9,addOPP
	beq x5,x10,subOPP
	beq x5,x11,mulOPP
	beq x5,x12,divOPP
	beq x5,x0,result ; if the null byte is loaded return the result that is in the stack
	;----An operand was not found so push the number into the stack
	sd x5,0(sp)
	addi sp,sp,-8
	addi x20,x20,1 ;this is my counter to count how many things i have in my stack i may or may not need it
	addi x4,x4,1
	beq x0,x0,pusher

addOPP:
	addi sp, sp, 8
	ld x13, 0(sp)
	addi sp,sp,8
	ld x14, 0(sp)
	add x15,x13,x14
	sd x15,0(sp)
	addi sp,sp,-8
	addi x4,x4,1
	beq x0,x0,pusher


subOPP:
	addi sp, sp, 8
	ld x13, 0(sp)
	addi sp,sp,8
	ld x14, 0(sp)
	sub x15,x14,x13 ;ORDER OF SUBTRACTION IS IMPORTANT
	sd x15,0(sp)
	addi sp,sp,-8
	addi x4,x4,1
	beq x0,x0,pusher



mulOPP:
	addi sp, sp, 8
	ld x13, 0(sp)
	addi sp,sp,8
	ld x14, 0(sp)
	mul x15,x13,x14
	sd x15,0(sp)
	addi sp,sp,-8
	addi x4,x4,1
	beq x0,x0,pusher


divOPP:
	addi sp, sp, 8
	ld x13, 0(sp)
	addi sp,sp,8
	ld x14, 0(sp)
	div x15,x13,x14
	sd x15,0(sp)
	addi sp,sp,-8
	addi x4,x4,1
	beq x0,x0,pusher

result:
	addi sp, sp, 8
	ld x17,0(sp)
	blt x17,x0,add96
	addi x17,x17,-96
	ebreak x0,x0,0

add96:
	addi x17,x17,96
	ebreak x0,x0,0