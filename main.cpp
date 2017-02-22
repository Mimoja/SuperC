#include <iostream>
#include <stdio.h>
#include "workunits.h"

using namespace std;

extern int yyparse();
extern Node* root;
extern FILE* yyin;

void createCoreFunctions(CodeGenContext& context);

int main(int argc, char **argv){
	if(argc > 1){
        char* file = argv[1];
		yyin = fopen(file, "r");
        if ( !yyin ){
           printf("Could not open %s\n", file);
        }
	}
	yyparse();
	printf("Program AST: \n");
	root->writeAST();

	return 0;
}

