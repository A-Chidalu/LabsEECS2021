dir: 
DC "John"
DC "11111"
DC "Nick"
DC "22222"
DC "Sara"
DC "11111"
DC "Nick"
DC "33333"
DD 0

s1: DC "Enter a phone or a name \n to search for:" ;-----main message

add x9,x0,x0 ;Need a counter to search through the variables

addi x30,x0,s1 ;----loading the string

loop: ecall x0,x30,4 ;---Output the main message
ecall x6,x0,8 ;---Recieveing the number or name
beq x0,x0,search ;going to the searcher loop next


search: ld x10,dir(x9) ;--starting to load things into the base of the dir
      beq x10,x0,end ;---if we load a 0 end the program
      beq x6,x10,finisher ;---if we find what we are looking for go to finisher
      addi x9,x9,8
      beq x0,x0,search

finisher: addi x9,x9,8 
	  ld x12, dir(x9)
	  ecall x12,x12,3
	  beq x0,x0,reset


end: ebreak x0,x0,0

reset: add x9,x0,x0
       beq x0,x0,loop
