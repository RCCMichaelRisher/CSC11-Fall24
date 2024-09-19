.global main

.section .data
val1: .word 0
str: .asciz "%d\n"

.text
main:
    push {lr}

    mov r0, #15 

    //get the location in memory aka address
    ldr r2, =val1 

    //store the the value of r0 and put it into the memory location at r2
    //str source, dest
    str r0, [r2]

    ldr r0, =str
    ldr r1, =val1
    ldr r1, [r1]
    bl printf

    mov r0, #0
  
    pop {pc}

