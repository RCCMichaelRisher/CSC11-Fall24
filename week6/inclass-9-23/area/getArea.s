.global main
.func main

.align 4
.section .data
width: .word 0
length: .word 0

.align 4
.section .rodata
inWidth: .asciz "input the width: ";
inLength: .asciz "input the length: ";
inDec: .asciz "%d";
outArea: .asciz "the area is %d\n";
outSquare: .asciz "the shape with length %d and width %d is a square\n";
outRect: .asciz "the shape with lengh %d and width %d is not a square\n";

.text
main: @ int main(){
    push {lr}
    
    ldr r0, =inWidth
    bl printf @ printf(  inWidth );

    ldr r0, =inDec
    ldr r1, =width
    bl scanf // scanf( inDec, &width );

    ldr r0, =inLength
    bl printf // printf( inLength );

    ldr r0, =inDec
    ldr r1, =length
    bl scanf // scanf( inDec, &length );

    ldr r1, =length
    ldr r1, [r1]
    @     r1 = length;

    ldr r2, =width
    ldr r2, [r2]
    @     r2 = width;

    mul r7, r1, r2 //the area is cacluated 
    @     r7 = r1 * r2;

    ldr r0, =outArea
    mov r1, r7
    bl printf @     printf( outArea, r7 );

    //r0-r4 could of changes so gotta load them again
    ldr r1, =length
    ldr r1, [r1]
    @     r1 = length;
    ldr r2, =width
    ldr r2, [r2]
    @     r2 = width;

    cmp r1, r2 @     if ( r1 == r2 ){
    beq square @         goto square;
    bal rect @         goto rect;
square:
    ldr r0, =outSquare //since length was in r1 and width in r2 don't need to load them again
    bl printf @         printf( outSquare, length, width );
    bal end @         goto end;
@     } else {
rect:
    ldr r0, =outRect //since length was in r1 and width in r2 don't need to load them again
    bl printf @         printf( outRect, length, width );
    bal end @         goto end;
@     }

end:
    mov r0, #0
    pop {pc} @     return 0;
@ }
