#include <stdio.h>

int sumArr( int arr[], int size ){
	int sum = 0;
	for( int i = 0; i < size; i++ ){
		sum += arr[i];
	}
	return sum;
}

int main(){
	int len = 5;
	int a[len];
	
	for( int i = 0; i < len; i++ ){
		printf( "input a number: ");
		scanf( "%d", &a[i] );
	}
	
	int result = sumArr( a, len );
	printf( "sum: %d\n", result );
	return 0;
}