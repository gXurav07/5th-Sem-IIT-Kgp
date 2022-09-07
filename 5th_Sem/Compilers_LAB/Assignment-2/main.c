#include "myl.h"

#define MAX_INT __INT32_MAX__
#define MIN_INT (-__INT32_MAX__ - 1)



int main(){
    // TEST FOR: printStr
    printStr("*** TEST FOR: printStr() ***\n");
    char *sampleStrings[5] = {"Hello World!", "My name is Gaurav Malakar", "", " ", "abcd"};

    for(int i=0; i<5; i++){
        printStr("\""); 
        int characters = printStr(sampleStrings[i]); 
        printStr("\" ---> Number of characters printed = ");
        printInt(characters);
        printStr("\n");
    }


    // TEST FOR: readInt
    printStr("\n*** TEST FOR: readInt() ***\n");

    while(1){
        printStr("Please enter an integer: ");
        int n;
        int status = readInt(&n);

        if(status == OK){
            printStr("Success! The integer you entered is: ");
            printInt(n);
            printStr("\n");
        }
        else if(status == ERR){
            printStr("<?> INVALID INPUT!\n");
        }

        printStr("\nTo continue enter 1, or to exit enter 0: ");
        status = readInt(&n);
        if(status == OK && n==0){
            break;
        }

    }

    // TEST FOR: printInt
    printStr("\n*** TEST FOR: printInt() ***\n");
    int sample_ints[7] = {0, 2, -3, 12133, -2332, MAX_INT, MIN_INT};

    for(int i=0; i<7; i++){
        int characters = printInt(sample_ints[i]);
        printStr(" ---> Number of characters printed = ");
        printInt(characters);
        printStr("\n");
    }


    // TEST FOR: readFlt
    printStr("\n*** TEST FOR: readFlt() ***\n");

    while(1){
        printStr("Please enter a float: ");
        float f;
        int status = readFlt(&f);

        if(status == OK){
            printStr("Success! The float you entered is: ");
            printFlt(f);
            printStr("\n");
        }
        else if(status == ERR){
            printStr("<?> INVALID INPUT!\n");
        }

        printStr("\nTo continue enter 1, or to exit enter 0: ");
        int n;
        status = readInt(&n);
        if(status == OK && n==0){
            break;
        }

    }



    // TEST FOR: printFlt
    printStr("\n*** TEST FOR: printFlt() ***\n");
    float sample_floats[8] = {0.00, 4.3, -23.43, 12.345, -0.1234, 233.3423, -27.15625, 0.001};

    for(int i=0; i<8; i++){
        int characters = printFlt(sample_floats[i]);
        printStr(" ---> Number of characters printed = ");
        printInt(characters);
        printStr("\n");
    }


    printStr("\n           *** THANK YOU *** \n");





    return 0;
}