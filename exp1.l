%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}

/* Rules Section */
%%
[a-zA-Z0-9]+    { i++; }        /* Rule for counting words */
\n              { printf("%d\n", i); i = 0; } /* Print the word count on a newline */
%%

int yywrap(void) {
    return 1; /* Indicate end of input */
}

int main() {
    /* The function that starts the analysis */
    yylex();
    return 0;
}