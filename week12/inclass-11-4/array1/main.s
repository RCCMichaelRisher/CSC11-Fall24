.global main

.section .rodata
outStr: .asciz "a[%d] = %d\n"

.section .data
@ int a[25];
array: .skip 100  		//array of 25 4-byte elements
						// so 25*4 makes 100 byte total space needed

.text
main: 					@ int main(){
	push {lr}

	//get the parmeters ready for outputArr
	//r0, array
	//r1, size
	ldr r0, =array
	mov r1, #25
	bl outputArr 		@ outputArr( a, 25);

	ldr r0, =array
	mov r2, #0 			//int i = 0
mainLoop:				@ for( int i = 0; i < 25; i++ ){
	cmp r2, #25			//i < 25
	bge mainLoopEnd
	//store a value into the array address
	str r2, [r0]		@ a[i] = i;
	
	@ 1<<2 == 1 * 4
	@ 0x00 0x04 0x08 
	//TODO FIX THIS ERROR INFRONT OF THE CLASS!!!!!!!
	add r2, #1			// i++
	add r0, r0, r2, lsl #2 //r0 = r0 + (r2*4)
	bal mainLoop
mainLoopEnd:   			@ }
	ldr r0, =array
	mov r1, #25
	bl outputArr 		@ outputArr( a, 25);

	mov r0, #0
	pop {pc} 			@ return 0;	
@ }


outputArr: 				@ void outputArr( int arr[], int size ){
/*
r0 = array address
r1 = size
 */
	push {r4,lr}
	mov r4, #0			@ i = 0
outputLoop:				@ for( int i = 0; i < size; i++ ){
	cmp r4, r1			@ i < size
	bge outputLoopEnd
	
	push {r0-r3}
	ldr r2, [r0]		//loads arr[i]
	mov r1, r4			//copies my i
	ldr r0, =outStr		//str loaded
	bl printf 			@ printf( "a[%d] = %d\n", i, arr[i] );
	pop {r0-r3}
	//TODO come back
	add r4, #1			@ i++
	add r0, r4, lsl #2	//next address in the array r0=r0+(r4*4)
	bal outputLoop
outputLoopEnd:			@ }
	pop {r4,pc} @ return;
@ }