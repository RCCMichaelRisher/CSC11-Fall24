.global main

.align 4
.section .rodata
inPrompt: .asciz "Enter a number: " @     char *inPrompt = "Enter a number: ";
inDec: .asciz "%d"  @     char *inDec = "%d";
outEven: .asciz "%d is even\n" @     char *outEven = "%d is even\n";
outOdd: .asciz "%d is odd\n" @     char *outOdd = "%d is odd\n";

.align 4
.section .data
val: .word 0 @     int val;

.text
main: @ int main(){
    push {lr}
    ldr r0, =inPrompt
    bl printf @     printf( inPrompt ); //prompt for input

    ldr r0, =inDec
    ldr r1, =val
    bl scanf    @     scanf( inDec, &val );

    ldr r1, =val
    ldr r1, [r1]

    and r0, r1, #1
    cmp r0, #0 @     if( ( val & 1 ) == 0 ) { //is even
    beq even
    bne odd
even:
    ldr r0, =outEven
    //r1 is unchanged value of val so we can reuse it
    bl printf   @         printf( outEven, val );
    bal end
odd:    @     } else {
    ldr r0, =outOdd
    //r1 is unchanged value of val so we can reuse it
    bl printf   @         printf( outOdd, val );
    bal end
@     }
end:
    mov r0, #0
@     return 0;
    pop {lr}
@ }
