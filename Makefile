EXEC = bin-swap bin-bubble  bin-merge
.PHONY: all
.PRECIOUS: %.o
all: $(EXEC)

CC ?= gcc
CFLAGS = -std=gnu99 -Wall -O2 -g
LDFLAGS =

OBJS := \
	swap.o \
	bubble.o \
	merge.o \
	stub.o \
	_tmpm.gdb \
	_tmpb.gdb \
	_tmp.gdb

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

bin-%: %.o stub.o
	$(CC) -o $@ $^ $(LDFLAGS)

check: $(EXEC)
	bash test-swap.sh data-swap.in result-swap
	bash test-bubble.sh data-bubble.in result-bubble
	bash test-merge.sh data-merge.in result-merge	

astyle:
	astyle --style=kr --indent=spaces=4 --indent-switches --suffix=none *.[ch]

clean:
	$(RM) $(EXEC) $(OBJS) result-bubble result-swap result-merge
