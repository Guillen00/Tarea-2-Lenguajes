%----------------------Incluir Archivos--------------------------
:- [bnf,bd].
%----------------------Listas-------------------------------------
saludo:- write('Hola!!! �Qu� se te antoja comer hoy?'),
         write('\n').

verificar(X):- member(X,[pizza,hamburguesa,papas,calzone,tacos,espagueti]).


%----------------------Patrones-----------------------------------
patron([hoy,quiero,comer,X|_],X):- !.
patron([hoy,me,gustaria,comer,X|_],X):- !.
patron([quiero,comer,X|_],X):- !.
patron([se,me,antoja,comer,X|_],X):- !.
patron([se,me,antoja,una,X|_],X):- !.
patron([se,me,antoja,un,X|_],X):- !.
patron([],_):-  write('Aun no contamos con algun registro de esa comida.').

%--------------------Preguntas------------------------------------
pregunta(pizza,[['En que zona del pa�s desea su reservaci�n?'],
              ['Para cuantas personas desea su pizza?']]).


%---------------------imprime quien habla-------------------------
imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': ') .
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': ' ).

nombre_bot('RestauranTEC').
n_usuario('Usuario').


inicio:-
    imprimir_usuario(bot),
    saludo,
    conversacion.

conversacion:-
    imprimir_usuario(usuario),
    readln(S),
    append(S,[],M),
    generar_respuesta(M).

generar_respuesta(M):-
     %patron(M,R),
    analizar(M,R),
    pregunta(R,[X|_]), imprimir_lista(X),readln(D),
    pregunta(R,[_|Y]), imprimir_lista(Y),readln(E),
    leer(E,Z),
    leer(D,V),
    dondeComer(A,R,V,Z),

     write(A)
     .
%(verificar(R) -> pregunta(R,[X|_]), imprimir_lista(X),readln(D),
 %    pregunta(R,[_|Y]), imprimir_lista(Y),readln(E),
  %  dondeComer(A,R,D,E),
   %  write(A)
    %; write('Aun no contamos con algun registro de esa comida.')   ).
leer([X|_],X).

% imprimir_lista/1
% Imprime una lista (oración) sin corchetes ni comas.
imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).
