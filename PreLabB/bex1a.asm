a: DD 1024
b: DD 2048
c: DD 4096
d: DD 8192

ld x6, a(x0)
ld x7, b(x0)
ld x8, c(x0)
ld x9, d(x0)

add x10,x6,x7
add x11,x8,x9
add x5,x10,x11

srli x5,x5,2
