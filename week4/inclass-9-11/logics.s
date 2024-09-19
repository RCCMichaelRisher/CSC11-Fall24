.global main
.func main

.align 4
.section .rodata
outputstr: .asciz "%x\n"

main:   @ int main(int argc, char** argv) {
    push {lr}
    mov r0, #0b0111 @     int r0 = 0b0111;
    mov r1, #0b1001 @     int r1 = 0b1001;
    mov r2, #0b0011 
    @ and r1, r0, r1 @     int r1 = r0 & r1;
    @ orr r1, r0, r1 @     int r1 = r0 | r1;
    @ eor r1, r0, r1 @     int r1 = r0 ^ r1;
    bic r1, r0, r2  @ r2 = ~r2; int r1 = r0 & r2;
    
    ldr r0, =outputstr
    bl printf @     printf( "%x\n", r2 );
    
    pop {pc}
@     return 0;
@ }
