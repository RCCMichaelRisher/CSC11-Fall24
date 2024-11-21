.global main

.section .data
numbers: .word 1, 2, 3, 4, 5, 6
size: .word 6
out: .asciz "%d, "
newline: .asciz "\n"

.text
main:
	push {lr}
	ldr r0, =numbers
	ldr r1, =size
	ldr r1, [r1] //gets size but size - 1
	sub r1, r1, #1
	mov r2, #0 //start value

	bl reverseArray

	ldr r0, =numbers
	ldr r1, =size
	ldr r1, [r1]
	bl printArr //printArr( numbers, size ); function call

	mov r0, #0 //return o
	pop {pc}



/**
numbers,
end,
start
 */
reverseArray:
	push {r4,lr}
	raLoop:
		cmp r2, r1 //while( start < end ){
		bge done
	
		//r0 base add numbers(arr)
		// + ( r2 * 4 )
		ldr r3, [r0, r2, lsl #2] //int temp = arr[start]; //reads the left side and stores it into temp
		ldr r4, [r0, r1, lsl #2] //get the value at the right end of the array by taking the base address of numbers
									//adding end(r1) * 4 to get the correct offset in memory

		//ldr dest from						
		//str from dest
		str r4, [r0, r2, lsl #2] //arr[start] = arr[end];
								//take the right hand side and stores it in the left
		str r3, [r0, r1, lsl #2] //arr[end] = temp;

		add r2, r2, #1 //increment my start index aka left side
		sub r1, r1, #1 //decrement my end index aka right side

		b raLoop
done:
	pop {r4,pc}

/**
r0 numbers 
r1 size
 */
printArr:
	push {r4-r6,lr}
	mov r4, r0 //numbers moved r4
	mov r5, r1 //moved because unsafe registers for fn calls
	mov r6, #0 //int i = 0
paLoop:
	cmp r6, r5
	bge paEnd

	ldr r0, =out
	add r1, r4, r6, lsl #2 // numbers[baseAddress + i * 4]
	ldr r1, [r1] //get the value not address
	bl printf //print it
	
	add r6, #1
	b paLoop
paEnd:
	ldr r0, =newline
	bl printf
	pop {r4-r6,lr}
	bx lr