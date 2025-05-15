#ifndef TABELA_SIMBOLOS_H
#define TABELA_SIMBOLOS_H

typedef enum { TIPO_INT, TIPO_REAL } Tipo;

typedef struct {
    char nome[64];
    Tipo tipo;
    union {
        int i_val;
        float r_val;
    } valor;
} Simbolo;

void initTabela();
void limpaTabela();
void limpaPorTipo(Tipo tipo);
void limpaVariavel(const char *nome);
void listaTabela();
void listaPorTipo(Tipo tipo);
void listaVariavel(const char *nome);

Simbolo* procuraOuCria(const char *nome);
Simbolo* procura(const char *nome);

#endif