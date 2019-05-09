a.out: lex.yy.c
	gcc lex.yy.c
lex.yy.c:scaner.lex
	lex scaner.lex
clean:
	rm -f *.o *.out *.jasm lex.yy.c y.tab.c y.tab.h go_compiler *.class