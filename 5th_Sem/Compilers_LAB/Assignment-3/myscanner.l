%{
#define TYPE 1
#define NAME 2
#define TABLE_PREFIX 3
#define IDENTIFIER 4
#define INTEGER 5
#define COLON 6
#define PORT 7

%}

%%
:		return COLON;
"db_type" 	return TYPE;
"db_name"	return NAME;
"db_port"	return PORT;

[a-zA-Z_][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]* 		return INTEGER;
[ \t\n]			;
.			printf("Unexpected Character");
%%
int yywrap(void)
{
	return 1;
}