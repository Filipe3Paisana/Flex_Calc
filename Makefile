# Makefile para FlexCalc

PROG = flexcalc

all: $(PROG)

$(PROG): calc.l calc.y tabela_simbolos.c
	flex calc.l
	yacc -d calc.y
	gcc -o $(PROG) lex.yy.c y.tab.c tabela_simbolos.c -lm

clean:
	rm -f lex.yy.c y.tab.c y.tab.h $(PROG)