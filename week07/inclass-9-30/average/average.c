#include <stdio.h>

int main(){
    int r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;

    int input;

    char *instructions = "Enter a non-negative number\n";
    char *inDec = "%d";
    char *inPrompt = "Enter a number: ";
    char *outAvg = "Your average is %d\n";
    char *outError = "Enter only positive numbers!\n";

    printf( instructions );

    r7 = 0;
    for( int i = 0; i < 5; i++ ){
        printf( inPrompt );
        scanf( inDec, &input );

        r7 = r7 + input;
    }

    r6 = 0x334; //bp -12 wd 12

    if( r7 == 0 ) goto error;

    r1 = r7 * r6;
    r1 = r1 >> 12;
    
    printf( outAvg, r1 );

    goto end;

error:
    printf( outError );
    goto end;
end:
    return 0;
}