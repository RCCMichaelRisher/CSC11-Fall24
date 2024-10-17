.global main

.section .data
outCar: .asciz "carry flag is set\n"
outNotCar: .asciz "carry flag is not set\n"

.text
main:
	push {lr}

	ldr r0, =0xffffffff
	ldr r1, =0x00000002

	adds r3, r0, r1 //add by itself doesnt change cpsr have to add the s flag to update cpsr
	//cmp and tst

	bcs carried //C==1
	bcc not //C==0
carried:
	ldr r0, =outCar
	bal exit
not:
	ldr r0, =outNotCar
exit:
	bl printf

	mov r0, #0
	pop {pc}
