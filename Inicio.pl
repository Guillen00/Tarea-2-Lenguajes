%----------------------Incluir Archivos--------------------------
:- [bnf,bd].
%----------------------Listas-------------------------------------
%Saludo Inicial
saludo:- write('Hola!!! ¿Qué se te antoja comer hoy?'),
         write('\n').

% Funcion para verificar que el elemento inf¿gresado esta en la lista
% interior
verificar(X):- member(X,[pizza,hamburguesa,papas,calzone,tacos,espagueti,lomo,chicharron,costillas,alitas,casado,galloPinto,lazana,pollofrito,salchipapas,risoto,carpachio,tortaHuevo,ollaCarne]).


%--------------------Preguntas------------------------------------
%Se elige para que el usuario sepa que ingresar en el momento siguiente
pregunta([['En que zona del país desea su reservación?'],
              ['Para cuantas personas desea su reservación'],
               ['Que bebida desea para acompañar']]).

%---------------------imprime quien habla-------------------------
%Imprime quien esta hablando si el usuario o el bot
imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': ') .
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': ' ).

nombre_bot('RestauranTEC').
n_usuario('Usuario').

%Inicia con un saludo y luego se dirije a la funcion de conversacion
inicio:-
    imprimir_usuario(bot),
    saludo,
    conversacion.

% Espera la respuesta del usuario para saber que desea comer hoy y asi
% generar una respuesta
conversacion:-
    imprimir_usuario(usuario),
    readln(S),
    append(S,[],M),
    generar_respuesta(M).

% Esta funion recibe la oracion que el usuario da, y hace comprovaciones
% para determinar si el alimento que busca esta en la base de datos y
% con esto genera respuestas , si esta , hace una serie de preguntas con
% las cuales se le brindara un restaurante con respecto a lo que
% responda el usuario, si no esta imprime un mensaje de que aun no se
% tiene registro de esa comida.
generar_respuesta(M):-
     %patron(M,R),
    analizar2(M,R),
    (verificar(R) ->
    pregunta([X|_]),imprimir_usuario(bot),
    imprimir_lista(X),
    imprimir_usuario(usuario),
    readln(D),analizar2(D,T),

    pregunta([_|Y]), leer(Y,C),imprimir_usuario(bot),
    imprimir_lista(C),
    imprimir_usuario(usuario),
    readln(E),analizar2(E,Q),

    pregunta([_|Y]), leerfinal(Y,S),leer(S,Z),imprimir_usuario(bot),
    imprimir_lista(Z),
    imprimir_usuario(usuario),
    readln(B),analizar2(B,N),
    (valorarPizza(R) -> imprimir_usuario(bot),  write('De que sabor desea su pizza'),write('\n'),
     imprimir_usuario(usuario),
     readln(U),analizar2(U,O); O='no hay nada'),


    (dondeComer(A,R,T,N,Q,O) ->
    imprimir_usuario(bot),
    write('Te recomendamos el restaurante '),write(A),write('\n'),
    write(' Ubicado:  '),
    direccion(A,L),write(L),write('\n'),
    write('Su reservación ha sido tramitada'),write('\n'),
     dispocisiones(A,I),write(I)
     ;write('Aun no contamos con algun registro de algun restaurante con esas especificaciones.') )
    ;
    write('Aun no contamos con algun registro de esa comida.')).

%Lee el primer elemento de una lista
leer([X|_],X).
%lee el segundo elemento de una lista
leerfinal([_|X],X).
%valora la palabra ingresada es igual a pizza
valorarPizza(R):- R=pizza.


% Imprime una lista (oracion) sin corchetes ni comas.
imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).


% Llama a analizar la sintaxis de las oraciones para encontrar la
% palabra relevante, vuelve a preguntar en caso de error en la sintaxis.
analizar2(S0, R0):- analizar(S0,R0);
                   imprimir_usuario(bot),
                   write('\n       ¡Vaya no entendi!\n       Trata de usar el lenguaje explicado en el manual de usuario\n'),
                   imprimir_usuario(usuario),
                   readln(S),
                   append(S,[],M),
                   analizar2(M,R0).

