.global main
.section .rodata
out: .asciz "num = %d\n"

.text
main:
	push {lr}

	//srand( time( 0 ) )
	mov r0, #0 //parameter for time
	bl time //return some big number into r0
	bl srand

	bl rand //some number returned r0

	//before we and
	push {r0}
	mov r1, r0 //move to not overwrite
	ldr r0, =out
	bl printf
	pop {r0}


	//after and
	and r0, r0, #99

	mov r1, r0 //move to not overwrite
	ldr r0, =out
	bl printf

	mov r0, #0
	pop {pc}