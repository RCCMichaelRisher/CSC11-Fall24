.global main


.align 4
.section .rodata
instructions: .asciz "Enter a non-negative number\n";
inDec: .asciz "%d";
inPrompt: .asciz "Enter a number: ";
outAvg: .asciz "Your average is %d\n";
outError: .asciz "Enter only positive numbers!\n";

.align 4
.section .data
input: .word 0

.text
main: @ int main(){
    push {lr}
    ldr r0, =instructions
    bl printf @     printf( instructions );

    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    mov r7, r1      @     r7 = input;

    //n2
    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    add r7, r7, r1  @     r7 = r7 + input;

    //n3
    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    add r7, r7, r1  @     r7 = r7 + input;

    //n4
    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    add r7, r7, r1  @     r7 = r7 + input;

    //n5
    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    add r7, r7, r1  @     r7 = r7 + input;

    mov r6, #0x334 @     r6 = 0x334; //bp -12 wd 12  (1/5)

    cmp r7, #0 
    beq error @     if( r7 == 0 ) goto error;

    mul r1, r7, r6  @     r1 = r7 * r6;
    lsr r1, r1, #12     @     r1 = r1 >> 12; //our average r1
    
    ldr r0, =outAvg
    bl printf   @     printf( outAvg, r1 );

    bal end @     goto end;

error:
    ldr r0, =outError
    bl printf   @     printf( outError );
    bal end     @     goto end;
end:
    mov r0, #0  @     return 0;
    pop {lr}
    bx lr
@ }
