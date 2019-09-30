;f2 will hold the magnitude of my interval, stop the program when the interval < 0.001
stopper: DF 0.001	
fld f20 stopper(x0)
;f3 will hold my a
A: DF 1.0
fld f3,A(x0)
;f4 will hold my b
B: DF 5.0
Bneg: DF -5.0
fld f4,B(x0)
fld f6,Bneg(x0)
;f5 will hold my f(m)
		
;x6 will hold the value to find the root of
		addi x6,x0,5 ;I want to find the root of 5

m: DF 2.0
m1: DF 5.0
fld f10,m(x0);2.0
fld f11,m1(x0);-5.0

while:
	
	blt f2,f20,end
	fmul.d f13,f3,f3;A*A
	fadd.d f13,x13,f6 ;f13 is now my f(a)
	fmul.d f14,f4,f4
	fadd.d f14,f14,f6 ;f14 is now my f(b)
	addi f7,f3,f4 ;(a+b)
	fdiv.d f7,f7,f10;(a+b)/2.0
	fmul.d f5,f7,f7
	fadd.d f5,f5,f11; computed f(m)
	
	blt f5,f0,replaceA ;if f(m) < 0 proceed to replace a
	beq x0,x0,replaceB ;else replace b

replaceA:
	
	
	


	
