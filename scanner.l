%{
#include <stdlib.h>
#include "tree.h"
#include "y.tab.h"
void yyerror(char *);
%}
%%

true {
    yylval.bValue = true;
    return BOOL;
}
false {
    yylval.bValue = false;
    return BOOL;
}
undefined {
    yylval.bValue = false;
    return BOOL;
}
bool {
//    yylval.text = yytext;
    return TYPE;
}
int {
    return TYPE;
}
short {
//    yylval.text = yytext;
    return TYPE;
}
vector_of {
//    yylval.text = yytext;
    return ARRAY;
}
set {
    return SET;
}

sizeof {
    return SIZEOF;
}

add {
    return PLUS;
}
sub {
    return MINUS;
}
smaller {
    return L;
}
larger {
    return G;
}
not {
    return UMINUS;
}
or {
    return OR;
}
and {
    return AND;
}
begin {
    return BEG;
}
end {
    return ENDL;
}
"do" return DO;
"while" return WHILE;
"if" return IF;
"then" return THEN;
"else" return ELSE;
"print" return PRINT;
"function" return FUNCTION;

[a-zA-Z][a-zA-Z0-9]* {
    yylval.sIndex = *yytext - 'a';
    return VARIABLE;
}
[0-9]+ {
    yylval.iValue = atoi(yytext);
    return INTEGER;
}
[-()<>=+*/;:{}.] {
 return *yytext;
 }
">=" return GE;
"<=" return LE;
"==" return EQ;
"!=" return NE;

[ \t\n\r]+ ; /* ignore whitespace */
. yyerror("Unknown character");
%%
int yywrap(void) {
 return 1;
}