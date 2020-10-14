
%--------------------------------------------------------%
%Analizar: Funcion para buscar la palabra clave R0 de una oracion S0
analizar(S0,R0):-unlist(R,R0),
		remover(.,S0,S),
                oracion(S,[], R).

analizar(S0,R0):-unlist(R,R0),
		remover(.,S0,S),
                oracion2(S,[], R).

%---------------------------------------------------------%
%Remover: Remueve el ultimo elemento de una lista.

remover(X, [X|Xs], Xs).
remover(X, [Y|Ys], [Y|Zs]):-
remover(X, Ys, Zs).


%---------------------------------------------------------%
%Unlist: Seca el primer elemento de la lista.
unlist([X|_],X):-!.


%---------------------------------------------------------%
%Oracion: Obtiene la palabra clave de las oraciones correctas


%Cerca de sanpedro
oracion(S0,S,R):-
    adjetivos(S0,S1),
    proposicion(S1,S2),
    sintagma_nominal2(S2, S,R).

%Me gustaria cerca de sanpedro
oracion(S0,S,R):-
    pronombre(S0, S1),
    sintagma_verbal2(S1, S2),
    adjetivos(S2,S3),
    proposicion(S3,S4),
    sintagma_nominal2(S4, S,R).

%Algo cerca de sanpedro
oracion(S0,S,R):-
    sustantivo(S0,S1),
    adjetivos(S1,S2),
    proposicion(S2,S3),
    sintagma_nominal2(S3, S,R).

%Me gustaria algo cerca de sanpedro
oracion(S0,S,R):-
    pronombre(S0, S1),
    sintagma_verbal2(S1, S2),
    sustantivo(S2,S3),
    adjetivos(S3,S4),
    proposicion(S4,S5),
    sintagma_nominal2(S5, S,R).

%El quiere pizza
oracion(S0,S, R) :-
    pronombre(S0, S1),
    sintagma_verbal(S1, S, R).


%La quiero de jamon
oracion(S0,S, R) :-
    sintagma_nominal(S0, S1),
    sintagma_verbal2(S1, S2),
    proposicion(S2,S3),
    sintagma_nominal2(S3, S, R).

%De jamon
%Para 8
%Para 8 personas
oracion(S0,S, R) :-
    proposicion(S0,S1),
    sintagma_nominal2(S1, S, R).

%Hamburguesa
oracion(S0,S, R) :-
    sintagma_nominal2(S0, S, R).

%Mi mama quiere una hamburguesa
oracion(S0,S, R) :-
    sintagma_nominal(S0, S1),
    sintagma_verbal(S1, S, R).

%Deseo reservar para 5
%
oracion(S0,S, R) :-
    sintagma_verbal0(S0, S1),
    proposicion(S1,S2),
    adjetivos(S2,S),
    R=S2.

%Deseo reservar para 5 personas
oracion(S0,S, R) :-
    sintagma_verbal0(S0, S1),
    proposicion(S1,S2),
    adjetivos(S2,S3),
    sintagma_nominal(S3,S),
    R=S2.

%Hoy yo quiero pizza
oracion(S0,S, R) :-
    adverbio(S0, S1),
    pronombre(S1, S2),
    sintagma_verbal(S2, S,R).

%Hoy quiero pizza
oracion(S0,S, R) :-
    adverbio(S0, S1),
    sintagma_verbal(S1, S,R).

%Hoy en cartago
%Hoy a las 10pm
oracion(S0,S, R) :-
    adverbio(S0, S1),
    proposicion(S1, S2),
    sintagma_nominal2(S2, S,R).


%Mi papa hoy quiere pizza
oracion(S0,S, R) :-
    sintagma_nominal(S0, S1),
    adverbio(S1, S2),
    sintagma_verbal(S2, S, R).

%Hoy el hombre quiere pizza
oracion(S0,S, R) :-
    adverbio(S0,S1),
    sintagma_nominal(S1, S2),
    sintagma_verbal(S2, S, R).

%Somos 8
%somos 8 personas
oracion(S0,S, R) :-
    sintagma_verbal(S0, S, R).

%-----------------------------------------------------%

% Se define oracion2 como oracion pero con una interjeccion.

