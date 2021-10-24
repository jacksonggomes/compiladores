/*
	Usando seus conhecimentos em Flex/Bison, desenvolva um analisador sintático simples para a linguagem SQL.
	Jackson Gomes
*/

%option yylineno
%{
#define YYSTYPE double
#include "sql.tab.h"
#include <stdlib.h>

#define ERRO 1
%}

T_BRANCO		[ \t\r]+

T_SELECT		(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)	
T_FROM			(F|f)(R|r)(O|o)(M|m)
T_WHERE			(W|w)(H|h)(E|e)(R|r)(E|e)
T_AS			(A|a)(S|s)

T_AND			(A|a)(N|n)(D|d)
T_OR			(O|o)(R|r)
T_NOT			(N|n)(O|o)(T|t)
T_XOR			(X|x)(O|o)(R|r)

T_ORDER			(O|o)(R|r)(D|d)(E|e)(R|r)	
T_BY			(B|b)(Y|y)
T_ASC			(A|a)(S|s)(C|c)
T_DESC		        (D|d)(E|e)(S|s)(C|c)

T_NOME			[A-Za-z][A-Za-z0-9_]*
T_TABELA_NOME		{T_NOME}\.{T_NOME}

T_DIGITO		[0-9]

T_PARAMETRO_INTEIRO	{T_DIGITO}+
T_PARAMETRO_REAL	{T_PARAMETRO_INTEIRO}(\.{T_PARAMETRO_INTEIRO})?
T_PARAMETRO_STRING	\'.*\'

%%

{T_BRANCO} 		{ }

{T_SELECT}		return SELECT;
{T_FROM}		return FROM;
{T_WHERE}		return WHERE;
{T_AS}			return AS;

{T_AND}			return AND;
{T_OR}			return OR;
{T_NOT}			return NOT;
{T_XOR}			return XOR;

{T_ORDER}		return ORDER;
{T_BY}			return BY;
{T_ASC}			return ASC;
{T_DESC}		return DESC;

{T_NOME}		return IDENTIFICADOR;			
{T_TABELA_NOME}		return IDENTIFICADOR_COM_TABELA;

{T_PARAMETRO_INTEIRO}	return INTEIRO;
{T_PARAMETRO_REAL}	return REAL;
{T_PARAMETRO_STRING}	return TEXTO;

"+" 			return PLUS;
"-" 			return MINUS;
"/" 			return DIVIDE;
"*"			return ASTERISCO;
","			return SEPARADOR;
"("			return PARENTESE_ESQ;
")"			return PARENTESE_DIR;
"="			return IGUAL;
"<>"			return DIFERENTE;
"<"			return MENOR;
"<="			return MENOR_IGUAL;
">"			return MAIOR;
">="			return MAIOR_IGUAL;
";"			return END;
"\n" 			{}
.			{printf("\nToken Inválido: %s\n", yytext); return(ERRO);}
