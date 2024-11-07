#include <stdio.h>

void bubblesort( int arr[], int len );
void inputArray( int arr[], int len );
void printArray( int arr[], int len );

int main(){
	//array init
	int len = 5;
	int arr[len];
	//input the array
	inputArray( arr, len );
	//print?

	//sort it
	bubblesort( arr, len );
	
	//print sorted version
	printArray( arr, len );

	return 0;
}


void bubblesort( int arr[], int len ){
	for( int i = 0; i < len - 1; i++ ){
		for( int j = 0; j < len - 1; j++ ){
			if( arr[j] > arr[j + 1]) { //if the current is bigger then the next move to the right
				int temp = arr[j];		//put the bigger value into temp
				arr[ j ] = arr[ j + 1 ];	//saved the smaller where the big was, moving the small values to the left
				arr[ j + 1 ] = temp;		//the value that was smaller is now the bigger value moving the bigger to the right
			}
		}
	}
}

void inputArray( int arr[], int len ){
	for ( int i = 0; i < len; i++ ){
		printf( "enter a number: ");
		scanf( "%d", &arr[i] );
	}
}


void printArray( int arr[], int len ){
	for ( int i = 0; i < len; i++ ){
		printf( "%d, ", arr[i] );
	}
	printf( "\n" );
}