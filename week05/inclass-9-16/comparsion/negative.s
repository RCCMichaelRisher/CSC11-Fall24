.global _start

.text
_start: @ int _start(){
    mov r0, #10 @     int r0 = -10;
    @     int r2;
    

    cmp r0, #0 @     if( r0 < 0 ){
    movmi r2, #60 @         r2 = 60;
    @     } else {
    movpl r2, #0@         r2 = 0;
    @     }
    
    mov r7, #1
    mov r0, r2
    swi 0 //software interrupt calls exit function OS
    @     return r2;
@ }

