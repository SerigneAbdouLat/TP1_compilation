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
| (['0'-'9']+)('.'['0'-'9']+)
{ NUMBER }
| '+'
{ PLUS }
| '-'
{ MINUS }
| '*'
{ DIVIDE }
| '/'
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
