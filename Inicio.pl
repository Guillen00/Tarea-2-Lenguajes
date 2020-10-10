%----------------------Incluir Archivos--------------------------
:- [bnf,bd].
%----------------------Listas-------------------------------------
saludo:- write('Hola!!! ¿Qué se te antoja comer hoy?'),
         write('\n').

verificar(X):- member(X,[pizza,hamburguesa,papas,calzone,tacos,espagueti,lomo,chicharron,costillas,alitas,casado,galloPinto,lazana,pollofrito,salchipapas,risoto,carpachio,tortaHuevo,ollaCarne]).


%----------------------Patrones-----------------------------------
patron([hoy,quiero,comer,X|_],X):- !.
patron([hoy,me,gustaria,comer,X|_],X):- !.
patron([quiero,comer,X|_],X):- !.
patron([se,me,antoja,comer,X|_],X):- !.
patron([se,me,antoja,una,X|_],X):- !.
patron([se,me,antoja,un,X|_],X):- !.
patron([],_):-  write('Aun no contamos con algun registro de esa comida.').

%--------------------Preguntas------------------------------------
pregunta([['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea su reservación'],
               ['Que bebida desea para acompañar']]).

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
    (verificar(R) ->
    pregunta([X|_]),imprimir_usuario(bot),
    imprimir_lista(X),
    imprimir_usuario(usuario),
    readln(D),analizar(D,T),

    pregunta([_|Y]), leer(Y,C),imprimir_usuario(bot),
    imprimir_lista(C),
    imprimir_usuario(usuario),
    readln(E),analizar(E,Q),

    pregunta([_|Y]), leerfinal(Y,S),leer(S,Z),imprimir_usuario(bot),
    imprimir_lista(Z),
    imprimir_usuario(usuario),
    readln(B),analizar(B,N),
    %leer(Q,Z),

    %leer(T,V),

    (dondeComer(A,R,T,N,Q) ->
    imprimir_usuario(bot),
    write('Te recomendamos el restaurante '),write(A),write('\n'),
    write(' Ubicado:  '),
    direccion(A,L),write(L),write('\n'),
    write('Su reservación ha sido tramitada.'),write('\n'),
    dispocisiones(A,I),write(I)
     ;write('Aun no contamos con algun registro de algun restaurante con esas especificaciones.') )
    ;
    write('Aun no contamos con algun registro de esa comida.')).


leer([X|_],X).
leerfinal([_|X],X).

% imprimir_lista/1
% Imprime una lista (oracion) sin corchetes ni comas.
imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).
