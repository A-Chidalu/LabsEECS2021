addi sp, x0, 0 ;sp initialization
addi x6, x0, 1 ;const 1
addi a0, x0, 8 ;n=5
jal x1, fib ;call fib
ebreak x0, x0, 0
fib: blt x6, a0, recu ;if(1<a0)recursion
blt x0, a0, ret1 ;if(0<a0)return 1
addi a0, x0, 0 ;if(a0<=0)return 0
beq x0, x0, ret0
ret1: addi a0, x0, 1 ;if(a0<=)return 0
ret0: jalr x0, 0(x1) ;return
recu: addi sp, sp, -24 ;adjust sp (by 24 instead of 16)
sd x1, 16(sp) ;push ra
sd a0, 8(sp) ;push a0
10
addi a0, a0, -1 ;a0=a0-1
jal x1, fib ;recursive call
sd a0, 0(sp) ;push a0
ld a0, 8(sp) ;pop old a0
addi a0, a0, -2 ;a0=a0-2
jal x1, fib ;recursive call
ld x5, 0(sp) ;pop old a0
add a0, x5, a0 ;fib(a0)=fib(a0-1)+fib(a0-2)
ld x1, 16(sp) ;pop ra
addi sp, sp, 24 ;adjust sp
jalr x0, 0(x1) ;return