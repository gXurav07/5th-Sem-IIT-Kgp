#include "myl.h"
#define MAX_LENGTH 20
#define MAX_INT __INT32_MAX__
#define MIN_INT (-__INT32_MAX__ - 1)

int printStr(char *buff){
    int length=0;
    while (buff[length] != '\0'){    // calculate length of buff
        length++;
    }
    __asm__ __volatile__(           // Assembly code to print a buffing
        "movl $1, %%eax \n\t"       // eax <-- 1 ( system call for write)
        "movq $1, %%rdi \n\t"   //  rdi <-- 1 ( stdout file represented by 1)
        "syscall \n\t"
        :
        :"S"(buff),"d"(length)
    );
    return length;
}

int readInt(int *n) {
    char input[MAX_LENGTH];
    int length;

    __asm__ __volatile__ (
        "movl $0, %%eax \n\t"   // eax <-- 0: system call for read
        "movq $0, %%rdi \n\t"   // rdi <-- 0: std-in file
        "syscall \n\t"
        : "=a"(length)
        :"S"(input), "d"(MAX_LENGTH));

    length-=1;  // '\n' is also included in length, so we have to do length-=1

    if(length <= 0){
        return ERR;
    }
    

    long x = 0, sign=1;
    int i=0;
    if(input[0] == '-') {
        sign = -1;
        ++i;
    }
    else if(input[0] == '+'){
        ++i;
    }
    
    while(i<length){

        if(input[i] < '0' || input[i] > '9'){
            return ERR;
        }

        long curr = sign * (long)(input[i] - '0');
        x = x*10 + curr;

        if(x > MAX_INT || x < MIN_INT){
            return ERR;
        }
        ++i;
    }

    *n = (int)x;
    return OK;
}


int printInt(int n){
    char buff[MAX_LENGTH];
    int i=0;


    if(n==0){
        buff[i++]='0';
    }
    else if(n<0){
        if(n==-2147483648){  // Edge case. Here, doing n = -n causes overflow
            printStr("-2147483648");
            return 11;
        }
        buff[i++]='-';
        n= -n;
    }

    while(n){
        buff[i++] = (n%10 + '0');
        n/=10;
    }
    buff[i]='\0';

    int j=0;
    if(buff[0]=='-'){
        j=1;
    }

    --i;
    while(j<i){
        char temp=buff[i];
        buff[i]=buff[j];
        buff[j]=temp;
        --i;
        ++j;
    }
    return printStr(buff);

}


int readFlt(float *f){
    char input[MAX_LENGTH];
    int length;

    __asm__ __volatile__ (
        "movl $0, %%eax \n\t" 
        "movq $0, %%rdi \n\t"
        "syscall \n\t"
        : "=a"(length)
        :"S"(input), "d"(MAX_LENGTH));

    length--;  // '\n' is also included in length, so we have to do length-=1

    if(length <= 0){
        return ERR;
    }
    

    long integralPart = 0, sign=1;
    int i=0;
    if(input[0] == '-') {
        sign = -1;
        ++i;
    }
    else if(input[0] == '+'){
        ++i;
    }
    
    while(i<length){
        if(input[i]=='.'){
            ++i;
            break;
        }
        if(input[i] < '0' || input[i] > '9'){
            return ERR;
        }

        long curr = sign * (long)(input[i] - '0');
        integralPart = integralPart*10 + curr;

        if(integralPart > MAX_INT || integralPart < MIN_INT){
            return ERR;
        }
        ++i;
    }

    float multiplier=0.1*sign;
    *f=integralPart;
    while(i<length){
        if(input[i] < '0' || input[i] > '9'){
            return ERR;
        }
        *f += multiplier*(input[i]-'0');
        multiplier*=0.1;
        ++i;
    }
    return OK;
 
}

int printFlt(float f){
    int integralPart=(int)f, fractionalPart=0, characters=0;  
    // fractionalPart variable stores the part of f after decimal point (without preceding zeroes)

    if( f<0){
        characters += printStr("-");
    }
    f -= integralPart;
    if(f<0) f= -f;
    if(integralPart<0) integralPart=-integralPart;
    
    
    int precedingZeroCount=0; // number of zeroes preceding the first non-zero digit after decimal point

    for(int i=0;i<6;++i){  // maximum 6 digits allowed after decimal 
        f*=10;
        if(f<1) precedingZeroCount++;
    }

    fractionalPart=f;

    while(fractionalPart%10 == 0){
        fractionalPart/=10;
        if(fractionalPart==0) break;
    }

    characters += printInt(integralPart);     // print the part before decimal point

    characters += printStr(".");    // print the decimal point
    

    if(fractionalPart != 0){
        char precedingZeroes[7] ="000000";
        precedingZeroes[precedingZeroCount]='\0';
        characters += printStr(precedingZeroes);   // print zeroes preceding the first non-zero digit after decimal point

        characters += printInt(fractionalPart);  // print rest of the part after decimal point
    }
    return characters;

} 



