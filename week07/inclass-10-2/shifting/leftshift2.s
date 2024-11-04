.global main


.section .rodata
out: .asciz "%d\n"

.text
main:
    push {lr}
    mov r1, #2
    mov r2, #3

    
    add r3, r2, r1, lsl #1 @ r2 + (r1 * 2)
    sub r4, r2, r1, lsl #2 //????
    rsb r5, r2, r1, lsl #2 //????

    mov r0, #0
    pop {pc}
