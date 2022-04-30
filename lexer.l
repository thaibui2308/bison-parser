
%{
    #include "parser.tab.h"
%}

/*rules */

%% 
[0-9]+ {
    yylval.sym = yytext;
    return id;
}

[a-zA-Z] {
    yylval.sym = yytext;
    return id;
}

[A-Za-z0-9_]+ {
    yylval.sym = yytext;
    return id;
}

'+' {
    yylval.sym = yytext;
    return op;
}

'-' {
    yylval.sym = yytext;
    return op;
}

'*' {
    yylval.sym = yytext;
    return op;
}


\n {
    return EOL;
}

. {}
%%

yywrap(){}



