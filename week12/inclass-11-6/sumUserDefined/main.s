.global main

.section .rodata
inPrompt: .asciz "input a number: "
inDec: .asciz "%d"
outStr: .asciz "sum: %d\n"

.section .data
@ int len = 5;
len: .word 5
@ int a[5]
array: .skip 20  //each element is 4 bytes, 5 elements so i need 20 spaces

.text
main: 					@ int main(){
	str lr, [sp, #-4]!  //push {lr}

	ldr r4, =array
	ldr r5, =len
	ldr r5, [r5]

	mov r6, #0
inputLoop: @ for( int i = 0; i < len; i++ ){
	cmp r6, r5
	bge inputLoopEnd
	//print prompts
	ldr r0, =inPrompt
	bl printf			@ printf( "input a number: ");

	//get the number from user
	ldr r0, =inDec
	mov r1, r4
	bl scanf			@ scanf( "%d", &a[i] );

	//increment the array, and i
	add r4, #4			//next address from the array
	add r6, #1 			//i++
	bal inputLoop
inputLoopEnd: 			@ }

	//function call to sumArr
	ldr r0, =array
	mov r1, r5
	bl sumArr 			@ int result = sumArr( a, len );

	mov r1, r0			//mov the sume from r0 aka return register to the 2nd parameter
	ldr r0, =outStr
	bl printf			@ printf( "sum: %d\n", result );
	
	mov r0, #0
	pop {pc} 	@ return 0;
@ } //end of main


sumArr: 				@ int sumArr( int arr[], int size ){
	push {r4,lr}
	mov r2, #0 			@ int sum = 0;
	mov r3, #0			//int i = 0
sumLoop:				@ for( int i = 0; i < size; i++ ){
	cmp r3, r1
	bge sumLoopEnd

	ldr r4, [r0], #4	//post -indexing it'll add 4 after i access
	add r2, r2, r4		//add the to sum @ sum += arr[i];
	add r3, r3, #1		//increment my i++ 
	bal sumLoop
sumLoopEnd: 			@ }
	mov r0, r2			@ return sum;
	pop {r4,pc}
@ } end of sumArr function