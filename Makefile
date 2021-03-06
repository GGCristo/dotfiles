# Makefile génerico si un cpp solo depende de su header, si un un cpp depende de varios headers habra que crear una regla especial para él.
BIN = main
TEST = $(wildcard test/*.cpp)
TESTBIN = $(patsubst test/%.cpp, bin/%, $(TEST))
SRC = $(wildcard src/*.cpp)
SRC := $(filter-out src/main.cpp , $(SRC))
OBJS = $(patsubst src/%.cpp, build/%.o, $(SRC))
HEADER = #Escribe aquí el nombre de las clases o fichero de funciones con template
HEADER := $(patsubst %, include/%.hpp, $(HEADER))
CFLAGS = -g -pedantic-errors -Wall -Wextra  -std=c++17 -fsanitize=address -static-libasan

.PHONY: all
all: $(OBJS)
	mkdir -p bin
	g++ src/main.cpp $? -o bin/$(BIN)

.PHONY: SFML
SFML: $(OBJS)
	g++ src/main.cpp $? -o bin/$(BIN) -lsfml-graphics -lsfml-window -lsfml-system

.PHONY: run
run:
	./bin/$(BIN)

.PHONY: debug
debug:
	g++ $(CFLAGS) src/* $(HEADER) -o bin/$(BIN)

.PHONY: clean
clean:
	@rm bin/* build/*.o 2>/dev/null || true

.PHONY: test
test: $(TESTBIN)
	./bin/test

bin/%: test/%.cpp test/catch.hpp $(SRC)
	mkdir -p bin
	g++ -std=c++11 $(SRC) $< -o $@

#build/NOMBRE.o: src/NOMBRE.cpp include/NOMBRE.hpp include/NOMBRE.hpp
	#g++ -c $< -o $@
###################################################################

###################################################################

build/$(BIN).o: src/$(BIN).cpp $(HEADER)
	g++ -c $< -o $@

build/%.o: src/%.cpp include/%.hpp
	g++ -c $< -o $@

build/%.o: src/%.cpp
	g++ -c $< -o $@
