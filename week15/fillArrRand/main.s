.global main

.section .data
array: .skip 20 //5 long in this case
.section .rodata
out: .asciz "num = %d\n"
outLoop: .asciz "%d, "
newline: .asciz "\n"

.text
main:
	push {lr}
	//set the rand seed
	mov r0, #0
	bl time
	bl srand

//fill the array
	mov r4, #0 //i=0
	ldr r5, =array //some 0x123 0x127
loop:
	cmp r4, #5
	bge endLoop

	bl getRand //random into r0
	str r0, [r5]

	add r4, r4, #1
	add r5, r5, #4 
	bal loop
endLoop:

//now print the array
	mov r4, #0 //i=0
	ldr r5, =array
prloop:
	cmp r4, #5
	bge prendLoop

	ldr r0, =outLoop
	ldr r1, [r5]
	bl printf

	add r4, r4, #1 //increment i by 1
	add r5, r5, #4 //increment the pointer by 4 
	bal prloop
prendLoop:

	//print the newline
	ldr r0, =newline
	bl printf

	mov r0, #0
	pop {pc}
//end of main


getRand:
	push {lr}

	bl rand
	@ and r0, r0, #99
	and r0, r0, #0xff

	pop {pc}
//end of getRand
