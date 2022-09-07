#include <stdio.h>

int main(){
    char str[3]="b";
    int sz = sizeof(str)/sizeof(char);
    printf("%d\n", str[4]);
    return 0;
}