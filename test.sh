rm -rf superC && bison -d -o parser.cpp superC.y  && flex -o lexer.cpp superC.lex  && clang++ lexer.cpp parser.cpp main.cpp  --std=c++11 -o  superC && ./superC test.c 
