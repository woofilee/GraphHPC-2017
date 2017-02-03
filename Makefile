CC		:= g++
# CFLAGS	:= -g -Wall -std=c++17
CFLAGS	:= -g -Wall -std=c++11 # unfortunately

SRC		:= src
BIN		:= bin
BUILD	:= build
INCLUDE	:= include
LIB		:= lib

# TARGET	:= $(BIN)/solution
TARGET	:= solution

INCS	:= -I $(INCLUDE)
LIBS	:= -L $(LIB)

EXT		:= cpp

SOURCES	:= $(shell find $(SRC) -type f -name *.$(EXT))
OBJECTS	:= $(patsubst $(SRC)/%,$(BUILD)/%,$(SOURCES:.$(EXT)=.o))

$(TARGET): $(OBJECTS)
	$(CC) $^ -o $(TARGET) $(INCS) $(LIBS)

$(BUILD)/%.o: $(SRC)/%.$(EXT)
	@mkdir -p $(BUILD)
	$(CC) -c -o $@ $< $(CFLAGS) $(INCS) 

clean:
	@rm -r $(BUILD)/*
	@rm -r $(BIN)/*

.PHONY: clean
