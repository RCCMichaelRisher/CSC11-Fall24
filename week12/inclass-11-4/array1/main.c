#include <stdio.h>

void outputArr( int arr[], int size ){
	for( int i = 0; i < size; i++ ){
		printf( "a[%d] = %d\n", i, arr[i] );
	}
	return;
}

int main(){
	int a[25];

	outputArr( a, 25);

	for( int i = 0; i < 25; i++ ){
		a[i] = i;
	}

	outputArr( a, 25);

	return 0;
}