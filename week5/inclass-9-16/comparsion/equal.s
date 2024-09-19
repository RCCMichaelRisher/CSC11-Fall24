.global main

.align 4
.section .rodata
output: .asciz "%d\n"

.text
main: @ int main(){
    push {lr} //where we came from

    mov r0, #10 @     int r0 = 10;
    mov r1, #10 @     int r1 = 76;
@     int r2;

    cmp r0, r1 @     if( r0 == r1 ){
    moveq r2, #50 @         r2 = 50; //if r0 and r1 are equal then put 50 into r2
    @     } else {
    movne r2, #0 @         r2 = 0; //if r0 and r1 are not equal then put 0 into r2
    @     }
    
    ldr r0, =output
    mov r1, r2
    bl printf    
    @     printf( "%d", r2 );
    mov r0, #0 @     return 0;

    pop {pc} //where we want to return from
@ }
