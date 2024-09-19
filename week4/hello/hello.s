.global main
.func main

.align 4
.section .rodata
// all constant initalized data goes here
hello: .asciz "Hello World\n"


.align 4 
.section .bss
//all the uninitalized data goes here - wont use this tille we get into dynamic arrays

.align 4
.section .data
//all non-constant initalized data goes here


.align 4
.text
main:
	push {lr}
	
	ldr r0, =hello
	bl printf

	pop {pc}
