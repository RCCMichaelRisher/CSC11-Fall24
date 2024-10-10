#include <stdio.h>

int main(){
	int n = 5; //starting number
	int c = 0; //steps take to reach 1

	while( n != 1 ){
		// rules
		// If the number is even, divide it by two.
		// If the number is odd, triple it and add one.
		if( n & 1 ) { //test if even or oDd using ands 
			//3 0b11 
			//1 0b01
			// &&
			// ------
			//  0b01
			n = 3 * n + 1;
		} else {
			//even case
			n = n / 2;
		}
		c = c + 1;		// count the number of steps to reach 1
		printf( "%d, ", n );
	}
	//print the output of count
	printf( "\n%d times\n", c );

	return 0;
}
/*
	5 -> 3*5+1 = 16 
		16/ 2 = 8
			8 / 2 = 4
				4 / 2 = 2
					2 / 2 = 1  
*/