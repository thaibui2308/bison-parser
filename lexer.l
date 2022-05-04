
%{
#define YYSTYPE double
#include "parser.tab.h"
#include <stdlib.h>
%}

id [a-zA-Z][a-zA-Z0-9]*
number [0-9][0-9]*
white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%
{white} { }
{real} {  
 return NUMBER;
}

{id} {
    return IDENTIFIER;
}

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"=" return EQUAL;
"^" return POWER;
"%" return MOD;
"(" return LEFT;
")" return RIGHT;
"\n" return END;
";" return COLON;
. return ERROR;
%%

yywrap(){}