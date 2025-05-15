# FlexCalc

**FlexCalc** é uma calculadora avançada desenvolvida com **FLEX** e **BYACC**, no contexto do projeto da UC de Compiladores. Permite efetuar operações com números inteiros e reais, seguindo a sintaxe da linguagem C e suportando comandos de gestão de memória.

---

## 🧩 Funcionalidades

- Suporte a **números inteiros e reais**
- Atribuição de valores a variáveis
- Operações aritméticas: `+`, `-`, `*`, `/`, `%`, `**` (potência)
- Operações bit a bit: `&`, `|`, `^`, `~`, `>>`, `<<`
- Parêntesis e menos unário
- Incremento (`++`) e decremento (`--`)
- Cast para inteiro: `[(int)]`
- Precedência e associatividade idêntica à linguagem **C**
- Tabela de símbolos com tipo, nome e valor
- Comandos especiais:
  - `@CLEAR`, `@CLEAR INT`, `@CLEAR REAL`, `@CLEAR id`
  - `@LIST`, `@LIST INT`, `@LIST REAL`, `@LIST id`

---

## 🔧 Compilação

Certifica-te de que tens o **flex**, **bison** e **gcc** instalados.

Para compilar o projeto:

```bash
make

./flexcalc
```
ou, para correr com o ficheiro de testes de imediato: 
```bash
./flexcalc < testes.txt
```

Para limpar os ficheiros gerados: 
```bash
make clean
````

