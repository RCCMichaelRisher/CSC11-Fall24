#include <stdio.h>

int main(){
	float x = 0;
	float y = 1.23;
	float z = 4.56;

	char* outPrompt = "Enter a floating point number: ";
	char* inFlt = "%f";
	char* out = "Entered x=%f, y=%f, z=%f sum=%f\n";

	printf( outPrompt );

	scanf( inFlt, &x );

	float sum = x + y;
	sum = sum + z;

	printf( out, x, y, z, sum );	
}