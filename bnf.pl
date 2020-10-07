analizar(S0,R0):-unlist(R,R0),
                oracion(S0,[], R).

unlist([X|_],X):-!.

%El quiere pizza
oracion(S0,S, R) :-
    pronombre(S0, S1),
    sintagma_verbal(S1, S, R).

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

%Sintagmas

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

sintagma_nominal2(S0, S,R) :-
    sustantivo2(S0,S),
    R=S0.

sintagma_verbal(S0, S, R) :-
    verbo(S0, S1),
    sintagma_nominal2(S1, S, R).



% Adverbios
adverbio([cerca|S], S).
adverbio([hoy|S], S).
adverbio([muy|S], S).
adverbio([bastante|S], S).
adverbio([mucho|S], S).
adverbio([no|S], S).
adverbio([si|S], S).

%Determinantes

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

determinante([beber|S], S).
determinante([comer|S], S).

determinante([algunos|S], S).
determinante([pocos|S], S).
determinante([varios|S], S).
determinante([mucho|S], S).
determinante([muchos|S], S).
determinante([mucha|S], S).
determinante([muchas|S], S).

% Pronombres
pronombre([yo|S], S).
pronombre([tu|S],S).
pronombre([el|S],S).
pronombre([ella|S],S).
pronombre([ellos|S],S).
pronombre([ellas|S],S).
pronombre([nosotros|S],S).
pronombre([nosotras|S],S).

pronombre([me|S], S).
pronombre([te|S], S).
pronombre([se|S], S).
pronombre([nos|S], S).
pronombre([os|S], S).

%Proposicion
proposicion([de|S], S).
proposicion([a|S], S).
proposicion([en|S], S).
proposicion([para|S], S).


%Sustantivos
sustantivo([_|S], S).

sustantivo2([_|S],S).
sustantivo2([italiano|S], S).
sustantivo2([rapida|S], S).
sustantivo2([pizza|S], S).
sustantivo2([calzone|S], S).
sustantivo2([espaguetti|S], S).
sustantivo2([hamburguesa|S], S).
sustantivo2([hamburguesa|S], S).
sustantivo2([tacos|S], S).
sustantivo2([papas|S], S).
sustantivo2([jamon|S], S).
sustantivo2([suprema|S], S).
sustantivo2([hawaina|S], S).
sustantivo2([pepperoni|S], S).
sustantivo2([jamon|S], S).
sustantivo2([cartago|S], S).
sustantivo2([sanpedro|S], S).
sustantivo2([alajuela|S], S).

%Verbos

verbo([somos|S], S).
verbo([quiero|S], S).
verbo([quiere|S], S).
verbo([queremos|S], S).
verbo([deseamos|S], S).
verbo([deseo|S], S).
verbo([desea|S], S).


%Adjetivos

adjetivos([M|S],S):-integer(M).
