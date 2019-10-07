str1: DC "sampled text\0"   
str2: DC "Yes" 
str3: DC "                       "
addi a1, x0, str1
addi a2, x0, str2 
addi a3, x0, str3
jal x1, delch1  
addi x6, x0, str3 ;output 
ecall x0, x6, 4  
ebreak x0, x0, 0 ;finish
       
appch:
 
loop1:    
lb x5, 0(a1)
beq x5, x0, secondstr 
sb x5, 0(a3)  
addi a1, a1, 1
addi a3, a3, 1  
jal x0, loop1 
 

secondstr: 
lb x5, 0(a2)
beq x5, x0, end1  
sb x5, 0(a3)  
addi a2, a2, 1
addi a3, a3, 1  
jal x0, loop1 
 
end1: jalr x0, 0(x1) ;return  
