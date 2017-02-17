DIGIT			[0-9]
CHAR			[a-zA-Z_]
HEX			0[xX]([a-fA-F0-9])+
BIN			0[bB]([0,1])+
FLOATING		[+-]?{DIGIT}+(\.{DIGIT}+)?([Ee][+-]?{DIGIT}+)?

MULTILINE_COMMENT 	\/\*([^*]|(\*+[^*/]))*\*+\/
SINGLELINE_COMMENT      \/\/.*\n
COMMENT                 {MULTILINE_COMMENT}|{SINGLELINE_COMMENT}
STRING 			L?\"(\\.|[^\\"])*\"
%{
#include <stdio.h>
#include "superC.tab.h"
%}

%%

"import"		 { return IMPORT; }
"from"			 { return FROM; }
"as"			 { return AS; }

"char"		 	 { return CHAR; }
"double"	     	 { return DOUBLE; }
"float"			 { return FLOAT; }
"int"			 { return INT; }
"int8_t" 		 { return INT8; }
"int16_t" 		 { return INT16; }
"int32_t" 		 { return INT32; }
"int64_t" 		 { return INT64; }
"long"			 { return LONG; }
"short"			 { return SHORT; }
"signed"		 { return SIGNED; }
"uint8_t" 		 { return UINT8; }
"uint16_t" 		 { return UINT16; }
"uint32_t" 		 { return UINT32; }
"uint64_t" 		 { return UINT64; }
"unsigned"		 { return UNSIGNED; }
"void"			 { return VOID; }

"class"  		 { return CLASS; }
"interface"  		 { return INTERFACE; }
"extends"  		 { return EXTENDS; }
"implements"  		 { return IMPLEMENTS; }
"static"  		 { return STATIC; }
"super"  		 { return SUPER; }
"public"  		 { return PUBLIC; }
"private"  		 { return PRIVATE; }
"protected"  		 { return PROTECTED; }

"else"			 { return ELSE; }
"if"			 { return IF; }

"return"		 { return RETURN; }

"while"			 { return WHILE; }
"do"  		 	 { return DO; }
"for"	  		 { return FOR; }
"break"  		 { return BREAK; }

{STRING}		 { return STRING; }
{COMMENT}		 { return COMMENT; }
{HEX}			 { return HEX; }
[-+]?{DIGIT}+  	 	 { return NUMBER; }
{FLOATING}[fF]?		 { return FLOAT; }
{BIN}    	 	 { return BIN; }
{CHAR}({CHAR}|{DIGIT})*  { return ID; }

"+="			 { return ADD_ASSIGN; }
"-="			 { return SUB_ASSIGN; }
"*="			 { return MUL_ASSIGN; }
"/="			 { return DIV_ASSIGN; }
"++"			 { return INC_OP; }
"--"			 { return DEC_OP; }
"<="			 { return LE_OP; }
">="			 { return GE_OP; }
"=="			 { return EQ_OP; }
"!="			 { return NE_OP; }
";"			 { return ';'; }
"{"			 { return '{'; }
"}"			 { return '}'; }
","			 { return ','; }
":"			 { return ':'; }
"="			 { return '='; }
"("			 { return '('; }
")"			 { return ')'; }
"["			 { return '['; }
"]"			 { return ']'; }
"."			 { return '.'; }
"&"			 { return '&'; }
"!"			 { return '!'; }
"-"			 { return '-'; }
"+"			 { return '+'; }
"*"			 { return '*'; }
"/"			 { return '/'; }
"%"			 { return '%'; }
"<"			 { return '<'; }
">"			 { return '>'; }

[\t\v\f' ']		 { }
.			 { return ERROR; }


