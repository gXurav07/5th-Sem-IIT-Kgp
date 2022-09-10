output.txt: a.out ass3_20CS10029_20CS30042_test.c
		./a.out < ass3_20CS10029_20CS30042_test.c >output.txt

a.out: lex.yy.c
		gcc lex.yy.c -lfl

lex.yy.c: ass3_20CS10029_20CS30042.l
		flex ass3_20CS10029_20CS30042.l ass3_20CS10029_20CS30042.c

clean:
	rm a.out lex.yy.c output.txt