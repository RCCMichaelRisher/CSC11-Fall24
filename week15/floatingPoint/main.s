.global main


.section .data
a: .float 3.14159
bc: .float 0.1
out: .asciz "is %f \n"
.text
main:
@ {
	push {lr}

	ldr r0, =a //load the address of a
	vldr s0, [r0] //load the value from the address and put into a single percision register s0

	ldr r0, =bc //load the b address
	vldr s2, [r0] //load the float value into s2 

	vmul.f32 s4, s0, s2 //multiply a 32 bit floating and put in s4

	//convert to 64 bit (8 byte)
	vcvt.f64.f32 d0, s4
	//vcvt convert to double/single
	//    .f64 to 64 bits
	//    .f32 from 32 bits
	//    d0  where im storing it
	//    s4  where it is reading from

	ldr r0, =out //load the print string
	vmov r1, r2, d0 //move the double from d0 into TWO 32bit registers
	bl printf
	//c automatically converts floating points to 8 byte floating numbers

	mov r0, #0
	pop {pc} 			@ return 0;
@ }
