#
# Student makefile for Cache Lab
# Note: requires a 64-bit x86-64 system 
#
CC = gcc
CFLAGS = -g -Wall -Werror -std=c99 -m64
all: bfs test-app

bfs: bfs.c
	$(CC) $(CFLAGS) -o bfs bfs.c

test-app: test-app.c cachelab.h
	$(CC) $(CFLAGS) -o test-app test-app.c cachelab.h

#
# Clean the src dirctory
#
clean:
	rm -rf *.o
	rm -f *.tar
	rm -f bfs test-app
	rm -f trace.all trace.f*
	rm -f .csim_results .marker
