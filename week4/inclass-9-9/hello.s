.global _start

//int main(int argc, char** argv) {
//    
//    char hellostr[50] = "Hello World\n";
//    printf( hellostr );
//    return 0;
//}


.section .rodata
//readonly constants initalized math pi,e 
hellostr: .ascii "Hello World\n" //char hellostr[50] = "Hello World\n"

.section .bss
//un-initalized dyanmic arrays

.section .data
//non constant initalized values
//returnVal 

.text
_start: //int main 
	
	//write with syscall
	mov r7, #4 // write syscall number
	mov r0, #1 // stdout
	ldr r1, =hellostr //load the string into r1
	mov r2, #12 // string length
	swi 0 //ran write syscall

	mov r0, #0 //return 0
	mov r7, #1 //return 0 syscall
	swi 0 //do the syscall
