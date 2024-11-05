#include <stdio.h>

int sumArr( int arr[], int size ){
	int sum = 0;
	for( int i = 0; i < size; i++ ){
		sum += arr[i];
	}
	return sum;
}

int main(){
	int a[] = {10,20,30,40,50};
	int len = 5;
	int result = sumArr( a, len );
	printf( "sum: %d\n", result );
	return 0;
}