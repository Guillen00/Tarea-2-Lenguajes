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
    append(S,[' n'],M),
    generar_respuesta(M).

generar_respuesta(M):-
    patron(M,R),
    (verificar(R) -> write('De que tamano lo deseas'); write('Aun no contamos con algun registro de esa comida.')   ).

:- inicio.
