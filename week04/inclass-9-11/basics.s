.global main
.func main

.align 4
.section .rodata
outputstr: .asciz "%d\n"

main: @ int main(int argc, char** argv) {
    push {lr}

    mov r7, #5      @     int r0 = 5;
    mov r8, #10     @     int r1 = 10;
    
    //sub r2, r7, r8  @     r2 = r0 + r1;
    rsb r2, r7, r8
   
    ldr r0, =outputstr
    mov r1, r2
    bl printf   @     printf( "%d\n", r2 );

    sub r3, r7, r7  @     r3 = r0 + r0;

    ldr r0, =outputstr
    mov r1, r3
    bl printf   @     printf( "%d\n", r3 );
    
    pop {pc}
@     return 0;
@ }
