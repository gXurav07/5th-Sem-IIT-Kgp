#include<stdio.h>

extern int yylex();
extern char* yytext;

char *map[]={"","KEYWORD","IDENTIFIER","INTEGER_CONSTANT","FLOATING_CONSTANT",
"ENUMERATION_CONSTANT","CHARACTER_CONSTANT", "STRING_LITERAL", "PUNCTUATOR", "SINGLE_LINE_COMMENT",
"MULTI_LINE_COMMENT", "INVALID_ENTRY"};

int main(){
    int token=yylex();
    while(token){
        printf("%s: %s\n", yytext, map[token]);
        token = yylex();
    }
    return 0;
}

