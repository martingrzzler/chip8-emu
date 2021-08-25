INCLUDES= -I ./include
FLAGS= -g -std=c99

SRC_DIR=./src
BUILD_DIR=./build

SRC_FILES=$(wildcard $(SRC_DIR)/*.c)
OBJECTS=$(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_FILES))


all: ${OBJECTS}
	gcc ${FLAGS} ${INCLUDES} ${OBJECTS} -L ./lib -lmingw32 -lSDL2main -lSDL2 -o ./bin/main 


$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	gcc ${FLAGS} ${INCLUDES} -c $< -o $@


.PHONY: run clean 

clean:
	@del build\*

run: 
	@./bin/main.exe ./bin/INVADERS