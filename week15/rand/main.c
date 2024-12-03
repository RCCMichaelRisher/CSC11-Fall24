#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
	srand( time( 0 ) );

	printf( "%d\n", rand() % 10 );
}

/*
mov r0, #0
bl time  //gets current time time(0)
bl srand  //sets the seed for the puesdo random number generator
bl rand  //calls the rand function
and r0, r0, #99  //filters out the numbers to reasonable size without it you can get a 32bit number
*/