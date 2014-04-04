COMPILE_MODE=VANILLA_RUN

CC=g++
CFLAGS=-O3 -MD

INCLUDES=#-I../tools -I../Npu 

LFLAGS=# -L/home/newhall/lib  -L../lib

LIBS=# -lmylib -lm

SRCS=$(wildcard *.c)

# $(name:string1=string2)
# For each word in 'name' replace 'string1' with 'string2'
OBJS=$(SRCS:.c=.o)

OUT_DIR=out
OUT=bench_$(COMPILE_MODE).out

.PHONY: depend clean

all: $(OUT)
	objdump --disassemble $(OUT_DIR)/$(OUT) > $(OUT_DIR)/$(OUT).asm
	readelf --relocs $(OUT_DIR)/$(OUT)

$(OUT): $(OBJS)  
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) $(LFLAGS) $(LIBS) -o $(OUT_DIR)/$(OUT)

# This is a suffix replacement rule for building .o's from .c's.
# It uses 'automatic variables' $<: the name of the prerequisite of
# the rule (a .c file) and $@: the name of the target of the rule
# (a .o file) 
%.o: %.c
	$(CC) -D$(COMPILE_MODE) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) *.o *.d

distclean:
	$(RM) *.o *.d $(OUT_DIR)/*.out $(OUT_DIR)/*.asm 

test:
	$(OUT_DIR)/$(OUT)

