.global main

.section .rodata
outDiv: .asciz "55 / 6 = %d\n"
outMod: .asciz "55 %% 6 = %d\n"

.text
main: @ int main(){
    push {lr}
    mov r3, #55 @     int numerator = 55;
    mov r2, #6 @     int denom = 6;
    mov r0, #0 @     int result = 0;
    mov r1, r3 @     int temp = numerator;

while:
    cmp r1, r2  @     while( temp >= denom ){
    blt endWhile

    add r0, r0, #1 @         result += 1;
    sub r1, r1, r2 @         temp -= denom;

    bal while
endWhile:
@     }

    //move result to function safe registers
    mov r6, r1
    mov r5, r0

    ldr r0, =outDiv
    mov r1, r5
    bl printf       @     printf( "55 / 6 = %d\n", result );

    ldr r0, =outMod
    mov r1, r6
    bl printf       @     printf( "55 %% 6 = %d\n", temp );
@ }
    mov r0, #0 //return 0
    pop {pc}
