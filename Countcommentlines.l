%{
    #include <stdio.h>
    #include <string.h>

    int single_line_comments = 0;  // Count single-line comments
    int multi_line_comments = 0;   // Count multi-line comment blocks
%}

%%

"//".*              { single_line_comments++; }  // Match single-line comments
"/*"(.|\n)*?"*/"    { multi_line_comments++; }   // Match multi-line comments
.|\n                ;  // Match all other characters and do nothing

%%

int yywrap() {
    return 1;  // Ensures that we don't need EOF
}

int main() {
    char input[1024];  // Buffer for input

    printf("Enter C code (type 'exit' to quit):\n");

    // Keep reading lines until the user types 'exit'
    while (1) {
        printf("> ");
        if (fgets(input, sizeof(input), stdin) == NULL) {
            break;  // Exit on error or EOF
        }

        // Exit condition if the user types 'exit'
        if (strncmp(input, "exit", 4) == 0) {
            break;
        }

        // Scan the input string and process it with Flex
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yylex();
        yy_delete_buffer(buffer);
    }

    // Print the results after reading all lines
    printf("Number of single-line comments: %d\n", single_line_comments);
    printf("Number of multi-line comment blocks: %d\n", multi_line_comments);

    return 0;
}
