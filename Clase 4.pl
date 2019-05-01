valioso(oro).
mujer(ana).
mujer(alice).
mujer(victoria).
tiene(juan, oro).
padre(juan, maria).
presta(libro, juan, maria).
presta(lapiz, juan, pedro).
presta(borrador, pedro, juan).
varon(albert).
varon(edward).
padres(edward, victoria, albert).
padres(alice, victoria, albert).
hermana_de(X,Y):-mujer(X),padres(X,A,B),padres(Y,A,B), not(X=Y).


