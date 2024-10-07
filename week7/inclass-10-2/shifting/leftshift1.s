.global main


.section .rodata
out: .asciz "%d\n"

.text
main:
    push {lr}
    mov r1, #2
    mov r2, #3

    
    lsl r4, r1, #1
    add r7, r2, r4

    @ add r3, r1, r2, lsl #1


    ldr r0, =out
    mov r1, r7  //move r3 into r1 for printf
    bl printf //call print

    mov r1, #1
    add r7, r7, r1
    @ lsr r7, r7, #4
    ror r7, r7, #4

    ldr r0, =out
    mov r1, r7  //move r3 into r1 for printf
    bl printf //call print

    mov r0, #0
    pop {pc}
