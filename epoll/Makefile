INCLUDE = -I.
CFLAGS = -c -g -Wall
CC = gcc
LINK = gcc

OBJS_SRV = test_server.o
OBJS_CL = test_client.o

LIBS_SRV = 
LIBS_CL = 

SRV_NAME = server
CL_NAME = client

all: $(SRV_NAME) $(CL_NAME)

$(SRV_NAME): $(OBJS_SRV) $(LIBS_SRV)
	$(LINK) -o $@ $^

$(CL_NAME): $(OBJS_CL) $(LIBS_CL)
	$(LINK) -o $@ $^

.c.o:
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf ~.* *.o $(SRV_NAME) $(CL_NAME)
