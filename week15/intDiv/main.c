#include <stdio.h>

int main() {
	int r1 = 8;
	int r2 = 2;

	int r0 = r1 / r2;
	printf( "%d\n", r0 );

	r1 = -8;
	r0 = r1 / r2;
	printf( "%d\n", r0 );

	r1 = -8;
	r0 = (__uint32_t)r1 / (__uint32_t)r2;
	printf( "%d\n", r0 );
}