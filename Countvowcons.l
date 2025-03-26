%option noyywrap
%{
#include <stdio.h>
int vowels = 0, consonants = 0;
%}

%%
[aAeEiIoOuU]          { vowels++; }       // Match vowels
[a-zA-Z]              { consonants++; }   // Match consonants (non-vowel alphabets)
[^a-zA-Z\n]+          ;                  // Ignore non-alphabetic characters
\n                    { return 0; }      // End processing on newline

%%

int main() {
    printf("Enter a string: ");
    yylex();
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);
    return 0;
}

