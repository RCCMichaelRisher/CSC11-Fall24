.global main

.align 4
.section .rodata
inBase: .asciz "Enter a number for the base: "
inX: .asciz "Enter a number for the exponent: "
outResult: .asciz "%d ^ %x = %d\n"
inDec: .asciz "%d"

.align 4
.section .data
base: .word 0			@ int base;
x: .word 0				@ int x;

/**
r4 = result
 */
.text
main: 					@ int main(){
	push {lr}
	mov r4, #1			@ int result = 1;

	ldr r0, =inBase
	bl printf			@ printf( "Enter a number for the base: " );

	ldr r0, =inDec
	ldr r1, =base
	bl scanf			@ scanf( "%d", &base );

	//we want to make the exponent is always positive
	//validation loop
do: 					@ do{
	ldr r0, =inX
	bl printf 			@ printf( "Enter a number for the exponent: " );

	ldr r0, =inDec
	ldr r1, =x
	bl scanf 			@ scanf( "%d", &x );

	ldr r1, =x
	ldr r1, [r1]
	cmp r1, #0
	blt do 				@ } while( x < 0 );
//endDo:

	//do the multiplication
	// 4^2 = 4 * 4	
	// 4^n = 4 * 4 * 4	* .... 
	//load in the base
	ldr r2, =base
	ldr r2, [r2]

	mov r0, #0 			@ int i = 0
/*temp register state
r0 = i
r1 = exponent
r2 = base
r4 = result
 */
for:					@ for( int i = 0; i < x; i++ ){
	cmp r0, r1
	bge endFor 	
	mul r4, r4, r2 		@ result = result * base;
	add r0, #1
	bal for
endFor: 				@ }
	//print the output
	ldr r0, =outResult
	push {r1} 			//put the exponent in the stack temporarly
	mov r1, r2			//base from r1 to r2
	pop {r2}			//take the exponent of the stack and put into r2
	mov r3, r4 	
	bl printf			@ printf( "%d ^ %x = %d\n", base, x, result );

	mov r0, #0
	pop {pc}			@ return 0;
@ }
