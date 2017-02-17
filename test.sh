bison -d superC.y && flex superC.lex && cc superC.tab.c lex.yy.c -o scp && ./scp  < test.c
