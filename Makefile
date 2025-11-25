CC=gcc
CFLAGS=-DVM_PDP11

SRCS=$(wildcard *.c)
BINS=$(SRCS:%.c=%.o)

all: $(BINS) vax

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

vax: $(BINS)
	$(CC) $(BINS) -lm -o $@

.PHONY: clean nuke
clean:
	$(RM) *.o

nuke:
	$(RM) *.o
	$(RM) vax
