%{
#include <stdio.h>
int identifiers = 0;
int operators = 0;
int invalid_chars = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { 
    printf("Identifier: %s\n", yytext); 
    identifiers++; 
}

[+\-*/=()]  { 
    printf("Operator: %s\n", yytext); 
    operators++; 
}

[0-9]+ { 
    /* Ignoring numeric literals */ 
}

[\n] {
    return 0;
}

[ \t]+   { 
    /* Ignoring whitespaces */ 
}

.  { 
    printf("Invalid Character: %s\n", yytext); 
    invalid_chars++; 
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter an arithmetic expression:\n");
    yylex();
    printf("\ntotal:\n");
    printf("Total no of Identifiers: %d\n", identifiers);
    printf("Total no of Operators: %d\n", operators);
    printf("Total no of Invalid Characters: %d\n", invalid_chars);
    return 0;
}