%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'

%start calc

%%

calc:
      calc expr '\n'   { printf("Result = %d\n", $2); }
    | /* empty */
    ;

expr:
      expr '+' expr    { $$ = $1 + $3; }
    | expr '-' expr    { $$ = $1 - $3; }
    | expr '*' expr    { $$ = $1 * $3; }
    | expr '/' expr    { $$ = $1 / $3; }
    | expr '%' expr    { $$ = $1 % $3; }
    | '(' expr ')'     { $$ = $2; }
    | NUMBER           { $$ = $1; }
    ;

%%

int main()
{
    printf("Enter Expression:\n");
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    printf("Error: %s\n", s);
}
