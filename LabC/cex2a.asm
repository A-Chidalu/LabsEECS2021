vecU: DF 1.21, 5.85, -7.3, 23.1, -5.55
vecV: DF 3.14, -2.1, 44.2, 11.0, -7.77
mem: DM 1
addi x9,x0,40 ; break if index register gets to be 40

;all i have to do is multiply each index and add it into my sum register

forloop:
	beq x8,x9,end
	fld f10,vecU(x8)
	fld f11,vecV(x8)
	fmul.d f12,f10,f11
	fadd.d f13,f13,f12
	addi x8,x8,8
	beq x0,x0,forloop

end: ;Store the dot product in the memory i allocsted
	
	fsd f13,mem(x0)
	ebreak x0,x0,0