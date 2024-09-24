#include <stdio.h>

int main() {
    int r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;

    int val;

    printf( "Enter a number: " );
    scanf( "%d", &val );

    r0 = 100;

    if( val > 100 ){
        printf( "greater than\n");
    } else if( val == 100 ) {
        printf( "equal to\n" );
    } else{
        printf( "less than\n" );
    }

    return 0;
}