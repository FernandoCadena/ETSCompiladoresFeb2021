%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(char *mensaje)
{
	printf("ERROR: %s\n", mensaje);
	exit(0);
}
%}

%token NUMERO
%token INT
%token CHAR
%token INC
%token SUMA
%token RESTA
%token DEC
%token ASING
%token MAYORQ
%token MENORQ
%token IGUAL
%token AND
%token OR
%token NOT
%token CONCAT
%token espacio
%token ID
%token FOR
%token IF
%token ELSE
%token SALIDA

%%

programa: ;

programa: programa linea;

linea: '\n';

linea: operacion '\n'			{printf("resultado = %d", $1);};

linea: SALIDA '\n'			{printf("salir...");exit(0);};

linea: expresion '\n';	

operacion: suma|resta|comparacion|logico '\n';	

logico:and|not|or ;

and:IF ID AND ID				{ printf("Comparacion con AND\n");};

not: IF ID NOT ID				{printf("Comparacion con NOT\n");};

or: IF ID OR ID  	 			{printf("SUMA detectada\n");};

suma: NUMERO SUMA NUMERO 			{ printf("SUMA detectada\n");};

resta: NUMERO RESTA NUMERO			{ printf("RESTA detectada\n");};

comparacion: mayorque|menorque;

mayorque: NUMERO MAYORQ NUMERO		{ printf("Comparacion detectada\n");};

menorque: NUMERO MENORQ NUMERO		{ printf("Comparacion detectada\n");};

expresion: declaracion|asignacion|cadena;

declaracion: asignacion|cadena'\n';

asignacion: INT ID ASING NUMERO		{printf("Declaracion de variable\n");};

cadena: ID CONCAT ID 				{printf("Concatenacion detectada\n");};

cadena: ID				
%%
