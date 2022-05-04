%{
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE char*

FILE *fptr = NULL;
int count = 0;
char line[128][128];
char fname[20];
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE EQUAL MOD
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
     | Statement COLON END  { 
          int i = 0;
          printf("%s",line[count]);
          for (i=0; i<55-strlen(line[count]);i++)
          printf(" ");
          printf("-- valid\n");
          count++; }
     | Expression END {
          int i = 0;
          printf("%s",line[count]);
          for (i=0; i<55-strlen(line[count]);i++)
          printf(" ");
          printf("-- valid\n");
          count++;
     }
     | error END {yyerrok;}
;

Statement:
     IDENTIFIER EQUAL Expression
;

Expression:
    IDENTIFIER 
| NUMBER
| Expression PLUS Expression 
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
     int i = 0;
     printf("%s",line[count]);
     for (i=0; i<55-strlen(line[count]);i++)
          printf(" ");
     
     if (*yytext == '\n') {
          printf("-- invalid: invalid assignment\n");
     }
     else 
          printf("-- invalid lexeme: %s\n", yytext);
     count++;
}

int main(int argc, char *argv[]) {
  if (argc == 1) {
       printf("ERROR: no file specified.\n");
       exit(0);
  } 
  if (argc == 2) {
       fptr = fopen(argv[1], "r");
       yyin = fopen(argv[1], "r");
       if (yyin == NULL) {
            printf("ERROR: file not found.\n");
            exit(0);
       }

     int i =0;
     int total = 0;

     while (fgets(line[i], 128, fptr)) {
          line[i][strlen(line[i]) - 1] = '\0';
          i++;
     }
     total = i;

     
     yyparse();
       
  }
  if (argc == 3) {
       printf("ERROR: too many arguments.\n");
       exit(0);
  }
}