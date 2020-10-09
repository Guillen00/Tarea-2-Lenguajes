%----------------------Incluir Archivos--------------------------
:- [bnf,bd].
%----------------------Listas-------------------------------------
saludo:- write('Hola!!! ¿Qué se te antoja comer hoy?'),
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
pregunta(pizza,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea su pizza?']]).

pregunta(papas,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea papas?']]).

pregunta(hamburguesa,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea hamburguesa?']]).

pregunta(calzone,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea calzone?']]).

pregunta(tacos,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea tacos?']]).

pregunta(espagueti,[['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea espagueti?']]).

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
    pregunta(R,[X|_]),imprimir_usuario(bot),
    imprimir_lista(X),
    imprimir_usuario(usuario),
    readln(D),analizar(D,T),
    pregunta(R,[_|Y]), leer(Y,C),imprimir_usuario(bot),
    imprimir_lista(C),
    imprimir_usuario(usuario),
    readln(E),analizar(E,Q),
    %leer(Q,Z),

    %leer(T,V),
    dondeComer(A,R,T,Q),
    imprimir_usuario(bot),
    write('Te recomendamos el restaurante '),write(A),write(' Ubicado en '),
    write(T),write('\n'),
    write('Su reservación ha sido tramitada.'),write('\n'),write('Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten burbujas y durante la espera se debe utilizar mascarilla.').

%(verificar(R) -> pregunta(R,[X|_]), imprimir_lista(X),readln(D),
 %    pregunta(R,[_|Y]), imprimir_lista(Y),readln(E),
  %  dondeComer(A,R,D,E),
   %  write(A)
    %; write('Aun no contamos con algun registro de esa comida.')   ).
leer([X|_],X).

% imprimir_lista/1
% Imprime una lista (oraciÃ³n) sin corchetes ni comas.
imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).
