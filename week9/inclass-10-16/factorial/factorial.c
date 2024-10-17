#include <stdio.h>

int factorial(int);
int main(){
	int n = 8;
	n = factorial( n );
	printf( "result is %d\n", n );

	return 0;
}

int factorial( int n ){
	if( n == 0 ){
		return 1;
	}

	return n * factorial( n - 1 );
}

