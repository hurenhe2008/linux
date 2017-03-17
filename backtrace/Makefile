INCLUDE=-I.
LIB=
OBJS=test.o
CFLAGS=-c -g -Wall
CC=gcc

EXENAME=test_backtrace

all: $(EXENAME)


$(EXENAME): $(OBJS) $(LIB)
	$(CC) -o $@ $^

.c.o:
	$(CC) $(CFLAGS) -o $@ $<



clean:
	rm -rf *.o *.~ $(EXENAME)
