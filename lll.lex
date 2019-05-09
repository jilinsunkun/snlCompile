%{
		#inlude "string.h"

	#include <ctype.h>
	#include <stdio.h>
	typedf enum {
	   PROGRAM=1,TYPE,   VAR,    PROCEDURE,
	 	TYPE,VAR, IF, THEN, ELSE , FI, WHILE,DO,ENDWH,BEGIN1,END1, READ,WRITE,ARRAY,OF,RECORD,RETURN1,
	 	//TYPE
	 	INTEGER,CHAR1,
	 	/*MULTE WORD */
		ID , INTC, CHARC,
		//
		ASSIGN,EQ,LT,PLUS,MINUS,TIMES,OVER,LPAREN,RPAREN,DOT,COLON,SEMI,COMMA,LMIDPAREN,RMIDPAREN,UNDERANCE

	}LexType;

	#define MAXRESERVERD 21
	
	static struct 
	{
		char* str;
		LexType tok;
		
	}reservedWords[MAXRESERVERD]={
		{"program",PROGRAM},
		{"type",TYPE},
		{"var",VAR},
		{"procedure",PROCEDURE},
		{"begin",BEGIN1},
		{"end",END1},
		{"array",ARRAY},
		{"of",OF},
		{"record",RECORD},
		{"if",IF},
		{"then",THEN},

		{"else",ELSE},
		{"fi",FI},
		{"while",WHILE},
		{"do",DO},
		{"endwh",ENDWH},
		{"read",READ},
		{"write",WRITE},
		{"return",RETURN1},
		{"integer",INTEGER},
		{"char",CHAR1}};
	LexType reservedLookup(char* s);
	char yyval[200];
	int flag=0;
%}
%%


	[0-9]+if(flag==0){

		// integer
		yyval[0]='0';
		strcpy(yyval,yytext);
		return INTC
	}
	[a-z][a-z0-9]*if(flag==0)
	{
		//biaoshifu
		yyval[0]='\0';
		strcpy(yyval,yytext);
		return (reservedLookup(yytext));


	}
	'[a-z,0-9]'if(flag==0)
	{
		//char 
		yyval[0]='\0';
		strcpy(yyval,yytext);
		return CHARC;	
	}

	"+" if(flag==0) return PLUS;

	"-" if(flag==0) return MINUS;
	"*" if(flag==0) return TIMES;
	"/" if(flag==0) return OVER;
	"(" if(flag==0) return LPAREN;
	")" if(flag==0) return RPAREN;
	"." if(flag==0) return DOT;
	"[" if(flag==0) return LMIDPAREN;
	"]" if(flag==0) return RMIDPAREN;
	";" if(flag==0) return SEMI;
	":" if(flag==0) return COLON;
	"," if(flag==0) return COMMA;
	"<" if(flag==0) return LT;
	"=" if(flag==0) return EQ;
	":=" if(flag==0) return ASSIGN;
	".." if(flag==0) return UNDERANCE;
	"EOF" if(flag==0) return ENDFILE;
	"{" flag=1;
	"}" flag==0;
	[ \t\n] ;/**/
		if(flag==0){
			yyval[0]='0';
			strcpy(yyval,yytext);
			return ERROR;
		}
%%
%%

		LexType reservedLookup(char* s){


		}
		void printToken(int token){

		}
		void main(int argc, char const *argv[])
		{
			int n=1;
			while (n){
				n=yylex();
				printToken(n);
			}

		}

	int yywrap()
	{
	return 1;
	}