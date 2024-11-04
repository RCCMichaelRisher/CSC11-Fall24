#include <stdio.h>

int main(){
	char prompt[] = "Enter a positive number: ";
	char inDec[] = "%d";
	char outText[] = "Odd numbers from 0 to %d are :\n";
	char outLoop[] = "%d ";
	char newline[] = "\n";

	int num = 0;

	do{
		//prompt for a positive value
		printf( prompt );
		//get the value from the user
		scanf( inDec, &num );
	} while ( num <= 0 );	//check the value

	printf( outText, num );
	for( int i = 1; i <= num; i+=2 ){
		printf( outLoop, i );
	}
	//newline after the loop
	printf( newline );

 	
	//output the numbers
	return 0;
}