.global main
main:
	mov r0, #1
	mov r1, #24
	mov r2, #16
	
	sub sp, #4 //allocate space on the stack
	str r0, [sp] 
	push {r1}
	push {r2}
	
	
	//pop {r3}
	ldr r3, [sp]
	add sp, #4 //deallocate that same space
	pop {r4,r5}