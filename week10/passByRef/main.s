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
outBefore: .asciz "val1-val3 BEFORE function call\n"
outAfter: .asciz "val1-val3 AFTER function call\n"

.align
.section .data
val1: .word 125			@ int a = 125;
val2: .word 100			@ int b = 100;
val3: .word 256			@ int c = 256;


.text
passByRef: 				@ void passByRef( int* r0, int *r1, int *r2 ){
	push {r4-r6, lr}
	ldr r4, [r0]		@ int r4 = *r0;
	ldr r5, [r1]		@ int r5 = *r1;
	ldr r6, [r2]		@ int r6 = *r2;

	add r3, r4, r5 		@ t = r4 + r5;
	add r3, r3, r6 		@ t = t + r6;

	push {r0-r2}
	ldr r0, =outSum
	mov r1, r3
	bl printf 			@ printf( "sum: %d\n", t );
	pop {R0-R2}

	add r4, r4, #1 		@ r4 = r4 + 1;
	add r5, r5, #3 		@ r5 = r5 + 3;
	sub r6, r6, #4 		@ r6 = r6 - 4;

	//store the value at Rs int Rd
	//Rd is an address
	//str Rs, [Rd]
	str r4, [r0] 		@ *r0 = r4;			//store the values of r4 into the pointer at r0
	str r5, [r1] 		@ *r1 = r5;			//store the values of r5 into the pointer at r1
	str r6, [r2] 		@ *r2 = r6;			//store the values of r6 into the pointer at r2

	//print the register right now
	push {r0-r2}
	mov r1, r4
	ldr r0, =outR0
	bl printf			@ printf( "r0: %d\n", *r0 ); 
	pop {r0-r2}
	
	push {r0-r2}
	mov r1, r5
	ldr r0, =outR1
	bl printf			@ printf( "r1: %d\n", *r1 );
	pop {r0-r2}
	
	push {r0-r2}
	mov r1, r6
	ldr r0, =outR2
	bl printf			@ printf( "r2: %d\n", *r2 );
	pop {r0-r2}


	pop {r4-r6,pc} 			@ return;
@ } end passByRef fn

main: 					@ int main(){
	push {lr}

	//load the address of val variables
	ldr r4, =val1  //fiction addres 0x00
	ldr r5, =val2	// 0x04
	ldr r6, =val3
	//get the values from the addresses
	ldr r0, [r4]		@ int val1 = 125; //125
	ldr r1, [r5]		@ int val2 = 100; //100
	ldr r2, [r6]		@ int val3 = 256;

	push {r0-r2}
	ldr r0, =outBefore
	bl printf			@ printf( "val1-val3 BEFORE function call\n");
	pop {r0-r2}			//restore my values

	push {r0-r2}
	mov r1, r0
	ldr r0, =outVal1
	bl printf			@ printf( "val1: %d\n", val1 );
	pop {r0-r2}

	push {r0-r2}
	//val2 is already in r1
	ldr r0, =outVal2
	bl printf			@ printf( "val2: %d\n", val2 );
	pop {r0-r2}

	//val 3 print
	push {r0-r2} 
	mov r1, r2
	ldr r0, =outVal3
	bl printf			@ printf( "val3: %d\n", val3 );
	pop {r0-r2}

	//r0-r3 just had the values at this point
	//address are in r4-r6 not r0-r2
	// passbyRef( r0, r1, r2 );
	// passbyRef( 125, 100, 256 );
	// passbyRef( 0x00, 0x04, 0x08 );
	mov r0, r4 //address from val1 -> r0
	mov r1, r5 //address from val2 -> r1
	mov r2, r6 //address from val3 -> r2
	bl passByRef 		@ passByRef( &val1, &val2, &val3 ); //using & to get the address of these variables

	ldr r0, =outAfter
	bl printf			@ printf( "val1-val3 AFTER function call\n");

	//load the values of val-val3
	ldr r0, [r4]
	ldr r1, [r5]		//load the values from the address of val1,val2, val3
	ldr r2, [r6]

	//print val1-3
	push {r0-r2}
	mov r1, r0
	ldr r0, =outVal1
	bl printf			@ printf( "val1: %d\n", val1 );
	pop {r0-r2}

	push {r0-r2}
	//val2 is already in r1
	ldr r0, =outVal2
	bl printf			@ printf( "val2: %d\n", val2 );
	pop {r0-r2}

	//val 3 print
	push {r0-r2}
	mov r1, r2
	ldr r0, =outVal3
	bl printf			@ printf( "val3: %d\n", val3 );
	pop {r0-r2}

	mov r0, #0
	pop {pc}			@ return 0;
@ } end main fn
