.global main

.data
num1: .float 5.1 //1.54321
num2: .float 5.1

.text
main:
	push {lr}


	//load num1
	ldr r0, =num1
	vldr s14, [r0]

	//load num2
	ldr r0, =num2
	vldr s15, [r0]

	vcmp.f32 s14, s15
	//copy the vector floating point status registers to the Application Program Status Register (APSR) aka the regular registers
	vmrs APSR_nzcv, FPSCR

	//use the cmp flags from floating in our integer registers to move values based if the floats are equal
	moveq r0, #0
	movne r0, #255

	pop {pc}
	