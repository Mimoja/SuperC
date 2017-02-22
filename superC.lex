DIGIT			[0-9]
CHAR			[a-zA-Z_]
HEX				0[xX]([a-fA-F0-9])+
BIN				0[bB]([0,1])+
FLOATING		[+-]?{DIGIT}+(\.{DIGIT}+)?([Ee][+-]?{DIGIT}+)?

MULTILINE_COMMENT 		\/\*([^*]|(\*+[^*/]))*\*+\/
SINGLELINE_COMMENT      \/\/.*\n
COMMENT                 {MULTILINE_COMMENT}|{SINGLELINE_COMMENT}
STRING 					L?\"(\\.|[^\\"])*\"

%{
#include <stdio.h>
#include "workunits.h"
#include "parser.hpp"


#define RETURN_STRING(tok)  (yylval.string = strdup(yytext)); return tok;
#define RETURN_TOKEN(tok)    return (yylval.token = tok)
%}


%option noyywrap

%%

"import"				 { RETURN_TOKEN(IMPORT); }
"from"					 { RETURN_TOKEN(FROM); }
"as"					 { RETURN_TOKEN(AS); }

"char"		 			 { RETURN_TOKEN(CHAR); }
"double"	   			 { RETURN_TOKEN(DOUBLE); }
"float"					 { RETURN_TOKEN(FLOAT); }
"int"					 { RETURN_TOKEN(INT); }
"int8_t" 				 { RETURN_TOKEN(INT8); }
"int16_t" 				 { RETURN_TOKEN(INT16); }
"int32_t" 				 { RETURN_TOKEN(INT32); }
"int64_t" 				 { RETURN_TOKEN(INT64); }
"long"					 { RETURN_TOKEN(LONG); }
"short"					 { RETURN_TOKEN(SHORT); }
"signed"				 { RETURN_TOKEN(SIGNED); }
"uint8_t" 				 { RETURN_TOKEN(UINT8); }
"uint16_t" 				 { RETURN_TOKEN(UINT16); }
"uint32_t" 				 { RETURN_TOKEN(UINT32); }
"uint64_t" 				 { RETURN_TOKEN(UINT64); }
"unsigned"				 { RETURN_TOKEN(UNSIGNED); }
"void"					 { RETURN_TOKEN(VOID); }

"class"  				 { RETURN_TOKEN(CLASS); }
"interface"     		 { RETURN_TOKEN(INTERFACE); }
"extends"  				 { RETURN_TOKEN(EXTENDS); }
"implements"  			 { RETURN_TOKEN(IMPLEMENTS); }
"static"  				 { RETURN_TOKEN(STATIC); }
"super"  				 { RETURN_TOKEN(SUPER); }
"public"  				 { RETURN_TOKEN(PUBLIC); }
"private"  				 { RETURN_TOKEN(PRIVATE); }
"protected"     		 { RETURN_TOKEN(PROTECTED); }

"else"					 { RETURN_TOKEN(ELSE); }
"if"					 { RETURN_TOKEN(IF); }

"return"				 { RETURN_TOKEN(RETURN); }

"while"					 { RETURN_TOKEN(WHILE); }
"do"  		 			 { RETURN_TOKEN(DO); }
"for"	  				 { RETURN_TOKEN(FOR); }
"break"  		 		 { RETURN_TOKEN(BREAK); }

{STRING}		 		 { RETURN_STRING(STRING); }
{COMMENT}		 		 { RETURN_STRING(COMMENT); }
{HEX}			 		 { RETURN_STRING(HEX); }
[-+]?{DIGIT}+  	 		 { RETURN_STRING(NUMBER); }
{FLOATING}[fF]?	 		 { RETURN_STRING(FLOATING); }
{BIN}    	 	 		 { RETURN_STRING(BIN); }
{CHAR}({CHAR}|{DIGIT})*  { RETURN_STRING(ID); }

"+="					 { RETURN_TOKEN(ADD_ASSIGN); }
"-="					 { RETURN_TOKEN(SUB_ASSIGN); }
"*="		 			 { RETURN_TOKEN(MUL_ASSIGN); }
"/="					 { RETURN_TOKEN(DIV_ASSIGN); }
"++"					 { RETURN_TOKEN(INC_OP); }
"--"		 		 	 { RETURN_TOKEN(DEC_OP); }
"<="					 { RETURN_TOKEN(LE_OP); }
">="					 { RETURN_TOKEN(GE_OP); }
"=="					 { RETURN_TOKEN(EQ_OP); }
"!="					 { RETURN_TOKEN(NE_OP); }
";"						 { RETURN_TOKEN(';'); }
"{"						 { RETURN_TOKEN('{'); }
"}"						 { RETURN_TOKEN('}'); }
","						 { RETURN_TOKEN(','); }
":"						 { RETURN_TOKEN(':'); }
"="						 { RETURN_TOKEN('='); }
"("						 { RETURN_TOKEN('('); }
")"						 { RETURN_TOKEN(')'); }
"["						 { RETURN_TOKEN('['); }
"]"						 { RETURN_TOKEN(']'); }
"."						 { RETURN_TOKEN('.'); }
"&"						 { RETURN_TOKEN('&'); }
"!"						 { RETURN_TOKEN('!'); }
"-"						 { RETURN_TOKEN('-'); }
"+"						 { RETURN_TOKEN('+'); }
"*"						 { RETURN_TOKEN('*'); }
"/"						 { RETURN_TOKEN('/'); }
"%"						 { RETURN_TOKEN('%'); }
"<"						 { RETURN_TOKEN('<'); }
">"						 { RETURN_TOKEN('>'); }

[\t\v\f' ']	 			 { }
.			 			 { printf("Unknown token!\n"); yyterminate(); }

%%
