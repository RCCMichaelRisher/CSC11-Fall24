.global main

.align 4
.section .rodata
prompt: .asciz "Enter a 32 bit number and a number to shift by (n n format):"
inPatt: .asciz "%d %d"

outLsl: .asciz "%d (0x%08X) LSL #%d = %d (0x%08X)\n"
outLsr: .asciz "%d (0x%08X) LSR #%d = %d (0x%08X)\n"
outAsr: .asciz "%d (0x%08X) ASR #%d = %d (0x%08X)\n"
outRor: .asciz "%d (0x%08X) ROR #%d = %d (0x%08X)\n"

.align 4
.section .data
val: .word 0
shift: .word 0


.text
main:
    push {lr} 

    //print the prompt 
    ldr r0, =prompt
    bl printf

    //get the user input
    ldr r0, =inPatt
    ldr r1, =val
    ldr r2, =shift
    bl scanf

    //put value into a register
    ldr r4, =val
    ldr r4, [r4]
    //put value into a register
    ldr r5, =shift
    ldr r5, [r5]

    //print the logical left shift
    mov r6, r4, lsl r5 //do the left shifting and store into r0

    ldr r0, =outLsl //1th parameter for printf
    mov r1, r4      //2th parameter for printf
    mov r2, r4      //3th parameter for printf
    mov r3, r5      //4th parameter for printf
    push {r6}       // 5th parameter for printf
    push {r6}       // 6th parameter for printf
    bl printf       // printf( "%d (0x%08X) LSL #%d = %d (0x%08X)\n", r4, r4, r5, r0, r0 )
    add sp, #8      //remove those 2 r0 pushes on the stack by taking them of the stack


    //print logical right shift
    //mov r6, r4, lsr r5 //do the left shifting and store into r0
    lsr r6, r4, r5

    ldr r0, =outLsr //1th parameter for printf
    mov r1, r4      //2th parameter for printf
    mov r2, r4      //3th parameter for printf
    mov r3, r5      //4th parameter for printf
    push {r6}       // 5th parameter for printf
    push {r6}       // 6th parameter for printf
    bl printf       // printf( "%d (0x%08X) LSL #%d = %d (0x%08X)\n", r4, r4, r5, r0, r0 )
    add sp, #8      //remove those 2 r0 pushes on the stack by taking them of the stack

    //print arthimetic right shift
    mov r6, r4, asr r5 //do the left shifting and store into r0
    //asr r6, r4, r5

    ldr r0, =outAsr //1th parameter for printf
    mov r1, r4      //2th parameter for printf
    mov r2, r4      //3th parameter for printf
    mov r3, r5      //4th parameter for printf
    push {r6}       // 5th parameter for printf
    push {r6}       // 6th parameter for printf
    bl printf       // printf( "%d (0x%08X) LSL #%d = %d (0x%08X)\n", r4, r4, r5, r0, r0 )
    add sp, #8      //remove those 2 r0 pushes on the stack by taking them of the stack

    //print rotate right shift
    mov r6, r4, ror r5 //do the left shifting and store into r0
    //ror r6, r4, r5

    ldr r0, =outRor //1th parameter for printf
    mov r1, r4      //2th parameter for printf
    mov r2, r4      //3th parameter for printf
    mov r3, r5      //4th parameter for printf
    push {r6}       // 5th parameter for printf
    push {r6}       // 6th parameter for printf
    bl printf       // printf( "%d (0x%08X) LSL #%d = %d (0x%08X)\n", r4, r4, r5, r0, r0 )
    add sp, #8      //remove those 2 r0 pushes on the stack by taking them of the stack

    mov r0, #0      //return 0
    pop {pc}
