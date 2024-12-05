.global main

.section .data
x: .float 0
y: .float 1.23
z: .float 4.56

.section .rodata
outPrompt: .asciz "Enter a floating point number: "
inFlt: .asciz "%f"
out: .asciz "Entered x=%f, y=%f, z=%f sum=%f\n"
debug: .asciz "is %f\n"

.text
main:
	push {fp,lr}

	ldr r0, =outPrompt
	bl printf				@ printf( outPrompt );

	//get teh value from user
	ldr r0, =inFlt
	ldr r1, =x
	bl scanf 				@ scanf( inFlt, &x );

	//load the value from memory
	ldr r1, =x
	vldr s0, [r1] //get the float out of the address
	vcvt.f64.f32 d5, s0 //converted this for printing

	//load the other numbers
	ldr r1, =y
	vldr s2, [r1] //load y
	vcvt.f64.f32 d6, s2 //convert this for printing

	ldr r1, =z
	vldr s4, [r1] //load z
	vcvt.f64.f32 d7, s4 //convert for printing

	vadd.f32 s6, s0, s2 //sum = x + y
	vadd.f32 s6, s6, s4 //sum = sum + z
	vcvt.f64.f32 d8, s6 //convert for printing


	ldr r0, =out //out param loaded
	vmov r2, r3, d5 //x param loaded
	//i need to to put others params into the stack call printf
	// 3 double. a double is 8 bytes 8*3
	sub sp, #24 // reserves 24 bytes space on the stack
	//store y on the stack
	vstr d6, [sp]
	//store z
	vstr d7, [sp, #8]
	//store my sum
	vstr d8, [sp, #16]
	bl printf 						@ printf( out, x, y, z, sum );	

	//clean up the stack after we used it
	add sp, #24 //clears the space we just used.
	
	mov r0, #0
	pop {fp,pc}