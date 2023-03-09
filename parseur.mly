%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PVIRGULE EOL
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS
%type <unit> main expression
%start main
%%
main:
commande EOL
{}
;
commande:
expression PVIRGULE
{}
;
expression:
expression PLUS expression
{}
| expression MINUS expression
{}
| expression TIMES expression
{}
| expression DIVIDE expression
{}
| GPAREN expression DPAREN
{}
| MINUS expression %prec UMINUS
{}
| NUMBER
{}
;
