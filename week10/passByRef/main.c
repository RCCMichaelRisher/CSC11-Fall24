#include <stdio.h>


void passByRef( int* r0, int *r1, int *r2 ){
	int r4 = *r0;
	int r5 = *r1;
	int r6 = *r2;

	int t;
	t = r4 + r5;
	t = t + r6;

	printf( "sum: %d\n", t );

	r4 = r4 + 1;
	r5 = r5 + 3;
	r6 = r6 - 4;

	*r0 = r4;			//store the values of r4 into the pointer at r0
	*r1 = r5;			//store the values of r5 into the pointer at r1
	*r2 = r6;			//store the values of r6 into the pointer at r2

	printf( "r0: %d\n", *r0 ); 	
	printf( "r1: %d\n", *r1 );
	printf( "r2: %d\n", *r2 );
	return;
}

int main(){
	int val1 = 125;
	int val2 = 100;
	int val3 = 256;
	printf( "val1-val3 BEFORE function call\n");
	printf( "val1: %d\n", val1 );
	printf( "val2: %d\n", val2 );
	printf( "val3: %d\n", val3 );

	passByRef( &val1, &val2, &val3 ); //using & to get the address of these variables
	
	printf( "val1-val3 AFTER function call\n");
	printf( "val1: %d\n", val1 );
	printf( "val2: %d\n", val2 );
	printf( "val3: %d\n", val3 );
	return 0;

}