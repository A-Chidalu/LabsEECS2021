s1: DC "Enter an integer value:"
c: DM 1
s2: DC "Enter a memory adress:"
c1: DC "integer:"
c2: DC "adress:"
ld x29,c2(x0)
ld x28,c1(x0)
add x30,x0,s1
add x31,x0,s2
ecall x0,x30,4 ; output "Enter an ineger..."
ecall x6, x28, 5 ;integer
ecall x0,x31,4 ; output "enter a memory adress"
ecall x7,x29,5 ;adress
addi x7,x7,-24
sd x6,c(x7)