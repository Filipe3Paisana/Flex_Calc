# 🧮 Calculadora FLEX/BYACC — Compiladores 2025

Projeto desenvolvido para a disciplina de **Compiladores**, no âmbito do curso de **Engenharia Informática (3º ano)**.

## 📌 Descrição

Este projeto consiste na implementação de uma calculadora avançada utilizando as ferramentas **FLEX** (scanner) e **BYACC** (parser). A calculadora suporta:

- Números inteiros e reais
- Operações aritméticas: `+`, `-`, `*`, `/`, `%`
- Potência: `**`
- Operações bit a bit: `&`, `|`, `^`, `>>`, `<<`, `~`
- Parênteses e negativos (unário)
- Incremento e decremento: `++`, `--`
- Cast de real para inteiro: `(int)`
- Atribuição de variáveis: `=`

## 🔢 Exemplo de Uso

```text
2+5*3
 17
x = 2**3
 8
alfa = (x<<1)*2.5
 40.0
alfa+1
 41.0
