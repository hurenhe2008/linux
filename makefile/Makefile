CFLAGS = -c

INCLUDE =
LIB =
OBJS = main.o

APPNAME = test


all: $(APPNAME)

.c.o: 
	gcc $(CFLAGS) -o $@ $<

$(APPNAME): $(OBJS)
	gcc -o $@ $(LIB) $^



clean:
	rm -rf *.o ~.* $(APPNAME)
