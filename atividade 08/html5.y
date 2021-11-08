/*
	HTML 5 
	Jackson Gomes
*/

%{
#define YYSTYPE double
#include <stdio.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token DOCTYPE A_HTML F_HTML A_HEAD F_HEAD A_BODY F_BODY
%token A_P F_P A_DIV F_DIV
%token A_H1 F_H1 A_H2 F_H2 A_H3 F_H3 A_H4 F_H4 A_H5 F_H5 A_H6 F_H6
%token A_BUTTON F_BUTTON
%token A_UL F_UL A_OL F_OL A_LI F_LI
%token A_A F_A IMG

%%

STATEMENT:
	STATEMENT DOCUMENT { printf("HTML VALIDO!\n");}
	|
	;


DOCUMENT :
	DOCTYPE HTML
	;

HTML : A_HTML HEAD BODY F_HTML
	| A_HTML HEAD F_HTML
	| A_HTML BODY F_HTML
	| A_HTML F_HTML
	;

HEAD : A_HEAD F_HEAD
	;

BODY : A_BODY F_BODY
	| A_BODY TAGLIST F_BODY
	;

TAGLIST : TAG
	| TAG TAGLIST
	;

TAG : P
	| DIV
	| HEADING
	| BUTTON
	| LISTS
	| A
	| IMG
	;

P : A_P F_P
	| A_P TAGLIST F_P
	;

DIV : A_DIV F_DIV
	| A_DIV TAGLIST F_DIV
	;

HEADING : H1
	| H2 
	| H3
	| H4 
	| H5
	| H6 
	;

H1 : A_H1 F_H1 
	| A_H1 TAGLIST F_H1
	;

H2 : A_H2 F_H2 
	| A_H2 TAGLIST F_H2
	; 

H3 : A_H3 F_H3 
	| A_H3 TAGLIST F_H3
	; 

H4 : A_H4 F_H4 
	| A_H4 TAGLIST F_H4
	; 

H5 : A_H5 F_H5 
	| A_H5 TAGLIST F_H5
	; 

H6 : A_H6 F_H6 
	| A_H6 TAGLIST F_H6
	; 

BUTTON : A_BUTTON F_BUTTON
	| A_BUTTON TAGLIST F_BUTTON
	;

LISTS : OL
	| UL
	;

OL : A_OL LILIST F_OL
	| A_OL F_OL
	;

UL : A_UL LILIST F_UL
	| A_UL F_UL
	;

LILIST : LI
	| LI LILIST
	;

LI : A_LI F_LI
	| A_LI TAGLIST F_LI
	;

A : A_A F_A
	| A_A TAGLIST F_A
	;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	yydebug = 0;
	
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
        yyin = fopen(argv[1], "r");
		yyparse();
    }

	return 0;
}
