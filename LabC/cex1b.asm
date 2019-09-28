s1: DC "sum(1..n-1) Enter n:\0"
c1: DC "sum(1.."
c2: DC ")="
s2: DC "\n(n*(n-1))/2="
	
	addi x2,x0,s1
	ecall x1,x2,4; Main message..."sum(1..n-1) Enter n:\0"
	ld x3,c1(x0)
	ld x4, c2(x0)
	addi x5,x0,s2
	ecall x6,x0,5;ecall 5 accepts integers, this is the n you want to sum up to
	addi x11,x6,-1 ;computing the (n*(n-1))/2 equation
	mul x12,x11,x6
	srli x12,x12,1 ;finished computation

summer:
	addi x7,x7,1
	beq x7,x6,end
	add x16,x16,x7;
	beq x0,x0,summer



end:
	
	ecall x1,x3,3 ;"sum(1.."
	ecall x16,x16,0
	ecall x4,x4,3
	ecall x16,x16,0 ; outputing the sum
	ecall x1,x5,4 ; outping string "(n*(n-1))/2="
	ecall x12,x12,0
