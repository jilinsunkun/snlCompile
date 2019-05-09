%{
#include <stdio.h>
linenum = 0;
%}
%%
[\n] ;
%%

int main()
{
    linenum = 0;
    yylex();
   // printf("\nLine Count:%d\n",linenum);
    return 0;
}
int yywrap()
{
return 1;
}