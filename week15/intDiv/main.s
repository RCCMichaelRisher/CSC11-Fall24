.global main

.section .rodata
out: .asciz "%d\n"

.text
main:
	push {lr}
	mov r1, #8
	mov r2, #2
	
	ldr r0, =out
	sdiv r1, r1, r2 //signed division of r1/r2
	bl printf

	mvn r1, #8 //mov r1, #-8
	mov r2, #2
	ldr r0, =out
	sdiv r1, r1, r2 //signed division of r1/r2
	bl printf

	mvn r1, #8 //mov r1, #-8
	mov r2, #2
	ldr r0, =out
	udiv r1, r1, r2 //unsigned division of r1/r2
	bl printf


	mov r0, #0
	pop {pc}
	