%{
#include<stdio.h>
#include<stdlib.h>
#include "sintactico.tab.h"

%}
/*
Analizador Lexico
*/
letras	[a-zA-Z]
digito	[0-9]
espacio [-]


%%

[>]{2}[<]{1}	{return INT;}
[<]{2}[>]{1}	{return CHAR;}
[+]{3}		{return INC;}
[+]{2}		{return SUMA;}
[-]{2}		{return RESTA;}
[-]{3}		{return DEC;}
[-][>]		{return ASING;}
[+][>]		{return MAYORQ;}
[+][<]		{return MENORQ;}
[<][>]		{return IGUAL;}
[&][<]		{return AND;}
[|][<]		{return OR;}
[!][<]		{return NOT;}
[+][|][+]	{return CONCAT;}
[-]{1}		{return espacio;}
[1-9]+	{yylval=atoi(yytext); return NUMERO;}
{letras}+	{return ID;}
{letras}+{digito}* {return ID;}
[>]{3}		{return FOR;}
[>][<]    {return IF;}
[>][-][<] {return ELSE;}
[\n]	{return '\n';}
[?]	{return SALIDA;}
%%
