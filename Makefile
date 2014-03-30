# mod_sleep Makefile
# author: unksato
# Update date: 2014/3/31

# 
builddir=.
BUILD_FLAGS=-O2 -fPIC -Wall

# build tools
APXS=apxs2
CC=gcc
AR=ar

OBJS = mod_sleep.o

mod_sleep: $(OBJS)
	$(CC) -shared -o mod_sleep.so $(OBJS)

.c.o:
	$(CC) -c -I$(OPENSSL_INCLUDE_DIR) $< $(BUILD_FLAGS)

mod_%.o: mod_%.c
	$(APXS) -c $< $(BUILD_FLAGS) -o $@

.o.a:
	$(AR) r $@ $^
	ranlib $@

all: mod_sleep

# cleanup
clean:
	-rm -f *.o *.lo *.slo *.la *.a *.so *.out
