
%{
#include <stdio.h>
int yylex(); 
int yyerror(const char *p) { printf("Error: %s", p); return 1;}
%}

%token IMPORT FROM AS

%token CHAR DOUBLE FLOAT INT INT8 INT16 INT32 INT64 LONG
%token SHORT SIGNED UINT8 UINT16 UINT32 UINT64 UNSIGNED VOID

%token CLASS INTERFACE EXTENDS IMPLEMENTS STATIC SUPER PUBLIC PRIVATE PROTECTED

%token ELSE IF

%token RETURN

%token WHILE DO FOR BREAK

%token INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token SUB_ASSIGN

%token STRING COMMENT HEX NUMBER BIN ID

%token ERROR

%%
start
	: import start
	| definition start
	;

import 
	: IMPORT ID FROM STRING           { printf("import"); }
	| IMPORT ID FROM STRING AS ID     { printf("import as"); }
	;

definition
	: class_definition     
	/*| function_definition
        | interface_definition
	| variable_definition
	| definition definition*/
	;

class_definition     
	: CLASS ID			{ printf("class definiton"); }
	;


%%

int yywrap()
{
	return(1);
}

int main()
{
  yyparse();
  return 0;
}