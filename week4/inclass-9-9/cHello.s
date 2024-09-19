.global main

.align 4
.section .rodata
helloStr: .asciz "Hello World\n"

.text
main:
	push {lr}

	ldr r0, =helloStr
	bl printf
	
	pop {pc}

