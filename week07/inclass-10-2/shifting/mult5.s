.global main


.section .rodata
out: .asciz "%d\n"

.text
main:
    push {lr}
    
    mov r1, #5

    add r1, r1, r1, lsl #2

    ldr r0, =out
    bl printf
    
    pop {pc}