%token <int> NUMBER
%token NUMBER PLUS MINUS TIMES GPAREN DPAREN PVIRGULE EOL
%left PLUS MINUS
%left TIMES
%nonassoc UMINUS
%type <int> main expression
%start main
%%
main:
commande EOL
{ $1 }
;
commande:
expression PVIRGULE
{ $1 }
;
expression:
expression PLUS expression
{ $1+$3 }
| expression MINUS expression
{ $1-$3 }
| expression TIMES expression
{ $1*$3 }
| GPAREN expression DPAREN
{ $2 }
| MINUS expression %prec UMINUS
{ -$2 }
| NUMBER
{ $1 }
;
