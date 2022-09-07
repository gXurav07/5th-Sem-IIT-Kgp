#include "myl.h"
#define MAX_LENGTH 20
#define MAX_INT __INT32_MAX__
#define MIN_INT (-__INT32_MAX__ - 1)



int readFlt(float *f){
    char input[MAX_LENGTH];
    int length;

    __asm__ __volatile__ (
        "movl $0, %%eax \n\t" 
        "movq $0, %%rdi \n\t"
        "syscall \n\t"
        : "=a"(length)
        :"S"(input), "d"(MAX_LENGTH));

    length--;

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

    float multiplier=0.1;
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