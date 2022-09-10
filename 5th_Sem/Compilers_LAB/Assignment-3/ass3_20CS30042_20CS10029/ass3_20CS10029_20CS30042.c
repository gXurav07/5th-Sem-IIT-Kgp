#include<stdio.h>

extern int yylex();
extern char* yytext;

int yywrap(void)
{
	return 1;
}

int main(){
    int token;
    do {
        token = yylex();
        switch (token)
        {
        case KEYWORD:
            printf("<KEYWORD, %s>\n", yytext);
            break;
        case IDENTIFIER:
            printf("<IDENTIFIER, %s>\n", yytext);
            break;
        case INTEGER_CONSTANT:
            printf("<INTEGER_CONSTANT, %s>\n", yytext);
            break;
        case FLOATING_CONSTANT:
            printf("<FLOATING_CONSTANT, %s>\n", yytext);
            break;
        case ENUMERATION_CONSTANT:
            printf("<ENUMERATION_CONSTANT, %s>\n", yytext);
            break;
        case CHARACTER_CONSTANT:
            printf("<CHARACTER_CONSTANT, %s>\n", yytext);
            break;
        case STRING_LITERAL:
            printf("<STRING_LITERAL, %s>\n", yytext);
            break;
        case PUNCTUATOR:
            printf("<PUNCTUATOR, %s>\n", yytext);
            break;
        case SINGLE_LINE_COMMENT:
        case MULTI_LINE_COMMENT:
            // ignore comments
            break;
        case INVALID_TOKEN:
            printf("<INVALID_TOKEN, %s>\n", yytext);
            // return 1;
            break;
        }
    } while(token);
    return 0;
}