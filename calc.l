%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

DIGITO     [0-9]
LETRA      [a-zA-Z_]
ID         {LETRA}({LETRA}|{DIGITO})*
REAL       {DIGITO}+\.{DIGITO}+([eE][-+]?{DIGITO}+)?
INT        {DIGITO}+

%%

"**"        { return EXP; }
">>"        { return SHR; }
"<<"        { return SHL; }
"++"        { return INC; }
"--"        { return DEC; }

"="         { return '='; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"%"         { return '%'; }
"&"         { return '&'; }
"|"         { return '|'; }
"^"         { return '^'; }
"~"         { return '~'; }
"("         { return '('; }
")"         { return ')'; }

"[(int)]"   { return CAST_INT; }

@CLEAR[ \t]+INT   { return CLEAR_INT; }
@CLEAR[ \t]+REAL  { return CLEAR_REAL; }
@CLEAR[ \t]+{ID}  {
                   yylval.id = strdup(yytext + 7);
                   return CLEAR_VAR;
                 }
@CLEAR      { return CLEAR_ALL; }

@LIST[ \t]+INT    { return LIST_INT; }
@LIST[ \t]+REAL   { return LIST_REAL; }
@LIST[ \t]+{ID}   {
                   yylval.id = strdup(yytext + 6);
                   return LIST_VAR;
                 }
@LIST       { return LIST_ALL; }

{REAL}      {
                yylval.r_val = atof(yytext);
                return REAL;
            }

{INT}       {
                yylval.i_val = atoi(yytext);
                return INT;
            }

{ID}        {
                yylval.id = strdup(yytext);
                return ID;
            }

[\n]        { return '\n'; }

[ \t\r]+    { /* ignora espaços */ }

.           { printf("Carácter inválido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}