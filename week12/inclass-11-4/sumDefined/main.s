.global main

.section .rodata
outStr: .asciz "sum: %d\n"

.section .data
@ int len = 5;
len: .word 5
@ int a[] = {10,20,30,40,50};
array: .word 10, 20, 30, 40, 50  		//array of 5 4-byte elements
						// so 5*4 makes 20 byte total space needed

.text
main:
	str lr, [sp, #-4]! 	//push lr into the stack using str with writeback

	//r0=arr
	//r1 = size
	ldr r0, =array
	ldr r1, =len
	ldr r1, [r1]
						@ int result = sumArr( a, len );
	bl sumArr 			//call the fun sumArr it return the answer into r0
	
	mov r1, r0			//mov the sum into r1 so we dont lose it
	ldr r0, =outStr
	bl printf 			@ printf( "sum: %d\n", result );
	
	
	mov r0, #0
	pop {pc} 			@ return 0;

sumArr:					@ int sumArr( int arr[], int size ){
/*
r0 = array
r1 = size 
*/	
	push {r4, lr}
	mov r2, #0			//sum = 0
	mov r3, #0			//int i = 0 
sumLoop:				//@ for( int i = 0; i < size; i++ ){
	cmp r3, r1			//i < size
	bge sumLoopEnd

	 
	ldr r4, [r0], #4	//load the address at r0 

						// r4 = arr[i]
						//then using post indexing it add 4 to address
						//which goes to the next element in the array
	add r2, r2, r4 		@ sum += arr[i];
	add r3, #1			//add to my incrementor
	bal sumLoop
sumLoopEnd:				@ }

	mov r0, r2
	pop {r4, pc} 		@ return sum;
@ } end of sumArr function