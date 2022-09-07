output.txt: a.out input.txt
		./a.out <input.txt >output.txt

a.out: ass3_20CS10029_20CS30042.o lex.yy.o
		gcc ass3_20CS10029_20CS30042.o lex.yy.o

ass3_20CS10029_20CS30042.o: ass3_20CS10029_20CS30042.c
		gcc -c ass3_20CS10029_20CS30042.c

lex.yy.o: lex.yy.c
		gcc -c lex.yy.c

lex.yy.c: ass3_20CS10029.l
		lex ass3_20CS10029.l

clean:
	rm a.out ass3_20CS10029_20CS30042.o lex.yy.o lex.yy.c
