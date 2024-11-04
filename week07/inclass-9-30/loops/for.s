.global main

.section .rodata
out: .asciz "%d, "

.text
main:
    push {lr}
    mov r6, #0      //int i = 0
    mov r7, #10     //the stopping value
for:
    cmp r6, r7      //i < 10
    bge endFor
    @ for( int i = 0; i < 10; i++ ){

    ldr r0, =out
    mov r1, r6
    bl printf  @     printf( "%d, ", i );


    add r6, r6, #1  //i++
    bal for
    @ }
endFor:

    pop {pc}
