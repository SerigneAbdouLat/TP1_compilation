(*fichier lexeur.mll *)
{
open Parseur
exception Eof
exception TokenInconu
}
rule token = parse
[' ' '\t' '\r']
{ token lexbuf }
| ['\n']
{ EOL }
| ['0'-'9']+
as lexem
{ NUMBER(float_of_string lexem) }

| "+."
{ PLUS }
| "-."
{ MINUS }
| "*."
{ TIMES }
| '('
{ GPAREN }
| ')'
{ DPAREN }
| eof
{ raise Eof }
|';'
{PVIRGULE}
| _
{ raise TokenInconu }
