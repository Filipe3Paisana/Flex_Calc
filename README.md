# 🧮 Calculadora FLEX/BYACC — Compiladores 2025

Projeto desenvolvido no âmbito da unidade curricular de **Compiladores**, do **3.º ano da Licenciatura em Engenharia Informática**.

---

## 📌 Descrição

Este projeto consiste na implementação de uma calculadora avançada, utilizando as ferramentas **FLEX** (analisador léxico) e **BYACC** (analisador sintáctico), com funcionalidades inspiradas na linguagem C.

### ✅ Funcionalidades principais:

- **Suporte a dois tipos numéricos**: inteiros e reais
- **Operações aritméticas**: `+`, `-`, `*`, `/`, `%`
- **Potência**: `**`
- **Operações bit a bit**: `&`, `|`, `^`, `>>`, `<<`, `~`
- **Uso de parêntesis** e **valores negativos (operador unário -)**
- **Incremento e decremento**: `++`, `--`
- **Cast de reais para inteiros**: `(int)`
- **Atribuição de valores a variáveis**

---

## 🧠 Tabela de Símbolos

- Armazena variáveis do tipo **inteiro** e **real**
- Os nomes das variáveis seguem as regras de identificadores da linguagem C
- Cada entrada na tabela regista o **nome**, **tipo** e **valor actual** da variável

---

## ✍️ Exemplo de Execução

```text
2+5*3
 17
x = 2**3
 8
alfa = (x<<1)*2.5
 40.0
alfa+1
 41.0