oracion2(S0,S, R) :-
    oracion(S0, S1, R),
    interjeccion(S1,S).


%-----------------------------------------------------%
%Definicion de Sintagmas

%Sintagmas nominales
sintagma_nominal(S0, S) :-
    determinante(S0, S1),
    sustantivo(S1, S).

sintagma_nominal(S0, S) :-
    sustantivo(S0, S).

sintagma_nominal2(S0, S, R) :-
    determinante(S0, S1),
    sustantivo2(S1,S),
    R=S1.

sintagma_nominal2(S0, S, R) :-
    adjetivos(S0, S1),
    sustantivo(S1,S),
    R=S0.

sintagma_nominal2(S0, S, R) :-
    adjetivos(S0, S),
    R=S0.

sintagma_nominal2(S0, S,R) :-
    sustantivo2(S0,S),
    R=S0.

%Sintagmas verbales

sintagma_verbal0(S0, S) :-
    verbo(S0, S1),
    sintagma_nominal(S1, S).

sintagma_verbal(S0, S, R) :-
    verbo(S0, S1),
    sintagma_nominal2(S1, S, R).

sintagma_verbal2(S0, S) :-
    verbo(S0, S).

%------------------------------------------------------%
% Definicion de Adverbios
adverbio([cerca|S], S).
adverbio([hoy|S], S).
adverbio([mucho|S], S).

%------------------------------------------------------%
% Definicion de determinantes

determinante([el|S], S).
determinante([la|S], S).
determinante([los|S], S).
determinante([las|S], S).

determinante([un|S], S).
determinante([una|S], S).
determinante([unos|S], S).
determinante([unas|S], S).

determinante([mi|S], S).
determinante([mis|S], S).
determinante([su|S], S).
determinante([sus|S], S).

determinante([algunos|S], S).
determinante([mucho|S], S).
determinante([muchos|S], S).
determinante([mucha|S], S).
determinante([muchas|S], S).

determinante([como|S],S).
%------------------------------------------------------%
% Definicion de pronombres

pronombre([yo|S], S).
pronombre([tu|S],S).
pronombre([el|S],S).
pronombre([ella|S],S).
pronombre([ellos|S],S).
pronombre([ellas|S],S).
pronombre([nosotros|S],S).
pronombre([nosotras|S],S).
pronombre([me|S],S).
pronombre([nos|S],S).
pronombre([le|S],S).

%------------------------------------------------------%
% Definicion de proposicion

proposicion([de|S], S).
proposicion([a|S], S).
proposicion([en|S], S).
proposicion([para|S], S).


%------------------------------------------------------%
% Definicion de Sustantivos

%Se dejan en blanco porque se admiten infinitas posibilidades, se
%controla mediante la posicion en a oracion

sustantivo([_|S], S).
sustantivo2([Y|S],S):-not((verbo([Y],[]);
                          adverbio([Y],[]);
                          proposicion([Y],[]);
                          adjetivos([Y],[]);
                          determinante([Y],[]);
                          pronombre([Y],[]))).

%------------------------------------------------------%
% Definicion de Verbos

verbo_aux([somos|S], S).
verbo_aux([quiero|S], S).
verbo_aux([quiere|S], S).
verbo_aux([queremos|S], S).
verbo_aux([quisiera|S], S).
verbo_aux([quisieramos|S], S).
verbo_aux([deseamos|S], S).
verbo_aux([deseo|S], S).
verbo_aux([desea|S], S).
verbo_aux([gustaria|S],S).

verbo([S0,beber|S],S):-verbo_aux([S0],[]).
verbo([S0,comer|S],S):-verbo_aux([S0],[]).
verbo([S0,tomar|S],S):-verbo_aux([S0],[]).
verbo([S0,pedir|S],S):-verbo_aux([S0],[]).
verbo(S0,S):-verbo_aux(S0,S).



%------------------------------------------------------%
% Definicion de adjetivos


adjetivos([M|S],S):-integer(M).
adjetivos([cerca|S],S).
adjetivos([lejos|S],S).


%-----------------------------------------------------%
% Definicion de interjeccion

interjeccion([gracias|S],S).
interjeccion([por,favor|S],S).
