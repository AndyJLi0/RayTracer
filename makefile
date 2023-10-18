
CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -g

# Project settings
PROG = main
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
OUTPUT = image.ppm

all: $(PROG)

$(PROG): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(PROG)

# This rule compiles .cpp files to .o files.
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(PROG)
	./$(PROG) > $(OUTPUT)

clean:
	rm -f $(OBJECTS) $(PROG) $(OUTPUT)

.PHONY: all run clean
