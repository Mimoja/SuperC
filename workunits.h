#include <iostream>
#include <vector>
#include <string> 

class CodeGenContext;
class NStatement;
class NExpression;
class NVariableDeclaration;

typedef std::vector<NStatement*> StatementList;
typedef std::vector<NExpression*> ExpressionList;
typedef std::vector<NVariableDeclaration*> VariableList;

class Node {
public:
	Node(){}
    ~Node() {}
	virtual void writeAST(){ printf("Empty Node");}
};

class ImportNode : public Node {
public:
	char* import;
	char* source;
	char* as;
	ImportNode(char* Import, char* Source, char* As) : import(Import), source(Source), as(As) {}
	void writeAST(){
		 printf("Import %s from %s", import, source);
		 if(as != 0)printf(" as %s\n", as);
		 else printf("\n");
	}

};


class ProgramNode : public Node {
public:
	std::vector<ImportNode*> imports;
	ProgramNode() :  imports() { }
	void writeAST(){
		printf( "Program Node with %d imports\n", (int) imports.size());
		for(ImportNode* imp : imports){
			imp->writeAST();
		}
	}
};

