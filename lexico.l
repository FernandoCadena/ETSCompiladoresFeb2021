
/*
Analizador Lexico
*/
letras	[a-zA-Z]
digitos	[0-9]
espacio [-]

%%
[>]{2}[<]{1}	{printf("int");}
[<]{2}[>]{1}	{printf("char");}
[+]{3}		{printf("incremento");}
[+]{2}		{printf("suma");}
[-]{2}		{printf("resta");}
[-]{3}		{printf("decremento");}
[-][>]		{printf("asignacion");}
[+][>]		{printf("mayor-que");}
[+][<]		{printf("menor-que");}
[<][>]		{printf("igual");}
[&][<]		{printf("and");}
[|][<]		{printf("or");}
[!][<]		{printf("not");}
[+][|][+]	{printf("concatenacion");}
[-]{1}		{printf("espacio");}
[1-9]{digito}*	{printf("CONSTANTE");}
{letras}+	{printf("ID");}
{letras}+{digito}* {printf("ID");}
[>]{3}		{printf("for");}
[>][<]    {printf("if");}
[>][-][<] {printf("else");}
%%
