CC := g++
FLAGS := -std=c++11 -w
INC_DIR := include
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin
TEST_DIR := test
INCLUDE := -I./$(INC_DIR)
GMP_DIR := gmp-build
LIB := -L./lib -lgmp

$(BIN_DIR)/main: $(BUILD_DIR)/main.o $(BUILD_DIR)/Int.o $(BUILD_DIR)/Rsa.o $(BUILD_DIR)/OctetString.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(FLAGS) $(INCLUDE) $(LIB) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(FLAGS) $(INCLUDE) $(LIB) -c -o $@ $<

.PHONY: clean


clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(BIN_DIR)