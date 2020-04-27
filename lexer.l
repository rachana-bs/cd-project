%{ 
    #include "y.tab.h"
%}

%option yylineno

%%
"FOR"                                   {return FOR;}
"TO"                                    {return TO;}
"BEGIN"                                 {return keyBEGIN;}
"END"                                   {return keyEND;}
"INTEGER"                               {return INT;}
"REAL"                                  {return REAL;}
"STRING"                                {return STRING;}
[A-Z]                                   {return alp;}
" "                                     {return SP;}
"="                                     {return eq;}
":"                                     {return CN;}
","                                     {return CM;}
[+]?[-]?[0-9]+                          {return int1;}
[+]?[-]?[0-9]*\.[0-9]+(E[+-]?[0-9]+)?   {return real;}
["][a-zA-Z1-9 ]+["]                     {return string;}
"PRINT"                                 {return PRINT;}
.                                       {return yytext[0];}
\n                                      {return NL;}
%%

int yywrap()
{
return 1;
}

