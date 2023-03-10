%{
open AST
%}
%token <int> NUMBER
%token NUMBER PLUS MINUS TIMES GPAREN DPAREN PVIRGULE EOL
%left PLUS MINUS
%left TIMES
%nonassoc UMINUS
%type <AST.commande_a> main commande
%type <AST.expression_a> expression
%start main
%%
main:
commande EOL
{ $1 }
;
commande:
expression PVIRGULE
{ Expr($1)}
;
expression:
expression PLUS expression
{ Plus ($1,$3) }
| expression MINUS expression
{ Moins($1,$3) }
| expression TIMES expression
{ Mult ($1,$3) }
| GPAREN expression DPAREN
{ $2 }
| MINUS expression %prec UMINUS
{ Neg $2}
| NUMBER
{ Num($1) }
;

