inA: DC "Enter X:\0"
inB: DC "Enter Y:\0"

addi x4,x0,inA
addi x5,x0,inB

ecall x1,x4,4
ecall x7,x0,5 ;X
ecall x1,x5,4
ecall x8,x0,5 ;Y
jal x1,gcd
gcd:
	beq x8,x0,return
	;else:
	add x6,x0,x7
	add x7,x0,x8 ;make the value of x into the old y value
	beq x7,x0,return
	rem x8,x6,x8
	jalr x0,0(x1)


return:
	ecall x0,x7,0