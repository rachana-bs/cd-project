%{
    #include<stdio.h>
    #include<stdlib.h>
    extern FILE *yyin;
    extern int yylineno;
%}

%token FOR TO keyBEGIN keyEND INT REAL STRING eq alp int1 real string PRINT NL SP CM CN
%left ','

%%
s:keyBEGIN 
NL prnt
NL declaration
initialisation  
NL forloop NL
prnt NL
keyEND NL    {printf("Input accepted\n"); exit(0);};
declaration:dataType SP variable NL declaration| ;
dataType:INT|REAL|STRING;
variable:variable CM variable |alp;
initialisation:alp CN eq val NL initialisation| ;
val:int1|real|string;
forloop:FOR SP alp CN eq int1 SP TO SP int1;
prnt:PRINT SP string;
%%

int yyerror(char *s)
{
  printf("Invalid input\n");
  printf("Line %d:%s\n",yylineno,s);
  exit(0);
}

int main(int argc,char*argv[])
{
  yyin= fopen(argv[1],"r");
  yyparse();
  fclose(yyin);
  return 0;
}
