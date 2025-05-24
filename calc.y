%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "tabela_simbolos.h"

extern int yylex();
void yyerror(const char *s);

Simbolo *s;
%}

// --- tipos de dados a usar ---
%union {
    int i_val;
    float r_val;
    char *id;
}

// --- tokens e seus tipos ---
%token <i_val> INT
%token <r_val> REAL
%token <id> ID
%token <id> CLEAR_VAR LIST_VAR

%token EXP SHR SHL INC DEC
%token CAST_INT

%token CLEAR_ALL CLEAR_INT CLEAR_REAL
%token LIST_ALL LIST_INT LIST_REAL

// --- tipos de retorno das expressões ---
%type <r_val> expr
%type <i_val> expr_int

// --- precedência como na linguagem C ---
%left '|'
%left '^'
%left '&'
%left SHL SHR
%left '+' '-'
%left '*' '/' '%'
%right EXP
%right UMINUS

%%

// === GRAMÁTICA ===

input:
    input line
  | /* vazio */
  ;

line:
    expr '\n'              { printf("%.2f\n", $1); }
  | expr_int '\n'          { printf("%d\n", $1); }
  | ID '=' expr '\n'       {
                              s = procuraOuCria($1);
                              if (floor($3) == $3) {
                                  s->tipo = TIPO_INT;
                                  s->valor.i_val = (int)$3;
                                  printf("%d\n", s->valor.i_val);
                              } else {
                                  s->tipo = TIPO_REAL;
                                  s->valor.r_val = $3;
                                  printf("%.2f\n", s->valor.r_val);
                              }
                              free($1);
                           }
  | ID '=' expr_int '\n'   {
                              s = procuraOuCria($1);
                              s->tipo = TIPO_INT;
                              s->valor.i_val = $3;
                              printf("%d\n", $3);
                              free($1);
                           }
  | INC ID '\n'            {
                              s = procuraOuCria($2);
                              if (s->tipo == TIPO_INT)
                                  printf("%d\n", ++s->valor.i_val);
                              else {
                                  s->valor.r_val += 1.0;
                                  printf("%.2f\n", s->valor.r_val);
                              }
                              free($2);
                           }
  | DEC ID '\n'            {
                              s = procuraOuCria($2);
                              if (s->tipo == TIPO_INT)
                                  printf("%d\n", --s->valor.i_val);
                              else {
                                  s->valor.r_val -= 1.0;
                                  printf("%.2f\n", s->valor.r_val);
                              }
                              free($2);
                           }
  | CLEAR_ALL '\n'         { limpaTabela(); }
  | CLEAR_INT '\n'         { limpaPorTipo(TIPO_INT); }
  | CLEAR_REAL '\n'        { limpaPorTipo(TIPO_REAL); }
  | CLEAR_VAR '\n'         { limpaVariavel($1); free($1); }
  | LIST_ALL '\n'          { listaTabela(); }
  | LIST_INT '\n'          { listaPorTipo(TIPO_INT); }
  | LIST_REAL '\n'         { listaPorTipo(TIPO_REAL); }
  | LIST_VAR '\n'          { listaVariavel($1); free($1); }
  ;

expr:
    expr '+' expr         { $$ = $1 + $3; }
  | expr '-' expr         { $$ = $1 - $3; }
  | expr '*' expr         { $$ = $1 * $3; }
  | expr '/' expr         { $$ = $1 / $3; }
  | expr EXP expr         { $$ = pow($1, $3); }
  | expr '%' expr         { $$ = fmod($1, $3); }
  | expr SHL expr         { $$ = (int)$1 << (int)$3; }
  | expr SHR expr         { $$ = (int)$1 >> (int)$3; }
  | '-' expr %prec UMINUS { $$ = -$2; }
  | '(' expr ')'          { $$ = $2; }
  | '(' CAST_INT ')' expr { $$ = (int)$4; }
  | ID                    {
                            s = procura($1);
                            if (!s) {
                                yyerror("Variável não definida");
                                $$ = 0;
                            } else if (s->tipo == TIPO_INT)
                                $$ = (float)s->valor.i_val;
                            else
                                $$ = s->valor.r_val;
                            free($1);
                          }
  | INT                   { $$ = (float)$1; }
  | REAL                  { $$ = $1; }
  ;

expr_int:
    expr_int '+' expr_int       { $$ = $1 + $3; }
  | expr_int '-' expr_int       { $$ = $1 - $3; }
  | expr_int '*' expr_int       { $$ = $1 * $3; }
  | expr_int '/' expr_int       { $$ = $1 / $3; }
  | expr_int '%' expr_int       { $$ = $1 % $3; }
  | expr_int EXP expr_int       { $$ = pow($1, $3); }
  | expr_int '&' expr_int       { $$ = $1 & $3; }
  | expr_int '|' expr_int       { $$ = $1 | $3; }
  | expr_int '^' expr_int       { $$ = $1 ^ $3; }
  | expr_int SHR expr_int       { $$ = $1 >> $3; }
  | expr_int SHL expr_int       { $$ = $1 << $3; }
  | '~' expr_int                { $$ = ~$2; }
  | '-' expr_int %prec UMINUS   { $$ = -$2; }
  | '(' expr_int ')'            { $$ = $2; }
  | ID                          {
                                  s = procura($1);
                                  if (!s) {
                                      yyerror("Variável não definida");
                                      $$ = 0;
                                  } else if (s->tipo == TIPO_INT)
                                      $$ = s->valor.i_val;
                                  else
                                      $$ = (int)s->valor.r_val;
                                  free($1);
                                }
  | INT                         { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}