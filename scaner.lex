%{

int linenum = 1;
int flag=0;
int keyId = 1;
#include <ctype.h>
#define SIZE 1024
#define MAX_LINE_LENG 1024
char buf[MAX_LINE_LENG];
char tempStrBuf[MAX_LINE_LENG];
struct DataItem {
   char data[100];
   int key;
};
struct DataItem* *hashArray;
int hashCode(int key) {
   return key % SIZE;
}
//Creates a symbol table.
struct DataItem* * create(){
  static struct DataItem* newHashArray[SIZE];
  return newHashArray;
};
//Returns index of the entry for int key
int lookup(char *data) {
   //get the hash
   int hashIndex = 1;
   int isFind = 0;
   //move in array until an empty
   printf("lookup:  %s\n", data);
   printf("hashArray[hashIndex]:  %s\n", hashArray[1]->data);
   while(hashArray[hashIndex] != NULL) {
      if(strcmp(hashArray[hashIndex]->data, data) == 0)
      {
        isFind = 1;
        break;
      }
      else
      {
        ++hashIndex;
      }
   }
   if(isFind == 1){
     return hashIndex;
   }
   else{
     return -1;
   }
}
//Inserts s into  the symbol table
void insert(char *data) {
   struct DataItem *item = (struct DataItem*) malloc(sizeof(struct DataItem));
	 strcpy(item->data, data);
   item->key = keyId;

   //get the hash
   int hashIndex = hashCode(keyId);

	 //move in array until an empty or deleted cell
	 int f = 1;
	 for(int i = 1;i < SIZE;i++){
 		  if(hashArray[i]->data != NULL &&  (strcmp(data, hashArray[i]->data) == 0)){
				f = 0;
		  }
   }
	 if (f) {
	 	hashArray[hashIndex] = item;
		keyId ++;
	 }
}
//Dumps all entries of the symbol table. returns index of the entry.
void dump() {
   for(int i = 1;i < SIZE;i++){
 		if(hashArray[i] != NULL)
    {
      printf("%d %s\n", i, hashArray[i]->data);
    }
 	}
}

#define LIST     {strcat(buf,yytext);strcat(buf," ");}
#define LISTNOSPACE     {strcat(buf,yytext);}
#define tokenIdentifier(t) {insert(yytext);LIST;printf("<%s:%s>\n", "id", t);}
#define convertUper(t) {for(int i = 0; i < strlen(t); i++){t[i] = toupper(t[i]);};printf("<%s>\n", t);}
#define tokenSysmbol(t) {LIST;printf("<'%s'>\n", t);}
#define tokenKeyword(t) {LIST;convertUper(t);}
#define tokenInteger(t) {LIST;printf("<%s:%s>\n", "integer", t);}
#define tokenBoolean(t) {LIST;printf("<%s:%s>\n", "boolean", t);}
#define tokenRealConstants(t) {LIST;printf("<%s:%s>\n", "real", t);}
#define tokenString(t) {LIST;printf("<string:%s>\n",t);}
%}
%x STRING
%%
("program")|("type")|("var")|("procedure")|("type")|("var")|("if")|("then")|("else")|("fi")|("while")|("do")|("endwh")|("begin1")|("end1")|("read")|("write")|("array")|("of")|("record")|("return1")|("integer")|("char1")|("id")|("intc")|("charc")|("assign")|("eq")|("lt")|("plus")|("minus")|("times")|("over")|("lparen")|("rparen")|("dot")|("colon")|("semi")|("comma")|("lmidparen")|("rmidparen")|("underance") {tokenKeyword(yytext);};

	[0-9]+ if(flag==0) {
		//tokenInteger(yytext)
		// integer
		// yyval[0]='0';
		// strcpy(yyval,yytext);
		// printf("%s\n",yyval );
		// return INTC
	};

	[a-z][a-z0-9]*if(flag==0) {
		//biaoshifu
		//yyval[0]='\0';
		//strcpy(yyval,yytext);
		//return (reservedLookup(yytext));


	};
	'[a-z,0-9]'if(flag==0) {
		//char 
		//yyval[0]='\0';
		// strcpy(yyval,yytext);
		// return CHARC;	
	};
%%

int main()
{
  hashArray = create();//Create a new symbol table.

  yylex(); /**Run regular expression before this part **/

  printf("\n%s\n", "Symbol Table:");
  //dump();
  return 0;
}
int yywrap()
{
return 1;
}
