#include <stdio.h>
#include <stdint.h>

extern uint32_t addval( uint32_t a, uint32_t b );

int main(){

	uint32_t a, b, c;
	a = 5;
	b = 4;

	c = addval( a, b );

	printf( "%d + %d = %d\n", a, b, c );
}

//to compile this run
//as -o addval.o addval.s
//gcc -o addval main.c addval.o
//./addval