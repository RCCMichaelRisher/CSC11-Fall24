.global main
.extern intSqrt //DO NOT REMOVE


.align 4
.section .data
// your data here


.align 4
.section .rodata
testStr: .asciz "%d\n"
// your read only data here

.text
main:
    push {lr}
	
	// this is dummy code to show you how to use the intSqrt function
	// you can erase this and put your code here
	mov r0, #4
    bl intSqrt                 // Call a square root routine

    mov r1, r0
    ldr r0, =testStr
    bl printf

    pop {pc} // should return 2 if the sqrt is working
