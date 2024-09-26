.global main
.extern intSqrt //DO NOT REMOVE


.align 4
.section .data
// your data here


.align 4
.section .rodata
// your read only data here

.text
main:
    push {lr}
	
	// this is dummy code to show you how to use the intSqrt function
	// you can erase this and put your code here
	mov r0, #4
    bl intSqrt                 // Call a square root routine

    pop {pc} // should return 2 if the sqrt is working
