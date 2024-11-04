.global main

.align 4
.section .rodata
//readonly data
prompt: .asciz "Enter a positive number: " 	@ char prompt[] = "Enter a positive number: ";
inDec: .asciz "%d" 							@ char inDec[] = "%d";
outText: .asciz "Odd numbers from 0 to %d are :\n" 	@ char outText[] = "Odd numbers from 0 to %d are :\n";
outLoop: .asciz "%d " 					@ char outLoop[] = "%d ";
newline: .asciz "\n" 					@ char newline[] = "\n";


.align 4
.section .data
//data that can change
num: .word 0 						@ int num = 0;

.text
main: 								@ int main(){
	push {lr}
do: 								@ do{
//prompt for a positive value
	ldr r0, =prompt
	bl printf 						@ printf( prompt );
//get the value from the user

	ldr r0, =inDec
	ldr r1, =num
	bl scanf						@ scanf( inDec, &num );

	//put num into a register
	ldr r0, =num
	ldr r0, [r0]
	cmp r0, #0
	ble do 							@ } while ( num <= 0 );	//check the value

//print the out puts
	mov r1, r0
	ldr r0, =outText
	push {r1}						//saved r1 into the stack because printf will change it
	bl printf 						@ printf( outText, num );
	
	mov r0, #1						// int i = 1
	pop {r1} 						//restored num back into r1
for: 								@ for( int i = 1; i <= num; i+=2 ){
	cmp r0, r1						// i <= num
	bgt endFor						// i <= num

	push {r0,r1}
	mov r1, r0						// copy i in r0 to r1
	ldr r0, =outLoop
	bl printf 						@ printf( outLoop, i );
	pop {r0,r1}

	add r0, r0, #2					@ i+=2 aka i = i + 2
	bal for
endFor: 							@ }
@ //newline after the loop
	ldr r0, =newline
	bl printf						@ printf( newline );

	mov r0, #0 						
	pop {pc}						@ return 0;
@ }
