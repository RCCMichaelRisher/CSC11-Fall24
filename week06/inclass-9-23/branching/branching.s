.global main

.align 4
.section .rodata
inPrompt: .asciz "Enter a number: "
indec: .asciz "%d"
outGe: .asciz "greater than\n"
outEq: .asciz "equal to\n"
outLt: .asciz "less than\n"

.align 4
.section .data
val: .word 0

.text
main: @ int main() {
    push {lr}

    ldr r0, =inPrompt
    bl printf @     printf( "Enter a number: " );

    ldr r0, =indec
    ldr r1, =val
    bl scanf @     scanf( "%d", &val );

    mov r0, #100 @     r0 = 100;
    
    ldr r1, =val //load the address of val to r1
    ldr r1, [r1] //get thes value of val from the address loaded in r1

    cmp r1, r0 
    bgt greater //branch to greater label
    beq equal //branch to equal label
    blt less //branch to less label
greater:
    ldr r0, =outGe
    bl printf @     printf( "greater than\n");
    bal end //branch always to the end
equal:
    ldr r0, =outEq
    bl printf @     printf( "equal to\n" );
    bal end //branch always to the end
less:
    ldr r0, =outLt
    bl printf @     printf( "less than\n" );
    bal end //branch always to the end

end:


    mov r0, #0 @     return 0;
    pop {pc}
@ }
