/*** Definition section ***/
%{
    
%}

%union {
    char* sym;
    int fn;
    double d;
}

%token EOL
%token<sym> id
%token<operator> op

%type<sym> exp
%type<sym> assignment


// %left '-' '+'
// %left '*' '/'
/* rules */
%%

stm_list:
    stm EOL
|   stm_list stm EOL;

stm: 
    assignment
|   exp;

assignment: 
    id "=" exp { printf("--valid\n"); };

exp: 
    exp op id{ printf("--valid\n");}
|    id { printf("--valid\n"); };

%%

int main() {
    yyparse();

    return 0;
}

int yyerror (char *msg) {
  printf("ERROR: %s: '%s'\n", msg, yylval.sym);
  return 0;
}