.global main

.section .data
//2 floating point numbers
val1: .float 45.67
val2: .float 3.6
//print string for numbers
out: .asciz "you result is: %f"


.text
main:
	push {lr}
	//load the floating numbers
	ldr r0, =val1 //get the address
	vldr s0, [r0] //gets the value from the address

	ldr r0, =val2 //get the address of val2
	vldr s2, [r0] //get the value from the address

	//do the operation
	vdiv.f32 s4, s0, s2 //do the division

	//Vector ConVerT .toDataType .fromDataType
	vcvt.f64.f32 d0, s4 //promote the 32bit float to 64bit double in order to print
	ldr r0, =out
	vmov r1, r2, d0 //load the 64 bit d0 into 2 32 bit registers
	bl printf //call printf
	

	//print the result
	pop {pc}

/*
other operation you can use
where fxx is the data type you are working with either f64 or f32
vdiv.fxx regDest, regSource, regSource
vmul.fxx
vadd.fxx
vsub.fxx
vnmul.fxx  -(x*y)
vabs.fxx   absolute value
vsqrt.fxx square root
 */
