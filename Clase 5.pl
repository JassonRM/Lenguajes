miembro(X,[X|_]).
miembro(X,[_|Y]):-miembro(X,Y).

inversa(O, I):-inversa(O, [], I).
inversa([], Lista, Lista).
inversa([H|T], Lista, I):-inversa(T, [H|Lista], I).

longitud([], 0).
longitud([_|L],Y):-longitud(L,X), Y is X+1.
%longitud([_|L],X+1):-longitud(L,X).
