.global _start

.data

var1: .word 3
var2: .word 4

.text
_start:
mov r0, #0
mov r1, r0
mov r2, r0
mov r3, r0

//now start
ldr r0, =var1
ldr r1, =var2


ldr r2, [r0]
//str r2, [r1, #2]
add r2, r2, #2 //add 2
str r2, [r1, #4] //address mode offset
str r2, [r1, #4]! //address mode pre-indexed
ldr r3, [r1], #4 //address mode post-indexed

	
	
	
addr1: .word var1
addr2: .word var2