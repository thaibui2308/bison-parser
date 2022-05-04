%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE char*
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER EQUAL
%token LEFT RIGHT
%token END
%token IDENTIFIER
%token ERROR

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
     | Expression END { printf("--valid\n"); }
;

Expression:
    IDENTIFIER 
| NUMBER
| Expression PLUS Expression 
| Expression EQUAL Expression
| Expression MINUS Expression 
| Expression TIMES Expression 
| Expression DIVIDE Expression 
| LEFT Expression RIGHT 
;

%%

extern char* yytext;
int yyerror(char *s) {
  printf("%s: %s\n", s,yytext);
}

int main() {
  if (yyparse())
     fprintf(stderr, "Successful parsing.\n");
  else
     fprintf(stderr, "error found.\n");
}