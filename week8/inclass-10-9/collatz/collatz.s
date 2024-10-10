// rules
// If the number is even, divide it by two.
// If the number is odd, triple it and add one.

.global main


.section .rodata
outVals: .asciz "%d, "
outCount: .asciz "\n%d times\n"

.section .data
n: .word 123456

.text
main: 					@ int main(){
	push {lr}
	@ mov r4, #1234 			@ int n = 5; //starting number
	ldr r4, =n
	ldr r4, [r4]
	
	mov r5, #0			@ int c = 0; //steps take to reach 1

while:
	cmp r4, #1 
	beq endWhile 		@ while( n != 1 ){
// cmp r0, r1 = r0 - r1
// tst r0, r1 = r0 & r1
	tst r4, #1 			@ if( n & 1 ) { //test if even or oDd using ands
	beq even // Zero flag is on so the result of r4 & 1 = 0 
	bne odd // will be r4 & 1 = 1
odd:
	mov r1, #3
	mul r0, r4, r1 //we can  not have immediate values in the mul instruction has to be register ONLY
	add r4, r0, #1		@ n = 3 * n + 1;
	bal beforeEndWhile
@ } 
even: 					@ else {
@ //even case
	//8 >> 1 = 4
	//1000 >> 1 = 0100 
	mov r4, r4, lsr #1  @ n = n / 2;
	// lsr r4, #1  //etither option works
	bal beforeEndWhile
@ }
beforeEndWhile:
	add r5, #1		//short hand way
						@ c = c + 1;		// count the number of steps to reach 1
	ldr r0, =outVals
	mov r1, r4
	bl printf			@ printf( "%d, ", n );
	bal while
endWhile: 				@ }

	
//print the output of count
	ldr r0, =outCount
	mov r1, r5 			
	bl printf			@ printf( "\n%d times\n", c );


	mov r0, #0			@ return 0;
	pop {pc}
@ }
