/*
Reverse An Array Inplace
Develop a program that reverses an array of integers in-place. This program should reserve a 6 element 4-byte array that the user can fill with their own numbers. Output the user inputed array then reverse it inplace and output the resulting reversed array.
Note: At a minimum use functions for the inputting the array and the outputing the array.
*/

#include <stdio.h>

void reverseArray( int *arr, int end, int start ){
	while( start < end ){
		int temp = arr[start]; //reads the left side and stores it into temp
		arr[start] = arr[end]; //write the right side over left side
		arr[end] = temp;	//right side gets written side

		//increment
		start++;
		end--;
	}
}

int main(){
	int number[] = {1,2,3,4,5,6};
	int size = 6;

	int endIdx = size - 1;
	int startIdx = 0;
	
	//reverse it inplace 
	reverseArray( number, endIdx, startIdx );

	//print it
	for( int i = 0; i < size; i++ ){
		printf( "%d, ", number[i] );
	}
	printf( "\n" );
	return 0;
}