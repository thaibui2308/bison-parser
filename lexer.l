
%{
    #include "parser.tab.h"
%}

/*rules */

%% 
[0-9]+ {
    return id;
}

[a-zA-Z] {return id;}

[a-zA-Z][a-zA-Z0-9]+ {return id;}

'+' {return op;}

'-' {return op;}

'*' {return op;}


\n {
    return EOL;
}

. {}
%%

yywrap(){}


