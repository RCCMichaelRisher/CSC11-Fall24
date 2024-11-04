# Makefile
all: test

test: test.o
	ld -o $@ $+

test.o: test.s
	as -o $@ $<

clean:
	rm -rf test *.o