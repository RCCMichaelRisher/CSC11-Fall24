#include <stdio.h>

void passByVal( int, int, int);

int main(){
	int a = 125;
	int b = 100;
	int c = 256;

	printf( "val1: %d\n", a );
	printf( "val2: %d\n", b );
	printf( "val3: %d\n", c );

	passByVal( a, b, c );

	printf( "val1: %d\n", a );
	printf( "val2: %d\n", b );
	printf( "val3: %d\n", c );

	return 0;
}

void passByVal( int r0, int r1, int r2 ){
	int t;
	t = r0 + r1;
	t = t + r2;

	printf( "sum: %d\n", t );

	r0 = r0 + 1;
	r1 = r1 + 3;
	r2 = r2 - 4;

	printf( "r0: %d\n", r0 );
	printf( "r1: %d\n", r1 );
	printf( "r2: %d\n", r2 );


	return;
}