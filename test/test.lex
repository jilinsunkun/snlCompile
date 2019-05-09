%{
#include <stdio.h>
%}
%%
[\n] ;
A {printf("ONE\n");};
AA {printf("TWO\n");};
AAAA {printf("THREE\n");};
%%
%%
showtitle()
{
printf("----Lex Example ----\n");
}
int main()
{
    linenum = 0;
    yylex();
    printf("\nLine Count:%d\n",linenum);
    return 0;
}
int yywrap()
{
return 1;
}