%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE char*
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER EQUAL MOD
%token LEFT RIGHT
%token END
%token IDENTIFIER
%token ERROR
%token COLON

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG
%right POWER

%start Input
%%

Input:
    
     | Input Line
;

Line:
     END
     | Expression END { printf(" --valid\n"); }
     | Expression COLON END  { printf(" --valid\n"); }
     | error END {yyerrok;}
;

Expression:
    IDENTIFIER 
| NUMBER
| Expression PLUS Expression 
| IDENTIFIER EQUAL Expression
| Expression MINUS Expression 
| Expression TIMES Expression 
| Expression DIVIDE Expression 
| Expression MOD Expression
| LEFT Expression RIGHT 
;

%%

extern char* yytext;
extern FILE *yyin;


int yyerror(char *s) {
  printf(" --invalid lexeme: %s\n",yytext);
}

int main(int argc, char *argv[]) {
  if (argc == 1) {
       printf("ERROR: no file specified.\n");
       exit(0);
  } 
  if (argc == 2) {
       yyin = fopen(argv[1], "r");
       yyparse();
  }
  if (argc == 3) {
       printf("ERROR: too many arguments.\n");
       exit(0);
  }
}