#include <stdio.h>

int main(){
	int base;
	int x;
	int result = 1;

	printf( "Enter a number for the base: " );
	scanf( "%d", &base );

	//we want to make the exponent is always positive
	do{
		printf( "Enter a number for the exponent: " );
		scanf( "%d", &x );
	} while( x < 0 );


	//do the multiplication
	// 4^2 = 4 * 4	
	// 4^n = 4 * 4 * 4	* .... 
	for( int i = 0; i < x; i++ ){
		result = result * base;
	}


	//print the output
	printf( "%d ^ %x = %d\n", base, x, result );

	return 0;
}