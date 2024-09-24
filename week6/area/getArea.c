#include <stdio.h>

int main(){
    int r1,r2,r3,r4,r5,r6,r7,r8;
    int width, length;

    char inWidth[] = "input the width: ";
    char* inLength = "input the length: ";
    char *inDec = "%d";
    char *outArea = "the area is %d\n";
    char *outSquare = "the shape with length %d and width %d is a square\n";
    char *outRect = "the shape with lengh %d and width %d is not a square\n";

    printf(  inWidth );
    scanf( inDec, &width );

    printf( inLength );
    scanf( inDec, &length );

    r1 = length;
    r2 = width;
    r7 = r1 * r2;

    printf( outArea, r7 );

    if ( r1 == r2 ){
        goto square;
square:
        printf( outSquare, length, width );
        goto end;
    } else {
        goto rect;
rect:
        printf(outRect, length, width );
        goto end;
    }

end:
    return 0;
}