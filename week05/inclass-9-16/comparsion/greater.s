.global main

.align 4
.section .rodata
output: .asciz "%d\n"

.text
main: @ int main(){
    push {lr} //where we came from
    mov r0, #75@     int r0 = 10;
    mov r1, #76@     int r1 = 76;
@     int r2;

    cmp r0, r1 @     if( r0 > r1 ){
    movgt r2, #60@         r2 = 60;
    @     } else {
    movle r2, #44@         r2 = 44;
    movlt r2, #55

    @     }

    //print the output
    ldr r0, =output
    mov r1, r2
    bl printf @     printf( "%d", r2 );

    mov r0, #0 @     return 0;
    pop {pc} //where we want to go next
@ }
