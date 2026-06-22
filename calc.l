%{
#include "calc.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+          {
                    yylval = atoi(yytext);
                    return NUMBER;
                }

[+\-*/%]        { return yytext[0]; }

"("             { return '('; }
")"             { return ')'; }

[ \t\r]+        { /* ignore spaces */ }

\n              { return '\n'; }

.               { /* ignore invalid characters */ }

%%

int yywrap()
{
    return 1;
}
