.global _start
//.func main

_start:

mov r0, #0b10111
mov r1, #0b1111 

bic r0, r0, r1



mov r7, #1
swi 0


