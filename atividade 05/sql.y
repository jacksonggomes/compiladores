%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token SELECT FROM WHERE AS
%token AND OR NOT
%token ORDER BY ASC DESC
%token IDENTIFICADOR IDENTIFICADOR_COM_TABELA
%token INTEIRO REAL TEXTO

%token PLUS
%token MINUS
%token DIVIDE

%token ASTERISCO
%token SEPARADOR
%token PARENTESE_ESQ
%token PARENTESE_DIR
%token IGUAL
%token DIFERENTE
%token MENOR
%token MENOR_IGUAL
%token MAIOR
%token MAIOR_IGUAL
%token END

%left OR
%left XOR
%left AND
%left NOT
%left IGUAL DIFERENTE MENOR MENOR_IGUAL MAIOR MAIOR_IGUAL
%left PLUS MINUS
%left DIVIDE ASTERISCO

%nonassoc NEG

%start Input
%%

Input:
	  
	| Input Query END
;

Query:
	Select
;

Select:
	SELECT Campos FROM Tabelas Where OrderBy
;

Campos:
	ASTERISCO
	| Lista_Campos
;

Lista_Campos:
	Identificador
	| Lista_Campos SEPARADOR Identificador
;

Tabelas:
	Tabela
	| Tabelas SEPARADOR Tabela
;

Tabela:
	IDENTIFICADOR
	| IDENTIFICADOR AS IDENTIFICADOR
;

OrderBy:
	| ORDER BY Campos_OrderBy
;

Campos_OrderBy:
	Campo_OrderBy
	| Campos_OrderBy SEPARADOR Campo_OrderBy
;

Campo_OrderBy:
	Identificador
	| Identificador ASC
	| Identificador DESC
;

Where:
	| WHERE Expr
;

Expr:
	Identificador
	| INTEIRO		
	| REAL
	| TEXTO
	| PARENTESE_ESQ Expr PARENTESE_DIR
	| Expr Bool_op Expr
	| Expr Comp_op Expr	
	| Expr Add_op Expr
	| Expr Mult_op Expr
	| MINUS Expr %prec NEG
	| NOT Expr	
	| Expr Comp_op PARENTESE_ESQ Select PARENTESE_DIR
;

Bool_op:
	AND
	| OR
	| XOR
;

Comp_op:
	IGUAL
	| DIFERENTE
	| MENOR
	| MENOR_IGUAL
	| MAIOR
	| MAIOR_IGUAL
;

Add_op:
	PLUS
	| MINUS
;

Mult_op:
	ASTERISCO
	| DIVIDE
;

Identificador:
	IDENTIFICADOR
	| IDENTIFICADOR_COM_TABELA
;
		
%%

extern int 	yylineno;	
extern char 	*yytext;

void yyerror(char *s) {
	printf("%s. Linha: %d. Token não esperado: %s\n", s, yylineno, yytext);
}

int main(int argc, char **argv) {
	extern FILE *yyin;

	if(argc > 1 && (yyin = fopen(argv[1], "r")) == NULL) {
		perror(argv[1]);
		exit(1);
	}

	if(!yyparse())
		printf("Todas as cláusulas SQL são válidas!\n");
	else
		printf("Existem erros de SQL.\n");
}
