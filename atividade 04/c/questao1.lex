%{ 
	/* Exemplo de uso do Flex com C*/
%}

DIGITO [0-9]
IDENTIFICADOR [a-z][a-z0-9]+ 
PALAVRA [a-zA-Z]+

%%
{DIGITO}+               {printf("Um inteiro: %s (%d)\n", yytext, atoi(yytext));}      
{DIGITO}+"."{DIGITO}*   {printf("Numero real: %s (%g)\n", yytext, atof(yytext));}     
if|else|main|printf|function|return|include|argc|argv|char|int|float {printf("Palavra chave: %s\n", yytext);}      
{IDENTIFICADOR}   {printf("Um identificador: %s\n", yytext);}
{PALAVRA}         printf("Voce escreveu uma palavra: \"%s\"\n", yytext);
"+"|"-"|"*"|"/"   printf("Um operador matematico: %s\n", yytext);  
"{"[^}\n]*"}";    /* Tira comentario */     
[ \t\n]+   ;      /* Tira espaco em branco */      
";"               printf("Voce escreveu uma ponto e virgula: \"%s\"\n", yytext);
"{"|"}"           printf("Voce escreveu uma chave: \"%s\"\n", yytext);
"("|")"           printf("Voce escreveu um parentese: \"%s\"\n", yytext);
"["|"]"           printf("Voce escreveu um colchete: \"%s\"\n", yytext);
"<"|">"			  printf("Voce escreveu maior ou menor: \"%s\"\n", yytext);
"\'"|"\'"           printf("Voce escreveu aspas simples: \"%s\"\n", yytext);
"\""|"\""           printf("Voce escreveu aspas duplas \"%s\"\n", yytext);
"#"				  printf("Voce escreveu cerquilha: \"%s\"\n", yytext);
.                 printf("Nao reconhecido: \"%s\"\n", yytext);


%%

int main(int argc, char *argv[])      
{                             
   	++argv, --argc;  /* skip over program name */                            
	if (argc > 0)                               
	    yyin = fopen(argv[0], "r");                            
	else                                       
		yyin = stdin;                             
	yylex();      
}  