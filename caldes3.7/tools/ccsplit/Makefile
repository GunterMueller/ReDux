# Makefile to compile ccsplit from ccsplit.l

ccsplit: ccsplit.l
		rm -f lex.yy.c
		lex ccsplit.l
		cc -o ccsplit lex.yy.c -ll
		rm -f lex.yy.c
