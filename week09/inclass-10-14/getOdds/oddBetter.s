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
	ldr r5, =num
	ldr r5, [r5]
	cmp r5, #0
	ble do 							@ } while ( num <= 0 );	//check the value

//print the out puts
	mov r1, r5
	ldr r0, =outText

	bl printf 						@ printf( outText, num );
	
	mov r6, #1						// int i = 1
for: 								@ for( int i = 1; i <= num; i+=2 ){
	cmp r6, r5						// i <= num
	bgt endFor						// i <= num

	mov r1, r6						// copy i in r0 to r1
	ldr r0, =outLoop
	bl printf 						@ printf( outLoop, i );

	add r6, r6, #2					@ i+=2 aka i = i + 2
	bal for
endFor: 							@ }
@ //newline after the loop
	ldr r0, =newline
	bl printf						@ printf( newline );

	mov r0, #0 						
	pop {pc}						@ return 0;
@ }
