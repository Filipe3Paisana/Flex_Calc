# Makefile para FlexCalc

PROG = flexcalc

all: $(PROG)

$(PROG): calc.l calc.y tabela_simbolos.c
	flex calc.l
	bison -d -o y.tab.c calc.y
	gcc -o $(PROG) lex.yy.c y.tab.c tabela_simbolos.c main.c -lm

clean:
	rm -f lex.yy.c y.tab.c y.tab.h $(PROG)