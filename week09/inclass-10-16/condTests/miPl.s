.global main

.section .data
outFlow: .asciz "is positive\n"
outNotCar: .asciz "is neg\n"

.text
main:
	push {lr}

	mov r0, #150
	mov r1, #100

	rsbs r3, r0, r1 //add by itself doesnt change cpsr have to add the s flag to update cpsr
	//cmp and tst

	bpl overflow // V==1
	bmi not // V==0
overflow:
	ldr r0, =outFlow
	bal exit
not:
	ldr r0, =outNotCar
exit:
	bl printf

	mov r0, #0
	pop {pc}
