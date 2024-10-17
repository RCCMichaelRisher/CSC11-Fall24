.global main
.global multBy5

.func multBy5


.section .rodata
prompt: .asciz "Enter a number: "
inDec: .asciz "%d"
outResult: .asciz "%d * 5 = %d\n"

.section .data
num: .word 0

.text
/*
Function ASSUMPTIONS
1. fns should not make assumptions about the contents cspr
2. fns can free modify register r0, r1, r2, r3
3. fns cannot assume anything about the contents of r0, r1, r2, r3
4. fns can free modify the lr register but the value upon entering will be needed when leaving the function
5. fns can modifiy all the remaining register as long as their values are restored, includes the sp, r4-r11
 */
multBy5: //int multBy5( int num );
	push {lr}
	add r0, r0, r0, lsl #2 // r1 + (r1 * 4)
	pop {lr}   
	bx lr			// == pop{pc}
	//return r0
	//endof multBy5

main:
    push {lr}

	//prompt
	ldr r0, =prompt
	bl printf

	//ask for number
	ldr r0, =inDec
	ldr r1, =num
    bl scanf

	//get times 5
	//load the number
	ldr r0, =num
	ldr r0, [r0]
	bl multBy5		//call multBy5( r0 )

	mov r2, r0 // move the result from multBy5 into r0
    ldr r0, =outResult
	ldr r1, =num
	ldr r1, [r1]
    bl printf
    
    pop {pc}
