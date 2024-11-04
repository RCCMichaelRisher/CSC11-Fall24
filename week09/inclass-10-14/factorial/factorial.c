#include <stdio.h>

int main(){
	char prompt[] = "Enter a possitive number greater than 0: ";
	char inDec[] = "%d";
	char outResult[] = "%d! is %d\n";
	
	int num = 0;
	do{
	//prompt number
		printf( prompt );
		scanf( inDec, &num );

	} while( num <= 0 ); // need to valid
	
	//do the the math
	int result = 1;
	for( int i = 1; i <= num; i++ ) {
		result = result * i;
	}

	//out the answer
	printf( outResult, num, result );
	return 0;
}