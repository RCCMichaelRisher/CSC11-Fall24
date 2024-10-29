#include <stdio.h>

int abs( int x ){
	//ternary is a 1 line if
	return ( x < 0  ) ? -x : x;  
}

int main(){
	int num; //the number to square root;
	//sk for the number to square root
	printf( "enter a number to approximate the square root ");
	scanf( "%d", &num );

	if( num <= 0 ){
		printf( "the number must greater than zero\n" );
		return 0;
	}

	int guess = num >> 1;  //since div is expensive lets shift //x_n 
	int prevGuess;  //x_n-1

	int i = 0;

	/*
	x_n+1 = 1/2( x_n + num/x_n)
	*/
	do{
		//1/2( x_n + num/x_n)
		prevGuess = guess;
		int t = num / guess; // num / x_n
		t = guess + t;	//n_x + num/x_n
		guess = t >> 1; //that divides the t by 2
	printf( "guess %d is %d\n", i++, guess );
	} while ( abs( guess - prevGuess ) > 0 );

	//output is 
	printf( "the approximate sqrt of %d is %d\n", num, guess );

	return 0;
}