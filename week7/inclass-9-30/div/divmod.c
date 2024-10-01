#include <stdio.h>

int main(){
    int result = 0;
    int denom = 6;
    int numerator = 55;
    int temp = numerator;
    while( temp >= denom ){
        result += 1;
        temp -= denom;
    }

    printf( "55 / 6 = %d\n", result );
    printf( "55 %% 6 = %d\n", temp );
}