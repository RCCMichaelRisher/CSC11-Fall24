.global main

.align 4
.section .rodata
prompt: .asciz "enter a 32-bit number: "
inPattern: .asciz "%d"

output: .asciz "You entered %d\n"

.section .data
value: .word 0


.text
 
main:
    push {lr}

    //prompt the user
    ldr r0, =prompt
    bl printf

    //ask for input
    ldr r0, =inPattern
    ldr r1, =value
    bl scanf

    //output the value
    ldr r0, =output
    ldr r1, =value //load the address of the value
    ldr r1, [r1] //load the value from the address we previously loaded

    bl printf

    pop {pc}
