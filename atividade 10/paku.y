%{

#include <stdio.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
extern int yylineno;

%}

%token PLUS MINUS DIVIDE TIMES ATRIBUITION IDENTIFIER TYPE NUMBER EOL END
%token P_LEFT P_RIGHT

%left P_LEFT P_RIGHT
%left PLUS MINUS
%left TIMES DIVIDE

%%

PROGRAM:
    STATEMENT END{YYACCEPT;}
    ;

STATEMENT:
    LINE
    | STATEMENT STATEMENT
    ;

LINE:
    ATTRIBUTION
    | FUNCTION
    | DECLARATION
    | EOL
    ;

ATTRIBUTION:
    IDENTIFIER ATRIBUITION CALC EOL
    | IDENTIFIER ATRIBUITION IDENTIFIER_CALC EOL
    ;
    
    
FUNCTION:
    IDENTIFIER P_LEFT IDENTIFIER P_RIGHT EOL
    ;
 
DECLARATION:
    TYPE IDENTIFIER EOL
    ;
    
CALC:
    NUMBER
    | CALC PLUS CALC
    | CALC MINUS CALC
    | CALC DIVIDE CALC
    | CALC TIMES CALC
    | P_LEFT CALC P_RIGHT
    ;

IDENTIFIER_CALC:
    IDENTIFIER PLUS IDENTIFIER
    | IDENTIFIER MINUS IDENTIFIER
    | IDENTIFIER DIVIDE IDENTIFIER
    | IDENTIFIER TIMES IDENTIFIER
    ;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
	printf("Line: %d\n", yylineno);
}

int main(int argc, char *argv[])
{
    int result;
    yyin = fopen(argv[1], "r");
    result = yyparse();
    if (result == 0){
        printf("Correct entry\n");
    }
	return 0;
}
