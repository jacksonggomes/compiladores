/*
	HTML 5 
	Jackson Gomes
*/
%option caseless
%{
#define YYSTYPE double
#include "html5.tab.h" 
#include <stdlib.h>

%}

%%

"<!DOCTYPE html>"         { return DOCTYPE; }
"<html>"                  { return A_HTML; }
"</html>"                 { return F_HTML; }
"<head>"                  { return A_HEAD; }
"</head>"                 { return F_HEAD; }
"<body>"                  { return A_BODY; }
"<p>"                     { return A_P; }
"</p>"                    { return F_P; }
"<div>"                   { return A_DIV; }
"</div>"                  { return F_DIV; }
"<h1>"                    { return A_H1; }
"</h1>"                   { return F_H1; }
"<h2>"                    { return A_H2; }
"</h2>"                   { return F_H2; }
"<h3>"                    { return A_H3; }
"</h3>"                   { return F_H3; }
"<h4>"                    { return A_H4; }
"</h4>"                   { return F_H4; }
"<h5>"                    { return A_H5; }
"</h5>"                   { return F_H5; }
"<h6>"                    { return A_H6; }
"</h6>"                   { return F_H6; }
"<button>"                { return A_BUTTON; }
"</button>"               { return F_BUTTON; }
"<ul>"                    { return A_UL; }
"</ul>"                   { return F_UL; }
"<ol>"                    { return A_OL; }
"</ol>"                   { return F_OL; }
"<li>"                    { return A_LI; }
"</li>"                   { return F_LI; }
"<a"                      { return A_A; }
"</a>"                    { return F_A; }
"<img"                    { return IMG; }
[[:space:]]			  ;
"</body>"                 { return F_BODY; }

.					  ; /*{ printf("palavra: \"%s\"\n", yytext);} */

%%

int yywrap()
{
	return 1;
}

