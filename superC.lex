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
#define printf putchar(' ');printf
void comment();
%}

%%

"import"		 { printf("IMPORT"); }
"from"			 { printf("FROM"); }
"as"			 { printf("AS"); }

"char"		 	 { printf("CHAR"); }
"double"	     	 { printf("DOUBLE"); }
"float"			 { printf("FLOAT"); }
"int"			 { printf("INT"); }
"int8_t" 		 { printf("INT8"); }
"int16_t" 		 { printf("INT16"); }
"int32_t" 		 { printf("INT32"); }
"int64_t" 		 { printf("INT64"); }
"long"			 { printf("LONG"); }
"short"			 { printf("SHORT"); }
"signed"		 { printf("SIGNED"); }
"uint8_t" 		 { printf("UINT8"); }
"uint16_t" 		 { printf("UINT16"); }
"uint32_t" 		 { printf("UINT32"); }
"uint64_t" 		 { printf("UINT64"); }
"unsigned"		 { printf("UNSIGNED"); }
"void"			 { printf("VOID"); }

"class"  		 { printf("CLASS"); }
"interface"  		 { printf("INTERFACE"); }
"extends"  		 { printf("EXTENDS"); }
"implements"  		 { printf("IMPLEMENTS"); }
"static"  		 { printf("STATIC"); }
"super"  		 { printf("SUPER"); }
"public"  		 { printf("PUBLIC"); }
"private"  		 { printf("PRIVATE"); }
"protected"  		 { printf("PROTECTED"); }

"else"			 { printf("ELSE"); }
"if"			 { printf("IF"); }

"return"		 { printf("RETURN"); }

"while"			 { printf("WHILE"); }
"do"  		 	 { printf("DO"); }
"for"	  		 { printf("FOR"); }
"break"  		 { printf("BREAK"); }

{STRING}		 { printf("STRING:%s",yytext); }
{COMMENT}		 { printf("COMMENT:%s", yytext); }
{HEX}			 { printf("HEX:%s",yytext); }
[-+]?{DIGIT}+  	 	 { printf("NUMBER:%s",yytext); }
{FLOATING}[fF]?		 { printf("FLOAT:%s",yytext); }
{BIN}    	 	 { printf("BIN:%s",yytext); }
{CHAR}({CHAR}|{DIGIT})*  { printf("ID:%s",yytext); }

">>="			 { printf("RIGHT_ASSIGN"); }
"<<="			 { printf("LEFT_ASSIGN"); }
"+="			 { printf("ADD_ASSIGN"); }
"-="			 { printf("SUB_ASSIGN"); }
"*="			 { printf("MUL_ASSIGN"); }
"/="			 { printf("DIV_ASSIGN"); }
">>"			 { printf("RIGHT_OP"); }
"<<"			 { printf("LEFT_OP"); }
"++"			 { printf("INC_OP"); }
"--"			 { printf("DEC_OP"); }
"<="			 { printf("LE_OP"); }
">="			 { printf("GE_OP"); }
"=="			 { printf("EQ_OP"); }
"!="			 { printf("NE_OP"); }
";"			 { printf(";"); }
"{"			 { printf("{"); }
"}"			 { printf("}"); }
","			 { printf(","); }
":"			 { printf(":"); }
"="			 { printf("="); }
"("			 { printf("("); }
")"			 { printf(")"); }
"["			 { printf("["); }
"]"			 { printf("]"); }
"."			 { printf("."); }
"&"			 { printf("&"); }
"!"			 { printf("!"); }
"-"			 { printf("-"); }
"+"			 { printf("+"); }
"*"			 { printf("*"); }
"/"			 { printf("/"); }
"%"			 { printf("%s", "%"); }
"<"			 { printf("<"); }
">"			 { printf(">"); }
"^"			 { printf("^"); }
"|"			 { printf("|"); }
"?"			 { printf("?"); }

(\n)([\t\v\f]?\n)*	 { printf("\n"); }
[\t\v\f]		 { }
.			 { }

%%

int yywrap()
{
	return(1);
}

int main(){
  yylex();
  putchar('\n');
}
