#include <stdio.h>

int main(){
    int val;

    char *inPrompt = "Enter a number: ";
    char *inDec = "%d";
    char *outEven = "%d is even\n";
    char *outOdd = "%d is odd\n";

    printf( inPrompt ); //prompt for input

    scanf( inDec, &val );

    if( ( val & 1 ) == 0 ) { //is even
        printf( outEven, val );
    } else {
        printf( outOdd, val );
    }

    return 0;
}