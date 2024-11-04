.global main
.func main

.align 4
.section .rodata
//constant inited data
outstr: .asciz "output is: %d\n"

.align 4
.section .bss
//un-inited data

.align 4
.section .data
//non constant un-inited


.text
main:
	push {lr}

	mov r0, #20
	mov r1, #5
	add r1, r0, r1
	mov r0, #10
	add r1, r0, r1

	//print the data
	ldr r0, =outstr
	bl printf

	pop {lr}


