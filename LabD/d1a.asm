s1: DC "No of ints:\0"
s2: DC "Int"
s3: DC ":"
s4: DC " "
STACK: EQU 0x100000
	lui sp, STACK>>12
	addi x5, x0, s1
	ecall x1, x5, 4 ;out question
	ecall x5, x0, 5 ;inp No of ints
	addi x6, x0, 1 ;counter
loop1: ld x7, s2(x0)
	ecall x1, x7, 3 ;out Int
	ecall x1, x6, 0 ;out index
	ld x7, s3(x0)
	ecall x8, x7, 5 ;out :, in #
	sd x8, 0(sp) ;push
	addi sp, sp, -8 ;push
	addi x6, x6, 1 ;counter
	bge x5, x6, loop1
	addi x6, x0, 1 ;counter
loop2: ld x7, s2(x0)
	ecall x1, x7, 3 ;out Int
	ecall x1, x6, 0 ;out index
	ld x7, s3(x0)
	ecall x1, x7, 3 ;out :, in #
	addi sp, sp, 8 ;pop
	ld x8, 0(sp) ;pop
	ecall x0, x8, 0 ;out :, in #
	addi x6, x6, 1 ;counter
	bge x5, x6, loop2