a.out: main.o lex.yy.o sintactico.tab.o
	gcc main.o lex.yy.o sintactico.tab.o -ll
	
main.o: main.c sintactico.tab.c
	gcc -c main.c
	
lex.yy.o: lex.yy.c
	gcc -c lex.yy.c
	
sintactico.tab.o: sintactico.tab.c
	gcc -c sintactico.tab.c

lex.yy.c: lexico.l sintactico.y
	flex lexico.l
	
sintactico.tab.c: sintactico.y
	bison -d sintactico.y
	
clean: 
	rm a.out main.o lex.yy.o sintactico.tab.o lex.yy.c sintactico.tab.c sintactico.tab.h

run: a.out
	./a.out
