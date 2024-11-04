// int main(int argc, char** argv) {
//    int returnVal = 50;
//    return returnVal;
//}

.global _start

_start:
	mov r0, #50 // int returnVal = 50
	
	mov r7, #1
	swi 0


username: mrisher1@csc11pi.ddns.net
password: student

change password with the command: passwd

ssh -p 777 mrisher1@csc11pi.ddns.net