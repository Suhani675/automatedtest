%{
    int word_count = 0;   // To count words
    int char_count = 0;   // To count characters
    int space_count = 0;  // To count spaces
%}

%%

[ \t]+             { space_count += yyleng; } // Count spaces and tabs
[a-zA-Z0-9]+       { word_count++; char_count += yyleng; } // Count words and characters
.                  { char_count++; } // Count any other character
\n {return 0;}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter the input text: ");
    yylex();

    // Print the results
    printf("Number of words: %d\n", word_count);
    printf("Number of characters: %d\n", char_count);
    printf("Number of spaces: %d\n", space_count);

    return 0;
}
