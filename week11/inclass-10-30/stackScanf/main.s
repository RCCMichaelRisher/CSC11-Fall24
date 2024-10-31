.global main

.section .rodata
outPrompt: .asciz "enter a number: ";
outResult: .asciz "you entered %d\n"
inDec: .asciz "%d"

.text
main:
	str lr, [sp, #-4]! //push lr using pre-indexing

 	ldr r0, =outPrompt
	bl printf

	sub sp, #4	//allocate 4bytes onto the stack
	//start doing scanf like normal
	ldr r0, =inDec
	mov r1, sp //load the address we allocated in the stack as the destination for the user input
	bl scanf

	ldr r0, =outResult
	ldr r1, [sp], #4
	bl printf
	

	@ add sp, #4

	mov r0, #0 		//put 0 into the retrun register
	ldr pc, [sp], #4 //pop to pc using post-indexing, then return r0 here