#include <stdio.h>

int yyparse(void);

int main() {
    printf("FlexCalc: insere expressões. CTRL+D para sair.\n");
    yyparse();
    return 0;
}