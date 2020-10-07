
restaurante(bellaItalia).
restaurante(mcBurguesa).
restaurante(italianisimo).


%-------------------------------------------------------------------
menu(bellaItalia,italiano).
menu(italianisimo,italiano).
menu(mcBurguesa,comidaRapida).

%-------------------------------------------------------------------


comida(bellaItalia,pizza).
comida(italiano,calzone).
comida(italiano,espagueti).
comida(comidaRapida,hamburguesas).
comida(comidaRapida,tacos).
comida(comidaRapida,papas).

%-------------------------------------------------------------------

tipo_de_pizza(jamon_queso,bellaItalia).
tipo_de_pizza(suprema,bellaItalia).
tipo_de_pizza(hawaina,bellaItalia).
tipo_de_pizza(pepperoni,italianisimo).

%------------------------------------------------------------------

capacidad(bellaItalia,10).
capacidad(italianisimo,50).
capacidad(mcBurguersa,20).

%------------------------------------------------------------------

lugar(italianisimo,alajuela).
lugar(bellaItalia,sanPedro).
lugar(mcBurguesa,cartago).
%------------------------------------------------------------------

dondeComer(A,C,D,E) :- restaurante(A),comida(A,C), lugar(A,D),capacidad(A,Z),Z>E.
