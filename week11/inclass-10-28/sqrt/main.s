.global main
.extern divMod

.section .rodata
inPrompt: .asciz "enter a number to approximate the square root "
inDec: .asciz "%d"
outError: .asciz "the number must greater than zero\n"
outResult: .asciz "the approximate sqrt of %d is %d\n"

.section .data
num: .word 0

.text
main: 							@ int main(){
	push {lr}
@ //ask for the number to square root
doValid:
	ldr r0, =inPrompt
	bl printf					@ printf( "enter a number to approximate the square root ");

	//ask for input
	//load the parameters pattern and where your storing it
	ldr r0, =inDec
	ldr r1, =num
	bl scanf 					@ scanf( "%d", &num );

	//test if its negative
	ldr r4, =num //get the address
	ldr r4, [r4] //get the value from address
	cmp r4, #0
	ble zero 					@ if( num <= 0 ){
	b notZero
zero:
	ldr r0, =outError
	bl printf					@ printf( "the number must greater than zero\n" );
	bal doValid					@return 0
notZero:
/* 
r4 = num
r5 = guess
r6 = prevGuess
r7 = t
 */
	@ mov r5, r4, lsr, #1 == lsr r5, r4, #1
	lsr r5, r4, #1 //shift to right by 1 	int guess = num >> 1;  //since div is expensive lets shift //x_n 

@ int prevGuess;  //x_n-1

//formula
@ /*
@ x_n+1 = 1/2( x_n + num/x_n)
@ */
do: 						@ do{	
@ //1/2( x_n + num/x_n)
	mov r6, r5 				@ prevGuess = guess;
	//get parameters read for div mod
	//r0 numerator
	//r1 denom
	mov r0, r4
	mov r1, r5
	bl divMod //the division goes into r0 which is the return value for all functions
	mov r7, r0 				@ int t = num / guess;

	add r7, r5, r7			@ t = guess + t;

	//divide by 2
	lsr r5, r7, #1			@ guess = t >> 1; //that divides the t by 2

	sub r0, r5, r6
	bl abs //absolute value back r0  which is the return value

	cmp r0, #0				@ } while ( abs( guess - prevGuess ) > 0 );
	bgt do
//otherwise we are done and need to stop looping

	//output is 
	ldr r0, =outResult
	mov r1, r4				//mov num to 2nd parameter
	mov r2, r5				//moves guess to the 3rd parameter
	bl printf 				@ printf( "the approximate sqrt of %d is %d\n", num, guess );
exit:
	mov r0, #0
@ return 0;
	pop {pc}
@ }

abs: 						@ int abs( int x ){
	push {lr}
	cmp r0, #0
	bge absEnd
	rsb r0, r0, #0  		@ return ( x < 0  ) ? -x : x; 
	//another way to do it is using 2's comp
	// mvn r0, r0  mov negative number. 1's comp to r0
	// add r0, #1  add 1 to make it a 2's comp
absEnd:
@ //ternary is a 1 line if
	pop {pc}
@ }
