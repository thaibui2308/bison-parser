
%{
#define YYSTYPE double
#include "parser.tab.h"
#include <stdlib.h>
%}

id [a-zA-Z1-9]+
white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%
{white} { }
{real} {  
 return IDENTIFIER;
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
"(" return LEFT;
")" return RIGHT;
"\n" return END;

%%

yywrap(){}