.global main

.section .rodata
out: .asciz "%d, "

.text
main:
    push {lr}
    mov r6, #0      @ int i = 0;
    mov r7, #10     //stopping value

dowhile:            @ do{
    ldr r0, =out
    mov r1, r6
    bl printf       @     printf( "%d, ", i );

    add r6, r6, #1  @ i++;

    cmp r6, r7
    blt dowhile @ } while(  i < 10  );
endDowhile:
    mov r0, #0
    pop {pc}
