%{
    #define KEYWORD                 1
    #define IDENTIFIER              2
    #define INTEGER_CONSTANT        3
    #define FLOATING_CONSTANT       4
    #define ENUMERATION_CONSTANT    5
    #define CHARACTER_CONSTANT      6
    #define STRING_LITERAL          7
    #define PUNCTUATOR              8
    #define SINGLE_LINE_COMMENT     9
    #define MULTI_LINE_COMMENT      10
    #define INVALID_ENTRY           11
%}

%x MULTI_LINE_COMMENT_BODY
%x SINGLE_LINE_COMMENT_BODY

KEYWORD                             "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"

IDENTIFIER                          {IDENTIFIER_NONDIGIT}[a-zA-Z0-9]* 
IDENTIFIER_NONDIGIT                 [a-zA-Z]

CONSTANT                            {INTEGER_CONSTANT}|{FLOATING_CONSTANT}|{ENUMERATION_CONSTANT}|{CHARACTER_CONSTANT}

INTEGER_CONSTANT                    {NONZERO_DIGIT}{DIGIT}*|"0"
NONZERO_DIGIT                       [1-9]
DIGIT                               [0-9]

FLOATING_CONSTANT                   {FRACTIONAL_CONSTANT}{EXPONENT_PART}?|{DIGIT_SEQUENCE}{EXPONENT_PART}
FRACTIONAL_CONSTANT                 {DIGIT_SEQUENCE}?[.]{DIGIT_SEQUENCE}|{DIGIT_SEQUENCE}[.]
EXPONENT_PART                       [eE]{SIGN}?{DIGIT_SEQUENCE}
SIGN                                [+-]  
DIGIT_SEQUENCE                      {DIGIT}+
      

ENUMERATION_CONSTANT                {IDENTIFIER}

CHARACTER_CONSTANT                  \'{C_CHAR_SEQUENCE}\'
C_CHAR_SEQUENCE                     {C_CHAR}+
C_CHAR                              [^\'\n\\]|{ESCAPE_SEQUENCE}
ESCAPE_SEQUENCE                     "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"

STRING_LITERAL                      \"{S_CHAR_SEQUENCE}?\"
S_CHAR_SEQUENCE                     {S_CHAR}+
S_CHAR                              [^\"\n\\]|{ESCAPE_SEQUENCE}

PUNCTUATOR                          "["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"|";"|"..."|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="|","|"#"



%%

                                 
{KEYWORD}                           return KEYWORD;    
{IDENTIFIER}                        return IDENTIFIER;
{INTEGER_CONSTANT}                  return INTEGER_CONSTANT;
{FLOATING_CONSTANT}                 return FLOATING_CONSTANT;
{CHARACTER_CONSTANT}                return CHARACTER_CONSTANT;
{STRING_LITERAL}                    return STRING_LITERAL;
{PUNCTUATOR}                        return PUNCTUATOR;
"/*"                                { BEGIN(MULTI_LINE_COMMENT_BODY); }
<MULTI_LINE_COMMENT_BODY>"*/"       { BEGIN(INITIAL); return MULTI_LINE_COMMENT; }
<MULTI_LINE_COMMENT_BODY>.          { }
<MULTI_LINE_COMMENT_BODY>"\n"       { }

"//"                                { BEGIN(SINGLE_LINE_COMMENT_BODY); }
<SINGLE_LINE_COMMENT_BODY>"\n"      { BEGIN(INITIAL); return SINGLE_LINE_COMMENT; }
<SINGLE_LINE_COMMENT_BODY><<EOF>>   { BEGIN(INITIAL); return SINGLE_LINE_COMMENT; }
<SINGLE_LINE_COMMENT_BODY>.         { }
.                                   return INVALID_ENTRY;
%%
int yywrap(void)
{
	return 1;
}