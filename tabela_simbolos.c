#include "tabela_simbolos.h"
#include <stdio.h>
#include <string.h>

#define MAX_SIMBOLOS 100

static Simbolo tabela[MAX_SIMBOLOS];
static int n_simbolos = 0;

void initTabela() {
    n_simbolos = 0;
}

Simbolo* procura(const char *nome) {
    for (int i = 0; i < n_simbolos; i++)
        if (strcmp(tabela[i].nome, nome) == 0)
            return &tabela[i];
    return NULL;
}

Simbolo* procuraOuCria(const char *nome) {
    Simbolo *s = procura(nome);
    if (s) return s;

    if (n_simbolos >= MAX_SIMBOLOS) return NULL;
    strcpy(tabela[n_simbolos].nome, nome);
    tabela[n_simbolos].tipo = TIPO_INT;  // valor por defeito
    tabela[n_simbolos].valor.i_val = 0;
    return &tabela[n_simbolos++];
}

void limpaTabela() {
    n_simbolos = 0;
}

void limpaPorTipo(Tipo tipo) {
    for (int i = 0; i < n_simbolos;) {
        if (tabela[i].tipo == tipo) {
            tabela[i] = tabela[--n_simbolos];
        } else {
            i++;
        }
    }
}

void limpaVariavel(const char *nome) {
    for (int i = 0; i < n_simbolos; i++) {
        if (strcmp(tabela[i].nome, nome) == 0) {
            tabela[i] = tabela[--n_simbolos];
            return;
        }
    }
}

void listaTabela() {
    for (int i = 0; i < n_simbolos; i++) {
        printf("%s\t%s\t", tabela[i].tipo == TIPO_INT ? "int" : "real", tabela[i].nome);
        if (tabela[i].tipo == TIPO_INT)
            printf("%d\n", tabela[i].valor.i_val);
        else
            printf("%.2f\n", tabela[i].valor.r_val);
    }
}

void listaPorTipo(Tipo tipo) {
    for (int i = 0; i < n_simbolos; i++) {
        if (tabela[i].tipo == tipo) {
            printf("%s\t%s\t", tipo == TIPO_INT ? "int" : "real", tabela[i].nome);
            if (tipo == TIPO_INT)
                printf("%d\n", tabela[i].valor.i_val);
            else
                printf("%.2f\n", tabela[i].valor.r_val);
        }
    }
}

void listaVariavel(const char *nome) {
    Simbolo *s = procura(nome);
    if (s) {
        printf("%s\t%s\t", s->tipo == TIPO_INT ? "int" : "real", s->nome);
        if (s->tipo == TIPO_INT)
            printf("%d\n", s->valor.i_val);
        else
            printf("%.2f\n", s->valor.r_val);
    }
}