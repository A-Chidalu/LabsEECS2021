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

s1: DC "Enter a phone or a name \n to search for:"
addi x30,x0,s1

loop: ecall x0,x30,4

      
