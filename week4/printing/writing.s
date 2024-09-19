.global _start

.align 4
.section .data
string: .ascii "Hello World\n"

_start:
	mov r7, #4 //syscall number
	mov r0, #1 // stdout is moniter
	mov r2, #12 // the length of the string
	ldr r1, =string //load the string
	swi 0 //call the system call
_exit:  //exit with a syscall
	mov r7, #1
	swi 0
