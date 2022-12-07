# EP3 - Implementação com CLisp

Use CLisp (GNU) para implementar as funções definidas a seguir.
A letra c. foi resolvida em sala (01/11).

(Obs.: Prefixo MY usado para não sobrescrever a função do CLisp).

- a. MYLIST, usando apenas CONS, FIRST e REST

- b. MYAPPEND, usando apenas CONS, FIRST e REST

- c. MYLENGTH: Retorna o número de elementos da lista passada como argumento.

- d. MYNTHCDR: Retira “n” elementos do início da lista passada como argumento. Se
“n” for maior ou igual ao número de elementos da lista, nthcdr retorna NIL.

Ex.: (nthcdr 2 ‘(a b c)) retorna a lista (C)

- e. MYBUTLAST: Retira “n” elementos do final da lista passada como argumento. Se
“n” for maior ou igual ao número de elementos da lista, butlast retorna NIL.

Ex.: (butlast ‘(a b c) 2) retorna a lista (A)

- f. MYLAST: Retira todos os elementos da lista passada como argumento, exceto o
último.

Ex.: (last ‘(a b c d e f)) retorna a lista (f).

- g. MYREVERSE: retorna a lista passada como argumento com elementos na ordem
reversa.

Ex.: (reverse ‘((a b) c d ) retorna a lista (D C (A B))

- h. MYMEMBER: predicado que testa se o primeiro argumento é um elemento do
segundo argumento. MEMBER retorna o que resta da lista quando o elemento é
encontrado.

Ex.: (member ‘mae ‘(minha mae e eu)) retorna (mae e eu)


