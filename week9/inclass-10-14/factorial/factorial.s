.global main

.align 4
.section .rodata
prompt: .asciz "Enter a possitive number greater than 0: "
inDec: .asciz "%d"
outResult: .asciz "%d! is %d\n"


.align 4
.section .data
num: .word 0;


.text
main: 					@ int main(){
	push {lr}
do: 					@ do{
	//prompt number
	ldr r0, =prompt
	bl printf			@ printf( prompt );

	ldr r0, =inDec
	ldr r1, =num
	bl scanf			@ scanf( inDec, &num );

	//load the number
	ldr r1, =num
	ldr r1, [r1]
	cmp r1, #0
	ble do 				@ } while( num <= 0 ); // need to valid
	@ bgt exit //exit case
//do the the math
	mov r2, #1 			@ int result = 1;
	mov r0, #1 			@ int i = 1
for:					@ for( int i = 1; i <= num; i++ ) {
	cmp r0, r1
	bgt endFor
	mul r2, r2, r0 		@ result = result * i;
	add r0, r0, #1		@ i++
	bal for
endFor:					@ }

//out the answer
	ldr r0, =outResult
	//r1 still has the num value it didn't change
	//r2 still has the result it didn't change either
	bl printf			@ printf( outResult, num, result );

	mov r0, #0
	pop {pc} 			@ return 0;
@ }
