# Compiler settings - Can be customized.
CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -g

# Project settings
PROG = main
MAIN_SOURCE = main.cpp
OBJECTS = $(MAIN_SOURCE:.cpp=.o)

all: $(PROG)

$(PROG): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(PROG)

# This rule compiles .cpp files to .o files.
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(PROG)
	./$(PROG) > image.ppm

clean:
	rm -f $(OBJECTS) $(PROG) *.ppm

.PHONY: all run clean
