.global main

.align 4
.section .rodata
prompt: .asciz "Enter a number: "
inputPattern: .asciz "%d:%d"
output: .asciz "Your number is: %d,%d\n"

.align 4
.section .data
value: .word 0  @     int value;
value2: .word 0 @ int value2

.text
main: @ int main(){
    push {lr} //store where i was

@     //tell user to enter a number

    ldr r0, =prompt
    bl printf  @     printf( "Enter a number: " );

@     //get the number
    ldr r0, =inputPattern
    ldr r1, =value
    ldr r2, =value2
    bl scanf @     scanf( "%d", &value );

@     //output the number
    ldr r0, =output
    ldr r1, =value
    ldr r1, [r1]
    ldr r2, =value2
    ldr r2, [r2]
    bl printf   @     printf( "Your number is: %d\n", value );

    mov r0, #0 @     return 0;

    pop {pc} //return to where i was
@ }
