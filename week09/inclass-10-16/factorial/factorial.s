.global main
.global factorial

.func factorial


.section .rodata
prompt: .asciz "Enter a number: "
inDec: .asciz "%d"
outResult: .asciz "result is %d\n"

.section .data
num: .word 0

/*
Function ASSUMPTIONS
1. fns should not make assumptions about the contents cspr
2. fns can free modify register r0, r1, r2, r3
3. fns cannot assume anything about the contents of r0, r1, r2, r3
4. fns can free modify the lr register but the value upon entering will be needed when leaving the function
5. fns can modifiy all the remaining register as long as their values are restored, includes the sp, r4-r11
 */
.text
factorial: 			@ int factorial( int n ){
	push {lr}
	cmp r0, #0
	beq factBaseCase @ if( n == 0 ){
	
	push {r0}			//save my unmodified n in the stack
	sub r0, r0, #1		// get n-1 put into r0 for a function call
	bl factorial 		//puts the result into r0

	pop {r1}			//unmodified n back out of the stack and use it for the muliplication
	mul r0, r1, r0		@ return n * factorial( n - 1 );
	bal factExit
@ }
factBaseCase:
	mov r0, #1 @ return 1;
factExit:
	pop {lr}
	bx lr

//end factorial fn
main: 				@ int main(){
	push {lr}
	mov r0, #8		@ int n = 8;
	bl factorial 	@ n = factorial( n );

	mov r1, r0 			//put factorial result r1 before i overwrite it
	ldr r0, =outResult	@ printf( "result is %d", n );
	bl printf

	mov r0, #0 	@ return 0;
	pop {pc} 	@ }


