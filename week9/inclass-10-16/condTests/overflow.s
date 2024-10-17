.global main

.section .data
outFlow: .asciz "overflow flag is set\n"
outNotCar: .asciz "overflow flag is not set\n"

.text
main:
	push {lr}

	ldr r0, =0x7ffffffe
	ldr r1, =0x00000001

	adds r3, r0, r1 //add by itself doesnt change cpsr have to add the s flag to update cpsr
	//cmp and tst

	bvs overflow // V==1
	bvc not // V==0
overflow:
	ldr r0, =outFlow
	bal exit
not:
	ldr r0, =outNotCar
exit:
	bl printf

	mov r0, #0
	pop {pc}
