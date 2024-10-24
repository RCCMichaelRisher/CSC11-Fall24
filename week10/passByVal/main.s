.global main
.global passByVal

.align 4
.section .rodata
outVal1: .asciz "val1: %d\n"
outVal2: .asciz "val2: %d\n"
outVal3: .asciz "val3: %d\n"
outR0: .asciz "r0: %d\n"
outR1: .asciz "r1: %d\n"
outR2: .asciz "r2: %d\n"
outSum: .asciz "sum: %d\n"

.align
.section .data
val1: .word 125			@ int a = 125;
val2: .word 100			@ int b = 100;
val3: .word 256			@ int c = 256;

.text
passByVal: 				@ void passByVal( int r0, int r1, int r2 ){
	push {lr}

	add r3, r0, r1 		@ t = r0 + r1;
	add r3, r3, r2 		@ t = t + r2;

	push {r0-r2}		//save parameter values before overwriting
	ldr r0, =outSum		@ printf( "sum: %d\n", t );
	mov r1, r3
	bl printf
	pop {r0,r1,r2}		//restore, r0-r2 == r1,r2,r3


	add r0, r0, #1 		@ r0 = r0 + 1;
	add r1, r1, #3		@ r1 = r1 + 3;
	sub r2, r2, #4 		@ r2 = r2 - 4;

//print registers
	push {r0-r2}
	mov r1, r0			//have to move before i overwrite in the next line
	ldr r0, =outR0
	bl printf			@ printf( "r0: %d\n", r0 );
	pop {r0-r2}			//restore r0-r2

	push {r0-r2}
	ldr r0, =outR1
	bl printf			@ printf( "r0: %d\n", r0 );
	pop {r0-r2}			//restore r0-r2

	push {r0-r2}
	mov r1, r2			//have to move before i overwrite in the next line
	ldr r0, =outR2
	bl printf			@ printf( "r0: %d\n", r0 );
	pop {r0-r2}			//restore r0-r2


	pop {pc} 		@ return;
@ } end passByVal
	


main: 				@ int main(){
	push {lr}
	
	//load val1, val2, val3 addresses into r4-r6
	ldr r4, =val1
	ldr r5, =val2
	ldr r6, =val3

	//load the value at thoses address into r0-r3
	ldr r0, [r4]
	ldr r1, [r5]
	ldr r2, [r6]

	//print before the function call
	//print val1
	push {r0-r2}		//save val1-val2 so we dont erase them
	mov r1, r0
	ldr r0, =outVal1
	bl printf			@ printf( "val1: %d\n", a );
	pop {r0-r2} 		//restore val1-val2 to the register r0-r3

	//print val2
	push {r0-r2}
	//dont need to move r1 
	ldr r0, =outVal2
	bl printf
	pop {r0-r2} 		@ printf( "val2: %d\n", a );

	push {r0-r2}
	mov r1, r2
	ldr r0, =outVal3
	bl printf
	pop {r0-r2} 		@ printf( "val3: %d\n", a );

	bl passByVal		@ passByVal( a, b, c );

	//reload the values since calling functions change register r0-r3
	ldr r0, [r4]
	ldr r1, [r5]
	ldr r2, [r6]

	//print out after the function
	//print val1
	push {r0-r2}		//save val1-val2 so we dont erase them
	mov r1, r0
	ldr r0, =outVal1
	bl printf			@ printf( "val1: %d\n", a );
	pop {r0-r2} 		//restore val1-val2 to the register r0-r3

	//print val2
	push {r0-r2}
	//dont need to move r1 
	ldr r0, =outVal2
	bl printf
	pop {r0-r2} 		@ printf( "val2: %d\n", a );

	push {r0-r2}
	mov r1, r2
	ldr r0, =outVal3
	bl printf
	pop {r0-r2} 		@ printf( "val3: %d\n", a );

	mov r0, #0
	pop {pc}			@ return 0;
@ } end of main fn


