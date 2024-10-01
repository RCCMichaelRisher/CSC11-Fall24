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
divNUm: .word 0x24a

.text
main: @ int main(){
    push {lr}
    ldr r0, =instructions
    bl printf @     printf( instructions );

    //n1
    mov r6, #0  //int i = 0
    mov r5, #7  //stopping case
    mov r7, #0  // define r7 as 0. 
forLoop:
    cmp r6, r5  // i < 5
    bge endFor

    ldr r0, =inPrompt
    bl printf   @     printf( inPrompt );

    ldr r0, =inDec
    ldr r1, =input
    bl scanf    @     scanf( inDec, &input );

    ldr r1, =input
    ldr r1, [r1]    //load the value just inputted
    add r7, r7, r1      @     r7 = r7 + input;

    add r6, r6, #1  // i = i + 1 == i++
    bal forLoop

endFor:

    @ mov r6, #0x334 @     r6 = 0x334; //bp -12 wd 12  (1/5)
    @ mov r6, #0x249     @ bp -12 wd 12
    ldr r6, =divNUm
    ldr r6, [r6]

    cmp r7, #0 
    beq error @     if( r7 == 0 ) goto error;

    mul r1, r7, r6  @     r1 = r7 * r6;
    @ lsr r1, r1, #12     @     r1 = r1 >> 12; //our average r1
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
