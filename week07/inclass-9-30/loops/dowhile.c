#include <stdio.h>

int main() {
    // i++ == i = i + 1
    int i = 11;
    do{
        printf( "%d, ", i );
        i++;
    } while(  i < 10  );
}