#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

//char *names[] = {NULL, "db_type", "db_name", "db_port"};

int main(){
	int ntoken, vtoken;

	ntoken = yylex();
	while(ntoken){
		printf("%d %d %s\n", yylineno, ntoken, yytext);
		ntoken = yylex();
	}
	return 0;
}
