%2.1. Hecho para la figura mostrada
%progenitor(Padre, Hijo)
progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

%2.2. Reglas para determinar el abuelo y bisabuelo
abuelo(X, Y):-progenitor(X, Z), progenitor(Z, Y).
bisabuelo(X, Y):-progenitor(X, Z), abuelo(Z, Y).

%Para determinar el abuelo y bisabuelo de Jaime se pregunta lo siguiente
%abuelo(Abuelo, jaime).
%bisabuelo(Bisabuelo, jaime).

%2.3. Hechos para las frases mostradas
valioso(oro).
mujer(ana).
tiene(juan, oro).
padre(juan, maria).
presta(libro, juan, maria).
presta(lapiz, juan, pedro).
presta(borrador, pedro, juan).

%2.4. Hechos mostrados
varon(albert).
varon(edward).
mujer(alice).
mujer(victoria).
padres(edward, victoria, albert).
padres(alice, victoria, albert).
%Regla para determinar si X es hermana de Y
hermana_de(X,Y):-mujer(X),padres(X,A,B),padres(Y,A,B), not(X=Y).

% 2.5. Hechos y deducciones para la función miembro que comprueba si el
% valor pertenece a la lista miembro(valor, lista)
miembro(X,[X|_]).
miembro(X,[_|Y]):-miembro(X,Y).

% 2.6.Hechos y deducciones para la función inversa que comprueba si O e
% I son listas inversas
inversa(O, I):-inversa(O, [], I).
inversa([], Lista, Lista).
inversa([H|T], Lista, I):-inversa(T, [H|Lista], I).

%2.7.Clausulas para la funcion longitud que comprueba si L es la longitud de la Lista
%longitud(Lista, L)
longitud([], 0).
longitud([_|L],Y):-longitud(L,X), Y is X+1.

%2.8.Hechos para los acontecimientos ocurridos en un año determinado
%acontecimiento(año, evento)
acontecimiento(2012, "Se acabó el mundo").
acontecimiento(2007, "Anuncian el primer iPhone").
acontecimiento(2018, "Muere Stephen Hawking").

% Clausula para preguntar al usuario una fecha y devolver el evento asociado
buscar:-write("Ingrese el año a buscar"),nl,read(Año),acontecimiento(Año, X), write(X).

hola:-write("WOw").

ejemplo:-abuelo(Abuelo, jaime), write(Abuelo), nl,
    bisabuelo(Bisabuelo, jaime), write(Bisabuelo), nl,
    hermana_de(Hermana, edward), write(Hermana), nl,
    miembro(b, [a, b, c])->write("Es miembro"), nl,
    inversa([a, b, c], Inversa), write(Inversa), nl,
    longitud([a, b, c, d, e, f], L), write(L), nl,
    buscar.
