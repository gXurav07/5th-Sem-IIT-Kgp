a.out:  main.o libass2_20CS10029.a 
	cc main.o -L. -lass2_20CS10029 

main.o: main.c myl.h
	cc -Wall -c main.c

libass2_20CS10029.a: ass2_20CS10029.o
	ar -rcs libass2_20CS10029.a ass2_20CS10029.o

ass2_20CS10029.o: ass2_20CS10029.c myl.h
	cc -c ass2_20CS10029.c

clean:
	rm a.out main.o libass2_20CS10029.a ass2_20CS10029.o
