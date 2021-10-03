%{      
   /*Exemplo uso do Flex com Pascal*/    
%}   
DIGITO    [0-9]      
ID       [a-z][a-z0-9]*  
PALAVRA [a-zA-Z]+

%%      
{DIGITO}+ {
            printf("Inteiro: %s (%d)\n", yytext,atoi(yytext));                               
         }      
{DIGITO}+"."{DIGITO}* {
                        printf("Float: %s (%g)\n", yytext, atof(yytext));                                 
                     }     
if|then|begin|end|procedure|function|read|write|writeln|var {
                                       printf("Palavra chave:%s\n",yytext);
                                     }  
{PALAVRA}         printf("Voce escreveu uma palavra: \"%s\"\n", yytext);    
{ID}                       printf("Identificador: %s\n", yytext); 
"+"|"-"|"*"|"/"            printf("Operador: %s\n", yytext);  
"{"[^}\n]*"}"             ;   /* eat up one-line comments */     
[ \t\n]+                  ;   /* eat up white space */ 
["//"]*     printf("Comentário: %s\n", yytext); 
"(.*?)"     printf("String: %s\n", yytext);
"{"|"}"                       printf("Chaves: %s\n", yytext); 
"("|")"                       printf("Parenteses: %s\n", yytext); 
";"                           printf("Ponto e virgula: %s\n", yytext);  
":"                           printf("Dois pontos: %s\n", yytext);  
":="                           printf("Atribuição: %s\n", yytext);
.                             printf("Nao reconhecido: %s\n", yytext);  

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