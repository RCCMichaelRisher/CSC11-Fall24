.global main

.section .rodata
out: .asciz "%d, "

.text
main:
    push {lr}
    mov r6, #0      // int i = 0;
while:
    cmp r6, #10     @ while(  i < 10  ){
    bge endWhile

    ldr r0, =out
    mov r1, r6
    bl printf       @ printf( "%d, ", i );
    
    add r6, #1      @ add r6, r6, #1 // i++;
    bal while
endWhile:           @ }

    pop {pc}
