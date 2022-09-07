%%
[ \n]          return 1;
.               return 2;
%%

    int yywrap(void){
        return 1;
    }
    int main(){
        int x=yylex();
        while(x){
            if(x==2){
                printf("\"%s\"|",yytext);
            }
            x=yylex();
        }
        return 0;

    }
