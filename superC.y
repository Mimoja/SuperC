
%{
	#include "workunits.h"
	#include <stdio.h>
	int yylex(); 
	int yyerror(const char *p) { printf("Error: %s  \n", p ); return 1;}
	ProgramNode* root = new ProgramNode();

%}

%union {
	Node *node;
	ImportNode *importNode;
	char *string;
	int token;
}

%token <token> IMPORT FROM AS

%token <token> CHAR DOUBLE FLOAT INT INT8 INT16 INT32 INT64 LONG
%token <token> SHORT SIGNED UINT8 UINT16 UINT32 UINT64 UNSIGNED VOID

%token <token> CLASS INTERFACE EXTENDS IMPLEMENTS STATIC SUPER PUBLIC PRIVATE PROTECTED

%token <token> ELSE IF

%token <token> RETURN

%token <token> WHILE DO FOR BREAK

%token <token> INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token <token> AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token <token> SUB_ASSIGN

%token <string> STRING COMMENT HEX NUMBER FLOATING BIN ID


%start program

%%

import_extension
	:							  { $<string>$ = 0; }
	| AS ID    					  { $<string>$ = $2; }
	;

import_statement
	: IMPORT ID FROM STRING import_extension ';'  { $<importNode>$ = new ImportNode($<string>2, $<string>4, $<string>5); }
	;

import_unit
	: import_statement 				{ root->imports.push_back($<importNode>1); }
	| import_unit import_unit
	;


program
	: import_unit					{ }
	;				


%%
