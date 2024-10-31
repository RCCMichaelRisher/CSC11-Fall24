.global main
main:
	mov r0, #2
	mov r1, #22
	mov r2, #17
	
	str r0, [sp, #-4]!	//preindexing mode for str

	push {r1}
	push {r2}
	
	
	//pop {r3}
	
	ldr r3, [sp], #4 //load in r3 and deallocate that space
	ldr r4, [sp] //load the next value in the stack but not remove from the stack
	ldr r5, [sp], #4 //load that same value from previous into r5 but remove it from stack
	ldr r6, [sp], #4