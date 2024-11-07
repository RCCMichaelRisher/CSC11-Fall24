.global main


.section .data
len: .word 5 	@ int len = 5;
array: .skip 20 @ int arr[len];  20 because 4 byte * 5 elements = 20 total bytes

.section .rodata
outPrompt: .asciz "enter a number: "
inDec: .asciz "%d"
outLoop: .asciz "%d, "
newline: .asciz "\n"

.text
main:
	push {lr}
	//array init
	ldr r0, =array
	ldr r1, =len
	ldr r1, [r1]

	//input the array
	bl inputArray			@inputArray( arr, len );

@ //print? 

	//sort it
	ldr r0, =array			//reload since r0-r3 could change
	ldr r1, =len
	ldr r1, [r1]
	bl bubblesort 			@bubblesort( arr, len );

	//print sorted version
	ldr r0, =array			//reload since r0-r3 could change
	ldr r1, =len
	ldr r1, [r1]
	bl printArray			@printArray( arr, len );

	mov r0, #0 				@ return 0;
	pop {pc}
//end of main

bubblesort: 				@ void bubblesort( int arr[], int len );
	push {r4-r7,lr}
	sub r1, r1, #1			//len - 1 since we never len by itself
	mov r2, #0				//i = 0
	bsOuterLoop:			@ for( int i = 0; i < len - 1; i++ ){
		cmp r2, r1
		bge bsOuterLoopEnd
		//set up next for loop
		mov r3, #0
		bsInnerLoop: 		@ for( int j = 0; j < len - 1; j++ ){
			cmp r3, r1
			bge bsInnerLoopEnd
				//load arr[j]
				add r4, r0, r3, lsl #2	//the address of arr[j]
				ldr r5, [r4]			//the value of arr[j]

				//load arr[j+1]
				add r6, r3, #1			//get j+1
				add r6, r0, r6, lsl #2	//baseAdr + ( (j+1) * 4 ). address of arr[j+1]
				ldr r7, [r6]			//value of arr[j+1]

				cmp r5, r7				// if arr[j] > arr[j+1]
										@ if( arr[j] > arr[j + 1]) { //if the current is bigger then the next move to the right
				ble bsNoSwap
				//no need for temp since the address and value of both items
				@ ldr dest, where
				@ str where, dest
				str r7, [r4]			//store arr[j+1] into the arr[j] spot
										@ arr[ j ] = arr[ j + 1 ];	//saved the smaller where the big was, moving the small values to the left
				str r5, [r6]			//store arr[j] into the arr[j+1] spot
										@ arr[ j + 1 ] = temp;		//the value that was smaller is now the bigger value moving the bigger to the right
				bsNoSwap: 				@ }
				//increment the inner loop j
				add r3, r3, #1
				bal bsInnerLoop
		bsInnerLoopEnd: 		@ }
		//increment the outer loop i
		add r2, r2, #1
		bal bsOuterLoop
	bsOuterLoopEnd: 		@ }

	pop {r4-r7,pc}
//edn bubble

inputArray: 				@ void inputArray( int arr[], int len );
	push {lr}
	mov r2, #0
	iaLoop:					@ for ( int i = 0; i < len; i++ ){
		cmp r2, r1
		bge iaLoopEnd 	
		//print=ing
		push {r0-r2}		//save the registers since printf will overwrite
		ldr r0, =outPrompt
		bl printf			//call printf  @ printf( "enter a number: ");
		pop {r0-r2}			//bring the back

		//get input
		push {r0-r2}
		mov r1, r0			//mov the array address into r1
		ldr r0, =inDec
		bl scanf 			@ scanf( "%d", &arr[i] );
		pop {r0-r2}

		//increment the counter and such
		//incrent the array address
		add r0, r0, #4		//incremenr arry by 4
		add r2, r2, #1		//increment the i++
		bal iaLoop
	iaLoopEnd: 				@ }
	pop {pc}
//end inputarray

printArray: @ void printArray( int arr[], int len );
	push {lr}
	mov r2, #0
	paLoop: 			@ for ( int i = 0; i < len; i++ ){
		cmp r2, r1
		bge paLoopEnd

		//print
		push {r0-r2}
		ldr r1, [r0]
		ldr r0, =outLoop
		bl printf		@ printf( "%d, ", arr[i] );
		pop {r0-r2}		//restore the registers
		//increment things
		add r0, r0, #4
		add r2, r2, #1
		bal paLoop
	paLoopEnd: 			@ }

	ldr r0, =newline
	bl printf 			@ printf( "\n" );	
	pop {pc}
//end printarryay
