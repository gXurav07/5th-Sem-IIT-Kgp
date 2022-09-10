%{
#include "myscanner.h"
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
